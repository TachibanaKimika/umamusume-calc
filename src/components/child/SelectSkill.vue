<!--
 * @Author: your name
 * @Date: 2021-08-07 18:18:24
 * @LastEditTime: 2021-08-08 00:16:44
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \.gitf:\My Repo\umamusume-calc\src\components\child\SelectSkill.vue
-->


<template>
    <div class="skillTotal">
            <div :key="tag.id" v-for="tag in mySkill" :disable-transitions="false" style="margin:10px" :class="'skill '+ renderSkill(tag)">
                <el-popover
                placement="top-start"
                :title="tag.skill_name+getSkillAtb(tag)"
                width="200"
                trigger="hover"
                :content="tag.skill_dsc">
                <!-- TODO: 多选技能 -->
                <div slot="reference"><img :src="getSkillImgsrc(tag)" alt="">{{tag.skill_name}}</div>
                </el-popover>

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
            selectedSkill:[]
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
            }
    },
    mounted() {
        let query = `select * from skill`
        qurSql(this.sqlcon, query, res => {
            this.mySkill = res
        })
    }
}
</script>
