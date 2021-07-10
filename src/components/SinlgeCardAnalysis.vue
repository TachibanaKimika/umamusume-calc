<!--
 * @Author: your name
 * @Date: 2021-07-10 03:08:08
 * @LastEditTime: 2021-07-10 22:37:40
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \fake-hpf:\My Repo\umamusume-calc\src\components\SinlgeCardAnalysis.vue
-->

<!-- 单卡性能计算 -->

<template>
    <div>
        <div class="chooseOptions" >
            <el-slider 
            v-for="i in 5" 
            v-model="calc_options.torelv[i]"
            :step="20" show-stops
            :format-tooltip="formatTooltip"></el-slider>
        </div>
        <div class="cardbox" v-for="i in 4">
            <el-button v-model="selected_card[i-1]" @click="dialogVisible = true;potionSelector = i-1;"><span
                    class="selectedCardItem" v-if="selected_card[i-1]">{{selected_card[i-1].spc_name}}</span><span
                    v-else>请选择支援卡{{i}}</span></el-button>
            <div class="table">
                <table v-if="selected_card[i-1]">
                    <tr>
                        <th>name</th>
                        <th>num</th>
                    </tr>
                    <tr>
                        <td>カテゴリー</td>
                        <td v-if="selected_card[i-1]">{{getAttribute(selected_card[i-1].spc_attribute)}}</td>
                        <td v-else>N/A</td>
                    </tr>
                    <tr>
                        <td>得意率</td>
                        <td v-if="selected_card[i-1]">{{selected_card[i-1].spc_tokuitu}}%</td>
                        <td v-else>N/A</td>
                    </tr>
                    <tr>
                        <td>友情ボーナス</td>
                        <td v-if="selected_card[i-1]">{{selected_card[i-1].spc_youujo}}%</td>
                        <td v-else>N/A</td>
                    </tr>
                    <tr>
                        <td>やる気効果</td>
                        <td v-if="selected_card[i-1]">{{selected_card[i-1].spc_yaruki}}%</td>
                        <td v-else>N/A</td>
                    </tr>
                    <tr>
                        <td>トレーニング効果</td>
                        <td v-if="selected_card[i-1]">{{selected_card[i-1].spc_tore}}%</td>
                        <td v-else>N/A</td>
                    </tr>
                    <tr>
                        <td>ヒントLv</td>
                        <td v-if="selected_card[i-1]">LV{{selected_card[i-1].spc_hit_lv}}</td>
                        <td v-else>N/A</td>
                    </tr>
                    <tr>
                        <td>ヒント発生率</td>
                        <td v-if="selected_card[i-1]">{{selected_card[i-1].spc_hit_ritu}}%</td>
                        <td v-else>N/A</td>
                    </tr>
                    <tr>
                        <td>初期絆ゲージ</td>
                        <td v-if="selected_card[i-1]">{{selected_card[i-1].spc_kizuna}}</td>
                        <td v-else>N/A</td>
                    </tr>
                    <tr>
                        <td>レースボーナス</td>
                        <td v-if="selected_card[i-1]">{{selected_card[i-1].spc_race}}</td>
                        <td v-else>N/A</td>
                    </tr>
                    <tr v-for="j in 5" v-if="selected_card[i-1].spc_init_stu.split(',')[j-1]>0">
                        <td>初期{{getAttribute(j,'bonasu')}}</td>
                        <td>{{selected_card[i-1].spc_init_stu.split(',')[j-1]}}</td>
                    </tr>
                    <tr v-for="j in 5" v-if="selected_card[i-1].spc_bonasu_pt.split(',')[j-1]>0">
                        <td>{{getAttribute(j,'bonasu')}}ボーナス</td>
                        <td>{{selected_card[i-1].spc_bonasu_pt.split(',')[j-1]}}</td>
                    </tr>
                </table>
            </div>
        </div>


        <div class="myCharts"></div>
        <el-dialog title="选择支援卡" :visible.sync="dialogVisible">
            <SelectWindowOfRegistedCard :cards="card_item" v-on:getCardFromChild='reciveCardItem' />
        </el-dialog>
    </div>
</template>

