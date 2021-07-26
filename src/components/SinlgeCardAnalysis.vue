<!--
 * @Author: your name
 * @Date: 2021-07-10 03:08:08
 * @LastEditTime: 2021-07-26 19:32:09
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \fake-hpf:\My Repo\umamusume-calc\src\components\SinlgeCardAnalysis.vue
-->

<!-- 单卡性能计算 -->

<template>
    <div>
        <!-- <div class="chooseOptions" >
            <el-slider 
            v-for="i in 5" 
            v-model="calc_options.torelv[i]"
            :step="20" show-stops
            :format-tooltip="formatTooltip"></el-slider>
        </div> -->

        <div class="setOptions">

            <el-row>
                <el-col :span="6">
                    <el-tag>トレタイプ</el-tag>
                    <el-select v-model="my_options.attribute" placeholder="タイプ">
                        <el-option v-for="item in static.atbOpt" :key="item.value" :label="item.label"
                            :value="item.value">
                        </el-option>
                    </el-select>
                </el-col>
                <el-col :span="6">
                    <el-tag>トレレベル</el-tag>
                    <el-input-number v-model="my_options.level" :step='1' :min='1' :max='5'></el-input-number>
                    <!-- <el-slider v-model="my_options.level*20" :step="20" show-stops :format-tooltip="formatTooltip">
                    </el-slider> -->
                </el-col>
                <el-col :span="6">
                    <el-tag>やる気</el-tag>
                    <el-select v-model="calc_options.yaruki" placeholder="请选择">
                        <el-option v-for="item in static.yarukiOpt" :key="item.key" :label="item.key"
                            :value="item.value">
                        </el-option>
                    </el-select>
                </el-col>
                <el-col :span="6">
                    <el-button type="success" @click="initChart"><span>生成图表</span></el-button>
                </el-col>
            </el-row>
            <!-- <el-select v-model="my_options.attribute" placeholder="请选择">
                <el-option v-for="item in static.atbOpt" :key="item.value" :label="item.label" :value="item.value">
                </el-option>
            </el-select>
            <el-slider v-model="my_options.level" :step="20" show-stops :format-tooltip="formatTooltip" style="width: 10vw"></el-slider> -->
        </div>

        <div class="cardbox" v-for="i in 4">
            <el-button v-model="selected_card[i-1]" @click="dialogVisible = true;potionSelector = i-1;"><span
                    class="selectedCardItem" v-if="selected_card[i-1]">{{selected_card[i-1].spc_name}}</span><span
                    v-else>サポートカード{{i}}</span></el-button>
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
                    <tr v-for="j in 5" v-if="selected_card[i-1].spc_init_stu[j-1]>0">
                        <td>初期{{getAttribute(j,'bonasu')}}</td>
                        <td>{{selected_card[i-1].spc_init_stu[j-1]}}</td>
                    </tr>
                    <tr v-for="j in 5" v-if="selected_card[i-1].spc_bonasu_pt[j-1]>0">
                        <td>{{getAttribute(j,'bonasu')}}ボーナス</td>
                        <td>{{selected_card[i-1].spc_bonasu_pt[j-1]}}</td>
                    </tr>

                    <tr>
                        <td>练习性能</td>
                        <td v-if="selected_card[i-1]">{{selected_card[i-1].spc_result.common}}</td>
                    </tr>
                    <tr>
                        <td>友情练习性能</td>
                        <td v-if="selected_card[i-1]">{{selected_card[i-1].spc_result.common_y}}</td>
                    </tr>
                    <tr>
                        <td>得意练习出现率</td>
                        <td v-if="selected_card[i-1]">{{selected_card[i-1].spc_result.awareritu}}</td>
                    </tr>
                </table>
            </div>
        </div>


        <div id="myCharts" style="width: 90vw;height:40vw;"></div>
        <el-dialog title="选择支援卡" :visible.sync="dialogVisible">
            <SelectWindowOfRegistedCard v-on:getCardFromChild='reciveCardItem' />
        </el-dialog>
    </div>
</template>

