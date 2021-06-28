<!--
 * @Author: your name
 * @Date: 2021-06-26 00:39:37
 * @LastEditTime: 2021-06-28 17:38:25
 * @LastEditors: Please set LastEditors
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
            <el-col :span='8'><span>スキル名</span><el-input v-model="skillOptions.name" style="width:auto"></el-input></el-col>
            <el-col :span='8'><span>必要Pt</span><el-input-number v-model="skillOptions.pt" :step="10"></el-input-number></el-col>
            <el-col :span='8'><el-input v-model="skillOptions.dsc" style="display: inline-block;margin:10px;" autosize type="textarea" placeholder="効果"></el-input></el-col>
        </el-row>
        <el-button @click="updateSkill">Submit</el-button>
        <el-input v:model="sqlcon.username" placeholder="用户名"></el-input>
        <el-input v:model="sqlcon.userpasswd" placeholder="密码"></el-input>
    </div>
</template>

<script>
import{qurSql}from '../jsfile/api/con2sql.js'
export default {
    name: 'InsertSkill',
    data(){
        return{
            sqlcon:{
                username: 'akarichan',
                userpasswd: 'akariChan@0721',
                database: 'umamusume-pbl',
            },
            skillOptions:{
                name:'',
                type:0,
                rare:0,
                long:0,
                sakusen:0,
                pt:160,
                dsc:'',
            },
            skillOptionsModel:{
                name:'',
                type:0,
                rare:0,
                long:0,
                sakusen:0,
                pt:160,
                dsc:'',
            }
        }
    },
    methods: {
        updateSkill(){
            let query = `insert into skill (skill_name, skill_type, skill_rare, skill_long, skill_sakusen, skill_pt, skill_dsc)
             value ('${this.skillOptions.name}', ${this.skillOptions.type}, ${this.skillOptions.rare}, ${this.skillOptions.long}, ${this.skillOptions.sakusen}, ${this.skillOptions.pt}, '${this.skillOptions.dsc}')`;
            console.log(query)
            qurSql(this.sqlcon, query, res=>{
                console.log(res)
                //this.$message(res.affectedRows)
            })
            this.skillOptions.name='';this.skillOptions.rare=0;this.skillOptions.long=0;this.skillOptions.sakusen=0;this.skillOptions.dsc='';
            
        }
    }
}
</script>

<style scoped>
.el-radio-group, .el-input-number, .el-input{
    display: inline-block;
    margin:10px;
}
</style>