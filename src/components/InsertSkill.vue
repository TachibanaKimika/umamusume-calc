<!--
 * @Author: your name
 * @Date: 2021-06-26 00:39:37
 * @LastEditTime: 2021-08-09 01:30:13
 * @LastEditors: Akarichan
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\components\InsertSkill.vue
-->
<template>
    <div class="InsertSkill">
        <el-radio-group v-model="skillOptions.rare">
            <el-radio-button label="0">金スキル/固有</el-radio-button>
            <el-radio-button label="1">非金スキル</el-radio-button>
        </el-radio-group>
        <el-radio-group v-model="skillOptions.long">
            <el-radio-button label="0">制限なし</el-radio-button>
            <el-radio-button label="1">短距離</el-radio-button>
            <el-radio-button label="2">マイル</el-radio-button>
            <el-radio-button label="3">中距離</el-radio-button>
            <el-radio-button label="4">長距離</el-radio-button>
            <el-radio-button label="5">ダート</el-radio-button>
        </el-radio-group>
        <el-radio-group v-model="skillOptions.sakusen">
            <el-radio-button label="0">制限なし</el-radio-button>
            <el-radio-button label="1">追込</el-radio-button>
            <el-radio-button label="2">差し</el-radio-button>
            <el-radio-button label="3">先行</el-radio-button>
            <el-radio-button label="4">逃げ</el-radio-button>
        </el-radio-group>
        <el-radio-group v-model="skillOptions.type">
            <el-radio-button label="0">橙スキル</el-radio-button>
            <el-radio-button label="1">青スキル</el-radio-button>
            <el-radio-button label="2">緑スキル</el-radio-button>
            <el-radio-button label="3">固有スキル</el-radio-button>
            <el-radio-button label="4">赤スキル</el-radio-button>
        </el-radio-group>
        <el-row>
            <el-col :span='4'>
                <el-input v-model="skillOptions.name" style="width:auto"></el-input>
            </el-col>
            <el-col :span='3'>
                <el-input-number v-model="skillOptions.pt" :step="10"></el-input-number>
            </el-col>
            <el-col :span='14'>
                <el-input v-model="skillOptions.dsc" autosize placeholder="効果" style="width:80%"></el-input>
            </el-col>
            <!-- <el-col :span='4'>
                <el-input v:model="sqlcon.username" placeholder="用户名"></el-input>
            </el-col>
            <el-col :span='4'>
                <el-input v:model="sqlcon.userpasswd" placeholder="密码"></el-input>
            </el-col> -->
            <el-col :span='3'>
                <el-button @click="updateSkill">Submit</el-button>
            </el-col>
        </el-row>

        <!-- <div class="sqlinfo">
            <el-input v:model="sqlcon.username" placeholder="用户名" style="width:30%"></el-input>
            <el-input v:model="sqlcon.userpasswd" placeholder="密码" style="width:30%"></el-input>
            <el-button @click="updateSkill">Submit</el-button>
        </div> -->


        <div class="skillTotal">
            <div :key="tag.id" v-for="tag in mySkill" :disable-transitions="false" style="margin:10px" :class="'skill '+ renderSkill(tag)">
                <el-popover
                placement="top-start"
                :title="tag.skill_name+getSkillAtb(tag)"
                width="200"
                trigger="hover"
                :content="tag.skill_dsc">
                <div slot="reference"><img :src="getSkillImgsrc(tag)" alt="">{{tag.skill_name}}</div>
                  </el-popover>

            </div>
        </div>
    </div>
</template>