<script>
    import SelectWindowOfRegistedCard from "@/components/child/SelectWindowOfRegistedCard.vue"
    import $ from 'jquery'

    import {
        initChartsOption_Bar_singleCard
    } from '../jsfile/util/initChartsOption.js'
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
                    yaruki: 1.2,
                    torelv: [5, 5, 5, 5, 5]
                },
                my_options: {
                    attribute: '', //练习的类型
                    level: 1,
                    yaruki: ''
                },
                potionSelector: '',
                static: {
                    atbOpt: [{
                            value: 0,
                            label: 'スビート'
                        },
                        {
                            value: 1,
                            label: 'スタミナ'
                        },
                        {
                            value: 2,
                            label: 'パワー'
                        },
                        {
                            value: 3,
                            label: '根性'
                        },
                        {
                            value: 4,
                            label: '賢さ'
                        },
                    ],
                    yarukiOpt:[
                        {
                            key:'絶好調',
                            value: 1.2
                        },
                        {
                            key:'好調',
                            value: 1.1
                        },
                        {
                            key:'普通',
                            value: 1.0
                        },
                        {
                            key:'不調',
                            value: 0.9
                        },
                        {
                            key:'絶不調',
                            value: 0.8
                        }
                    ]
                }
            }
        },
        methods: {
            calcCard(card) { //传一张卡
                var my_calc_options = $.extend(true, {}, this.calc_options);
                let mytore = [];
                //基础值
                for (let i in my_calc_options.torelv) {
                    mytore[i] = my_calc_options.stdtore[i].lv[my_calc_options.torelv[i] - 1]
                }

                //对照练习性能
                const stdtore = $.extend(true, {}, mytore);

                //计算每一项的加成点:
                for (let i in mytore) {
                    for (let j in mytore[i]) {
                        if (mytore[i][j] != 0) {
                            mytore[i][j] += parseInt(card.spc_bonasu_pt[j])
                        }
                    }
                }
                console.log(mytore)
                for (let i in mytore) {
                    mytore[i] = mytore[i].map(function (item, index, array) {
                        let num = item * 1.05 * (1 + card.spc_tore / 100) * (1 + (my_calc_options.yaruki - 1) *
                            (
                                1 + card.spc_yaruki / 100))
                        return num
                    })
                }

                //练习性能 resultCommon
                // console.log(mytore)
                let atb = card.spc_attribute - 1
                let resultCommon = mytore[atb][atb] / stdtore[atb][atb]
                // console.log(`atb= ${atb}, and mytore[atb][atb] = ${mytore[atb][atb]}, stdtore[atb][atb] = ${stdtore[atb][atb]}`)


                //友情练习性能
                let mytore_y = []
                for (let i in mytore) {
                    mytore_y[i] = mytore[i].map(function (item, index, array) {
                        let num = i == card.spc_attribute - 1 ? item * (1 + card.spc_youujo / 100) : item
                        return num.toFixed(2)
                    })
                }
                let resultCommon_y = mytore_y[atb][atb] / stdtore[atb][atb]


                // 得意练习出现率
                let awareritu = (card.spc_tokuitu + 100) / (card.spc_tokuitu + 100 + 450)



                return {
                    common: resultCommon.toFixed(2),
                    common_y: resultCommon_y.toFixed(2),
                    tore_Common: mytore,
                    tore_Common_y: mytore_y,
                    awareritu: awareritu.toFixed(2)
                }

            },
            reciveCardItem(data) {
                this.selected_card[this.potionSelector] = data;
                this.dialogVisible = false;
                console.log(this.calc_options)
                this.selected_card[this.potionSelector].spc_result = this.calcCard(this.selected_card[this.potionSelector]);
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
            },
            initChart() {
                if(this.selected_card.length == 0) {
                    this.$message('请选择至少一张卡')
                    return
                }
                let card2Submit = []
                console.log(this.selected_card)
                for (let i in this.selected_card) {
                    if (this.selected_card[i].id) {
                        card2Submit.push(this.selected_card[i])
                    }
                }
                const option = initChartsOption_Bar_singleCard(card2Submit, this.my_options)
                var myChart = this.$echarts.init(document.getElementById('myCharts'))
                myChart.setOption(option);
                this.$message('初始化完成');
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

    .setOptions {
        margin: 2vw
    }


    .el-tag{
        margin: 1vw ;
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