<script>
    import SelectWindowOfRegistedCard from "@/components/child/SelectWindowOfRegistedCard.vue"
    import $ from 'jquery'
    import {
        qurSql
    } from '../jsfile/api/con2sql.js'
    export default {
        name: 'SinlgeCardAnalysis',
        components: {
            SelectWindowOfRegistedCard
        },
        data() {
            return {
                dialogVisible: false,
                sqlcon: {
                    username: 'akarichan',
                    userpasswd: 'akariChan@0721',
                    database: 'umamusume-pbl',
                },
                card_item: [],
                selected_card: [],
                calc_options: {
                    stdtore: [{
                            cost: 21,
                            lv: [
                                [10, 0, 5, 0, 0, 2],
                                [11, 0, 5, 0, 0, 2],
                                [12, 0, 5, 0, 0, 2],
                                [13, 0, 6, 0, 0, 2],
                                [14, 0, 7, 0, 0, 2]
                            ]
                        },
                        {
                            cost: 19,
                            lv: [
                                [0, 9, 0, 4, 0, 2],
                                [0, 10, 0, 4, 0, 2],
                                [0, 11, 0, 4, 0, 2],
                                [0, 12, 0, 5, 0, 2],
                                [0, 13, 0, 6, 0, 2]
                            ]
                        },
                        {
                            cost: 20,
                            lv: [
                                [0, 5, 8, 0, 0, 2],
                                [0, 5, 9, 0, 0, 2],
                                [0, 5, 10, 0, 0, 2],
                                [0, 6, 11, 0, 0, 2],
                                [0, 7, 12, 0, 0, 2]
                            ]
                        },
                        {
                            cost: 22,
                            lv: [
                                [4, 0, 4, 8, 0, 2],
                                [4, 0, 4, 9, 0, 2],
                                [4, 0, 4, 10, 0, 2],
                                [5, 0, 4, 11, 0, 2],
                                [5, 0, 5, 12, 0, 2]
                            ]
                        },
                        {
                            cost: -5,
                            lv: [
                                [2, 0, 0, 0, 9, 4],
                                [2, 0, 0, 0, 10, 4],
                                [2, 0, 0, 0, 11, 4],
                                [3, 0, 0, 0, 12, 4],
                                [4, 0, 0, 0, 13, 4]
                            ]
                        },
                    ],
                    yaruki: 1.1,
                    torelv: [5, 5, 5, 5, 5]
                },
                potionSelector: 0,
            }
        },
        mounted() {
            let query = 'SELECT \
                        supportcard_stu.`id`, supportcard_stu.`spc_id`,supportcard.`spc_attribute`,supportcard.`spc_rare`,\
                        supportcard_stu.`spc_lv`,supportcard_stu.`spc_youujo`,supportcard_stu.`spc_yaruki`,supportcard_stu.`spc_tore`,\
                        supportcard_stu.`spc_bonasu_pt`,supportcard_stu.`spc_tokuitu`,supportcard_stu.`spc_kizuna`,\
                        supportcard_stu.`spc_init_stu`,supportcard_stu.`spc_race`,supportcard_stu.`spc_fan`,supportcard_stu.`spc_hit_lv`,\
                        supportcard_stu.`spc_hit_ritu`,supportcard_stu.`spc_reduce_suta`,supportcard_stu.`spc_reduce_shipai`,\
                        CONCAT(\'[\',supportcard_stu.`spc_lv`,\']‐[\',supportcard.`spc_secname`,\']-\',supportcard.`spc_name`) spc_name\
                        FROM supportcard_stu\
                        LEFT JOIN supportcard ON supportcard.`id` = supportcard_stu.`spc_id`\
                        ORDER BY spc_name DESC'
            qurSql(this.sqlcon, query, res => {
                this.card_item = res
                //this.selected_card[0] = this.card_item[0] //test
                // console.log(res)
                // this.calcCard(this.selected_card[0])
            })
        },

        
        methods: {
            calcCard(card) { //传一张卡
                // TODO LIST 在表格中计算`出现率`, `练习性能`, `友情练习性能`
                const my_calc_options = this.calc_options;
                let mytore = [];
                // console.log(card)
                //基础值
                for (let i in my_calc_options.torelv) {
                    // console.log(i)
                    // console.log(my_calc_options.stdtore[i].lv[my_calc_options.torelv[i] - 1])
                    // console.log(this.calc_options.torelv[i])
                    mytore[i] = my_calc_options.stdtore[i].lv[my_calc_options.torelv[i] - 1]
                }

                //对照练习性能
                const stdtore = $.extend(true, {}, mytore);
                // console.log(mytore)

                //计算每一项的加成点:
                card.spc_bonasu_pt = card.spc_bonasu_pt.split(",")
                for (let i in mytore) {
                    for (let j in mytore[i]) {
                        if (mytore[i][j] != 0) {
                            mytore[i][j] += parseInt(card.spc_bonasu_pt[j])
                        }
                    }
                }
                for (let i in mytore) {
                    mytore[i] = mytore[i].map(function (item, index, array) {
                        let num = item * 1.05 * (1 + card.spc_tore / 100) * (1 + (calc_options.yaruki - 1) * (
                            1 + card.spc_yaruki / 100))
                        return parseInt(num.toFixed(0))
                    })
                }


                //友情练习性能
                let mytore_y = []
                for (let i in mytore) {
                    mytore_y[i] = mytore[i].map(function (item, index, array) {
                        let num = i == card.spc_attribute - 1 ? item * (1 + card.spc_youujo / 100) : item
                        return parseInt(num.toFixed(0))
                    })
                }
            },
            reciveCardItem(data) {
                this.selected_card[this.potionSelector] = data;
                this.dialogVisible = false
            },
            formatTooltip(val) {
                return val / 20;
            },
            getAttribute(num, mode = 'atb') {
                switch (num) {
                    case 1:
                        return 'スビート'
                    case 2:
                        return 'スタミナ'
                    case 3:
                        return 'パワー'
                    case 4:
                        return '根性'
                    case 5:
                        return '賢さ'
                    case 6:
                        if (mode == 'atb') {
                            return '友人'
                        } else if (mode == 'bonasu') {
                            return 'スキル'
                        }
                }
            }
        }
    }
</script>


<style scoped>
    .cardbox {
        display: inline-block;
        width: 22vw;
        margin: 0.5vw;
    }

    .selectedCardItem {
        font-size: 0.8vw;
        letter-spacing: 0;
    }



    .chooseOptions>.el-slider {
        display: inline-block;
        width:10vw;
        margin: 1vw;
    }

    /* Border styles */
    table thead,
    table tr {
        border-top-width: 1px;
        border-top-style: solid;
        border-top-color: rgb(230, 189, 189);
    }

    table {
        border-bottom-width: 1px;
        border-bottom-style: solid;
        border-bottom-color: rgb(230, 189, 189);
    }

    /* Padding and font style */
    table td,
    table th {
        padding: 5px 10px;
        font-size: 12px;
        font-family: Verdana;
        color: rgb(188, 19, 255);
    }

    /* Alternating background colors */
    table tr:nth-child(even) {
        background: rgba(231, 113, 255, 0.555)
    }

    table tr:nth-child(odd) {
        background: #FFF
    }

    table {
        margin: 1vw auto;
    }
</style>