<script>
    import {
        qurSql, qurSqlPromise
    } from '../jsfile/api/con2sql.js'

    import '../assets/css/skill.css'

    export default {
        name: 'InsertSkill',
        data() {
            return {
                sqlcon: {
                    username: 'akarichan',
                    userpasswd: 'akariChan@0721',
                    database: 'umamusume-pbl',
                },
                skillOptions: {
                    name: '',
                    type: 0,
                    rare: 0,
                    long: 0,
                    sakusen: 0,
                    pt: 160,
                    dsc: '',
                },
                mySkill: [],


                skillOpt: [
                    {
                        name:'skill_type',
                        key:[0,1,2,3,4],
                        value:['','type_1_0','type_1_1','type_1_2','type_1_3']
                    },
                    {
                        name:'skill_race',
                        key:[0,1],
                        value:['type_2_0','type_2_1']
                    },
                    {
                        name:'skill_long',
                        key:[0,1,2,3,4,5],
                        //value:['无', '短', '英', '中', '长', '泥']
                        value:['', 'type_3_0', 'type_3_1', 'type_3_2', 'type_3_3', 'type_3_4']
                    },
                    {
                        name:'skill_sakusen',
                        key:[0,1,2,3,4],
                        //value:['无','追', '差', '先', '逃']
                    }
                ]
            }
        },
        methods: {
            async updateSkill() {
                
                
                if(this.user.group!='admin'){
                    console.log(this.user)
                    this.$message.error('该操作需要管理员权限')
                    return
                }
                if (await this.insertCheck()===false) {
                    return
                }

                let query =`insert into skill (skill_name, skill_type, skill_rare, skill_long, skill_sakusen, skill_pt, skill_dsc)
                            value ('${this.skillOptions.name}', ${this.skillOptions.type}, ${this.skillOptions.rare}, ${this.skillOptions.long}, ${this.skillOptions.sakusen}, ${this.skillOptions.pt}, '${this.skillOptions.dsc}')`
                console.log(query)
                qurSql(this.sqlcon, query, res => {

                    console.log(res)
                    this.$message('插入成功, affectedRows'+res.affectedRows)
                })

                this.mySkill.push({skill_name:this.skillOptions.name, skill_type:this.skillOptions.type, skill_rare:this.skillOptions.rare, skill_long:this.skillOptions.long, skill_sakusen:this.skillOptions.sakusen, skill_pt:this.skillOptions.pt, skill_dsc:this.skillOptions.dsc})
                this.skillOptions.name = ''
                // this.skillOptions.rare = 0
                this.skillOptions.long = 0
                this.skillOptions.sakusen = 0
                this.skillOptions.dsc = ''
            },

            async insertCheck() {
                if (this.skillOptions.name == '' || this.skillOptions.dsc == '') {
                    this.sendMsg('技能名或技能描述格式错误, 请重新输入', 'error')
                    return false
                }

                let query = `SELECT COUNT( * ) AS 'count' FROM skill WHERE skill_name='${this.skillOptions.name}'`
                let flag = await qurSqlPromise(this.sqlcon, query)
                // console.log(flag)
                if(flag[0].count == 0){
                    return true
                }else{
                    this.$message.error('插入失败, 有重复的技能')
                    return false
                }
            },

            getMySkill() {
                let query = `select * from skill`
                qurSql(this.sqlcon, query, res => {
                    this.mySkill = res
                })
            },

            sendMsg(Msg, type = 'success') {
                this.$message({
                    message: Msg,
                    type: type
                })
            },

            renderSkill(skill) {
                // console.log(skill)
                let skill_class = ``
                switch(skill.skill_type) {
                    case 0: skill_class = `yellowSkill`;break
                    case 1: skill_class = `blueSkill`;break
                    case 2: skill_class = `greenSkill`;break
                    case 3: skill_class = `colorfulSkill`;break
                }
                if(skill.skill_rare==0&&skill.skill_type!=3){
                    skill_class = `goldenSkill`
                }
                return skill_class
            },

            getSkillImgsrc(skill){
                let skill_img = ``
                switch(skill.skill_type) {
                    case 0: skill_img = `https://img.gamewith.jp/article_tools/uma-musume/gacha/i_skill3.png`;break
                    case 1: skill_img = `https://img.gamewith.jp/article_tools/uma-musume/gacha/i_skill6.png`;break
                    case 2: skill_img = `https://img.gamewith.jp/article_tools/uma-musume/gacha/i_skill1.png`;break
                    case 3: skill_img = `https://img.gamewith.jp/article_tools/uma-musume/gacha/i_skill3.png`;break
                    case 4: skill_img = `https://img.gamewith.jp/article_tools/uma-musume/gacha/i_skill49.png`;break
                }
                
                return skill_img
            },

            getSkillAtb(skill){
                switch(skill.skill_long){
                    case 1:return ' <短距離>'
                    case 2:return ' <マイル>'
                    case 3:return ' <中距離>'
                    case 4:return ' <長距離>'
                    case 5:return ' <ダート>'
                }
                switch(skill.skill_sakusen){
                    case 1:return ' <追込>'
                    case 2:return ' <差し>'
                    case 3:return ' <先行>'
                    case 4:return ' <逃げ>'
                }
                return ''
            }
        },
        mounted() {
            this.getMySkill()
        },
        computed: {
            user() {
                return this.$store.state.user
            },
            myUmaSkill(){
                return this.skillOptions.dsc.replace(/\n/g,'')
            }
        }
    }
</script>

<style scoped>
    .el-radio-group,
    .el-input-number,
    .el-input,
    .el-button {
        margin: 1vw;

    }

    .sqlinfo {
        display: inline;
        margin: 1vw;
    }
</style>