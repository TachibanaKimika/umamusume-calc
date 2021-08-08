<!--
 * @Author: your name
 * @Date: 2021-08-07 18:18:24
 * @LastEditTime: 2021-08-09 01:42:18
 * @LastEditors: Akarichan
 * @Description: In User Settings Edit
 * @FilePath: \.gitf:\My Repo\umamusume-calc\src\components\child\SelectSkill.vue
-->
<template>
    <div class="skillTotal">
        <div class="selectedSkill">
            <el-tag>已选技能</el-tag> <el-button @click="submitSkill" type="success" size="mini">提交</el-button>
            <div class="selectedSkillDiv">
                <div :key="tag.id" v-for="tag in selectedSkill" :disable-transitions="false" style="margin:10px" :class="'skill '+ renderSkill(tag)">
                    <el-popover
                    placement="top-start"
                    :title="tag.skill_name+getSkillAtb(tag)"
                    width="200"
                    trigger="hover"
                    :content="tag.skill_dsc">
                    <!-- TODO: 多选技能 -->
                    <div slot="reference" @click="addSkill(tag)"><img :src="getSkillImgsrc(tag)" alt="">{{tag.skill_name}}</div>
                    </el-popover>
                </div>
            </div>
        </div>
        
        <div class="skill2Select">
            <el-tag>技能选择</el-tag>
            <div class="skillFilter">
                <div style="margin-top: 20px">
                    <el-radio-group v-model="fliter.skill_long" size="mini">
                        <el-radio-button label="1">短距離</el-radio-button>
                        <el-radio-button label="2">マイル</el-radio-button>
                        <el-radio-button label="3">中距離</el-radio-button>
                        <el-radio-button label="4">長距離</el-radio-button>
                        <el-radio-button label="5">ダート</el-radio-button>
                        <el-radio-button label="0">全て</el-radio-button>
                    </el-radio-group>
                    <br>
                    <el-radio-group v-model="fliter.skill_sakusen" size="mini">
                        <el-radio-button label="1">追込</el-radio-button>
                        <el-radio-button label="2">差し</el-radio-button>
                        <el-radio-button label="3">先行</el-radio-button>
                        <el-radio-button label="4">逃げ</el-radio-button>
                        <el-radio-button label="0">全て</el-radio-button>
                    </el-radio-group>

                    <el-input v-model="fliter.searchtext" placeholder="关键词搜索(支持正则)" clearable style="display:inline-block;width:15vw"></el-input>
                </div>
            </div>
            <div :key="tag.id" v-for="tag in mySkill" v-if="fliterSkill(tag)" :disable-transitions="false" style="margin:10px" :class="'skill '+ renderSkill(tag)">
                <el-popover
                placement="top-start"
                :title="tag.skill_name+getSkillAtb(tag)"
                width="200"
                trigger="hover"
                :content="tag.skill_dsc">
                <!-- TODO: 多选技能 -->
                <div slot="reference" @click="addSkill(tag)"><img :src="getSkillImgsrc(tag)" alt="">{{tag.skill_name}}</div>
                </el-popover>
            </div>
        </div>


        
    </div>
</template>

<script>
import {
        qurSql
    } from "../../jsfile/api/con2sql.js"
import '../../assets/css/skill.css'
export default {
    name:'SelectSkill',
    data(){
        return{
            mySkill:[],
            selectedSkill:[],
            fliter:{
                skill_long:'0',
                skill_sakusen:'0',
                searchtext:''
            }
        }
    },
    methods:{
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
            },

            //添加或删除技能
            addSkill(skill){
                // console.log(this.selectedSkill.findIndex({id:skill.id}))
                if(this.selectedSkill.find({id:skill.id})==undefined){
                    this.selectedSkill.push(skill)
                }else{
                    // this.selectedSkill.findIndex({id:skill.id})
                    this.selectedSkill.splice(this.selectedSkill.findIndex({id:skill.id}), 1);
                }
                // console.log(this.selectedSkill)
                submitSkill()
            },


            submitSkill() {
                this.$emit('getSkillFromChild', this.selectedSkill)
            },
            fliterSkill(skill){
                // console.log(this.fliter.skill_long)
                if(this.fliter.skill_long!=0&&this.fliter.skill_long!=skill.skill_long){
                    return false
                }

                if(this.fliter.skill_sakusen!=0&&this.fliter.skill_sakusen!=skill.skill_sakusen){
                    return false
                }


                if(this.fliter.searchtext!=''){
                    let reg = eval(`/${this.fliter.searchtext}/g`)
                    if(!skill.skill_name.match(reg)){
                        return false
                    }
                }

                return true
            }
    },
    mounted() {
        let query = `select * from skill`
        qurSql(this.sqlcon, query, res => {
            this.mySkill = res
        })
    },
}
</script>


<style scoped>
.el-radio-group {
    margin: 1vw;
}

.el-tag{
    margin: 1vw;
}
</style>