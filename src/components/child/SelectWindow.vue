<!--
 * @Author: your name
 * @Date: 2021-07-08 13:29:38
 * @LastEditTime: 2021-08-25 11:35:08
 * @LastEditors: Akarichan
 * @Description: In User Settings Edit
 * @FilePath: \fake-hpf:\My Repo\umamusume-calc\src\components\child\SelectWindow.vue
-->
<template>
    <div>
        <el-row>
            <el-col :span='14'>
                <el-radio-group v-model="checkListType">
                    <el-radio label='1' true>スビート</el-radio>
                    <el-radio label='2'>スタミナ</el-radio>
                    <el-radio label='3'>パワー</el-radio>
                    <el-radio label='4'>根性</el-radio>
                    <el-radio label='5'>賢さ</el-radio>
                    <el-radio label='6'>友人</el-radio>
                </el-radio-group>
            </el-col>
            <el-col :span='4'>
                <el-radio-group v-model="checkListRare">
                    <el-radio label='3' true>SSR</el-radio>
                    <el-radio label='2' true>SR</el-radio>
                </el-radio-group>
            </el-col>
            <el-col :span='6'>
                <el-button @click="submitCard" type="success">选择</el-button>
            </el-col>
        </el-row>
        <el-radio-group class="card_selector_group" v-model="checkedItem">
            <el-radio v-for="item in cards" v-if="hasType(item)" :label="item" border style="margin-top: 20px">
                <img class="card_selector_img" :src="item.imgurl"><span>{{item.name}}</span>
            </el-radio>
            </el-radio-group>
    </div>
</template>

<script>
    // import {qurSql} from "../../jsfile/api/con2sql.js"
    export default {
        name: 'SelectWindow',
        data() {
            return {
                checkListType: '1',
                checkListRare: '3',
                checkedItem: {
                    id: 0
                }
            }
        },
        methods: {
            hasType(item) {
                if (item.atb == this.checkListType) {
                    if (item.rare == this.checkListRare) {
                        return true
                    }
                }
                return false;
            },
            submitCard() {
                if (this.checkedItem.id != 0) {
                    this.$emit('getCardFromChild', this.checkedItem)
                } else {
                    this.$message("请选择一张卡")
                }
            }
        },
        computed:{
            cards(){
                return this.$store.state.cards
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