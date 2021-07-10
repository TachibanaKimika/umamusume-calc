<!--
 * @Author: your name
 * @Date: 2021-07-08 13:29:38
 * @LastEditTime: 2021-07-10 23:56:29
 * @LastEditors: Please set LastEditors
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

        <el-radio-group v-model="checkedItem">
            <el-radio v-for="item in cards" v-if="hasType(item)" :label="item" border style="margin-top: 20px">
                {{item.spc_name}}</el-radio>
        </el-radio-group>
    </div>
</template>

<script>
    export default {
        name: 'SelectWindowOfRegistedCard',
        props: {
            cards: Array
        },
        data() {
            return {
                checkListType: '1',
                checkListRare: '3',
                checkListLevel: '50',
                checkedItem: {},
            }
        },
        mounted() {
            console.log(this.cards)
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
                // console.log("FALSE");
                // console.log(`this.checkListRare=>${this.checkListRare}?=${item.spc_rare}<=item.spc_rare`)
                return false;
            },
            submitCard() {
                // console.log(this.cards)
                console.log(this.checkedItem)
                if (this.checkedItem.id != 0) {
                    this.$emit('getCardFromChild', this.checkedItem)
                } else {
                    this.$message("请选择一张卡")
                }

            }
        }
    }
</script>