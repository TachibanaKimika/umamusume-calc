<!--
 * @Author: your name
 * @Date: 2021-07-08 13:29:38
 * @LastEditTime: 2021-08-27 18:25:45
 * @LastEditors: Akarichan
 * @Description: In User Settings Edit
 * @FilePath: \fake-hpf:\My Repo\umamusume-calc\src\components\child\SelectWindowOfRegistedCard.vue
-->
<template>
    <div>
        <el-row>
            <el-col :span='18'>
                <el-radio-group v-model="checkListType">
                    <el-radio label='1' true>スビート</el-radio>
                    <el-radio label='2'>スタミナ</el-radio>
                    <el-radio label='3'>パワー</el-radio>
                    <el-radio label='4'>根性</el-radio>
                    <el-radio label='5'>賢さ</el-radio>
                    <el-radio label='6'>友人</el-radio>
                </el-radio-group>
            </el-col>
            <el-col :span="6">
                <el-radio-group v-model="checkListRare">
                    <el-radio label='3' true>SSR</el-radio>
                    <el-radio label='2'>SR</el-radio>
                </el-radio-group>
            </el-col>
            <el-col :span='12'>
                <el-radio-group v-model="checkListLevel">
                    <el-radio label='50' true>50</el-radio>
                    <el-radio label='45'>45</el-radio>
                    <el-radio label='40'>40</el-radio>
                    <el-radio label='35'>35</el-radio>
                    <el-radio label='30'>30</el-radio>
                    <el-radio label='25'>25</el-radio>
                </el-radio-group>
            </el-col>
            <el-col :span='12'>
                <el-button @click="submitCard" type="success">选择</el-button>
            </el-col>
        </el-row>

        <el-radio-group class="card_selector_group" v-model="checkedItem">
            <el-radio v-for="item in cards" v-if="hasType(item)" :label="item" border style="margin-top: 20px">
                <img class="card_selector_img" :src="item.imgurl"><span>{{item.spc_name}}</span>
            </el-radio>
            <el-radio v-for="item in cardsUser" v-if="hasType(item)" :label="item" border style="margin-top: 20px; background-color: #e0bbff">
                <img class="card_selector_img" :src="item.imgurl"><span>{{item.spc_name}}</span>
            </el-radio>
            <el-radio v-for="item in mycardInVuex" v-if="hasType(item)" :label="item" border style="margin-top: 20px; background-color: #bcffb7">
                {{'['+item.spc_lv+']-'+item.spc_name}}
            </el-radio>
        </el-radio-group>
    </div>
</template>

<script>
    // import {
    //     qurSql
    // } from "../../jsfile/api/con2sql.js"
    import $ from 'jquery'
    export default {
        name: 'SelectWindowOfRegistedCard',
        
        data() {
            return {
                checkListType: '1',
                checkListRare: '3',
                checkListLevel: '50',
                checkedItem: {},
                // cards:[]
            }
        },
        methods: {
            hasType(item) {
                if (item.spc_attribute == this.checkListType) {
                    if (item.spc_lv == this.checkListLevel) {
                        if (item.spc_rare == this.checkListRare) {
                            // console.log(item)
                            return true;
                        }
                    }
                }
                return false;
            },
            submitCard() {
                // console.log(this.cards)
                // console.log(this.checkedItem)
                var ret = $.extend(true, {}, this.checkedItem)
                if (ret.id != 0) {
                    // ret.spc_bonasu_pt = ret.spc_bonasu_pt.split(',').map(Number)
                    // ret.spc_init_stu = ret.spc_init_stu.split(',').map(Number)
                    ret.spc_init_stu = JSON.parse(ret.spc_init_stu)
                    ret.spc_bonasu_pt = JSON.parse(ret.spc_bonasu_pt)
                    this.$emit('getCardFromChild', ret)
                } else {
                    this.$message("请选择一张卡")
                }
            }
        },
        computed:{
            mycardInVuex(){
                return this.$store.state.myCard
            },
            cards(){
                return this.$store.state.myCardDb
            },
            cardsUser(){
                return this.$store.state.myCardDbUser
            }
        }
    }
</script>


<style lang="scss">
.card_selector_group{
    .el-radio{
        vertical-align:middle;
        height:80px;
        .card_selector_img{
            vertical-align:middle;
            width:40px;
        }
        span{
            vertical-align:middle;
        }
    }
}



</style>