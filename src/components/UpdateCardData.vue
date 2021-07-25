<!--
 * @Author: your name
 * @Date: 2021-07-25 14:30:37
 * @LastEditTime: 2021-07-25 17:18:47
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \MyNotef:\My Repo\umamusume-calc\src\components\UpdateCardData.vue
-->
<template>
    <div>
        <!-- <div class="card_item">
            <el-form :model="spcSubmit" label-width="140px">
                <el-row :gutter="20">
                    <el-col :span="8">
                        <el-button v-model="spcSubmit.id" @click="dialogVisible = true;getRegiedCard()">
                            <span v-if="selectedCardName">{{selectedCardName}}</span><span v-else>请选择支援卡</span>
                        </el-button>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="等级">
                            <el-input-number v-model="spcSubmit.level" controls-position="right" :step="5" :max="50" :min="1">
                            </el-input-number>
                        </el-form-item>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="等级">
                            <el-select v-model="result" filterable placeholder="已存在的等级" clearable>
                                <el-option v-for="item in regedcard" :key="item.spc_id" disabled
                                    :label="'【'+item.spc_lv+'】'" :value="item.spc_id">
                                </el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row :gutter="20">
                    <el-col :span="8">
                        <el-form-item label="友情ボーナス">
                            <el-input-number v-model="spcSubmit.youujo" :controls=false style="width:7vw" :min="0">
                            </el-input-number>
                            <el-button @click="spcSubmit.youujo!=0?spcSubmit.youujo = ((spcSubmit.youujo/100+1)*1.1-1)*100:spcSubmit.youujo+=10">固有</el-button>
                        </el-form-item>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="やる気効果">
                            <el-input-number v-model="spcSubmit.yaruki" controls-position="right" :step="15" :min="0">
                            </el-input-number>
                        </el-form-item>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="属性点加成">
                            <el-select v-model="attrBonazu.bonasu_pt_p" placeholder="请选择" :min="0"
                                style="width:100px; padding:0 10px">
                                <el-option v-for="item in attribute_opt" :label="item.label" :value="item.value"
                                    :key="item.value">
                                </el-option>
                            </el-select>
                            <el-button type="primary" @click="add1PtBonasu_PT()">+1</el-button>
                            <el-button type="primary" @click="add1PtBonasu_PT('reset')">reset</el-button>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row :gutter="20">
                    <el-col :span="8">
                        <el-form-item label="トレーニング効果">
                            <el-input-number v-model="spcSubmit.tore" controls-position="right" :step="5" :min="0"></el-input-number>
                        </el-form-item>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="初期絆ゲージ">
                            <el-input-number v-model="spcSubmit.kizuna" controls-position="right" :step="15" :min="0">
                            </el-input-number>
                        </el-form-item>

                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="レースボーナス">
                            <el-input-number v-model="spcSubmit.race" controls-position="right" :step="5" :min="0"></el-input-number>
                        </el-form-item>

                    </el-col>
                </el-row>
                <el-row :gutter="20">
                    <el-col :span="8">
                        <el-form-item label="ファン数ボーナス">
                            <el-input-number v-model="spcSubmit.fan" controls-position="right" :step="5" :min="0"></el-input-number>
                        </el-form-item>

                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="ヒントレベルアップ">
                            <el-input-number v-model="spcSubmit.hitlv" controls-position="right" :step="1" :min="0">
                            </el-input-number>
                        </el-form-item>

                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="ヒント発生率アップ">
                            <el-input-number v-model="spcSubmit.hit_ritu" controls-position="right" :step="20" :min="0">
                            </el-input-number>
                        </el-form-item>

                    </el-col>
                </el-row>
                <el-row :gutter="20">
                    <el-col :span="8">
                        <el-form-item label="得意率">
                            <el-input-number v-model="spcSubmit.tokuitu" :controls=false style="width:7vw" :min="0">
                            </el-input-number>
                            <el-button @click="spcSubmit.tokuitu!=0?spcSubmit.tokuitu = ((spcSubmit.tokuitu/100+1)*1.2-1)*100:spcSubmit.tokuitu+=20">固有</el-button>
                        </el-form-item>

                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="消耗体力减少">
                            <el-input-number v-model="spcSubmit.reduce_suta" controls-position="right" :step="5" :min="0">
                            </el-input-number>
                        </el-form-item>

                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="失败率降低">
                            <el-input-number v-model="spcSubmit.reduce_shipai" controls-position="right" :step="10" :min="0">
                            </el-input-number>
                        </el-form-item>

                    </el-col>
                </el-row>
                <el-row :gutter="20">
                    <el-col :span="8">
                        <el-form-item label="初始属性点">
                            <el-select v-model="attrBonazu.init_stu_p" placeholder="请选择">
                                <el-option v-for="item in attribute_opt" :label="item.label" :value="item.value" 
                                    :key="item.value">
                                </el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="具体值">
                            <el-input-number v-model="attrBonazu.init_stu" controls-position="right" :step="20" :min="0">
                            </el-input-number>
                        </el-form-item>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="更改数据">
                            <el-button type="primary" @click="addInit_stu()">插入</el-button>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row :gutter="20">
                    <el-col :span="4">
                        <p>练习属性点:{{spcSubmit.bonasu_pt}}</p>
                    </el-col>
                    <el-col :span="4">
                        <p>初始能力值:{{spcSubmit.init_stu}}</p>
                    </el-col>
                    <el-col :span="4">
                        <el-input v-model="sqlcon.username" placeholder="数据库用户名"></el-input>
                    </el-col>
                    <el-col :span="4">
                        <el-input show-password v-model="sqlcon.userpasswd" placeholder="数据库密码"></el-input>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="提交更改">
                            <el-button type="success" @click="updateSPCstaus()">提交</el-button>
                            <el-button type="success" @click="updateSPCstaus('local')">提交(本地)</el-button>
                        </el-form-item>
                    </el-col>
                </el-row>
            </el-form>
        </div>


        <el-dialog title="选择支援卡" :visible.sync="dialogVisible">
            <SelectWindowOfRegistedCard :cards="card_item" v-on:getCardFromChild='reciveCardItem' />
        </el-dialog> -->
    </div>
</template>

<script>
import SelectWindowOfRegistedCard from "@/components/child/SelectWindowOfRegistedCard.vue"
import {qurSql} from "../jsfile/api/con2sql.js"
import $ from 'jquery'
export default {
    
    name:'UpdateCardData',
    components: {
            SelectWindowOfRegistedCard
        },
    data(){
        return{
            dialogVisible: false,
            cardData:[],
        }
    },
    mounted(){
        let querystr = 'SELECT \
                        supportcard_stu.`id`, supportcard_stu.`spc_id`,supportcard.`spc_attribute`,supportcard.`spc_rare`,\
                        supportcard_stu.`spc_lv`,supportcard_stu.`spc_youujo`,supportcard_stu.`spc_yaruki`,supportcard_stu.`spc_tore`,\
                        supportcard_stu.`spc_bonasu_pt`,supportcard_stu.`spc_tokuitu`,supportcard_stu.`spc_kizuna`,\
                        supportcard_stu.`spc_init_stu`,supportcard_stu.`spc_race`,supportcard_stu.`spc_fan`,supportcard_stu.`spc_hit_lv`,\
                        supportcard_stu.`spc_hit_ritu`,supportcard_stu.`spc_reduce_suta`,supportcard_stu.`spc_reduce_shipai`,\
                        CONCAT(\'【\',supportcard_stu.`spc_lv`,\'】 ‐ 【\',supportcard.`spc_secname`,\'】　-　\',supportcard.`spc_name`) spc_name\
                        FROM supportcard_stu\
                        LEFT JOIN supportcard ON supportcard.`id` = supportcard_stu.`spc_id`\
                        ORDER BY spc_name DESC'
            qurSql(undefined, querystr, res => {
                this.cardData = res;
            })
    },
    methods: {
        updateData(card){
            cardData =  $.extend(true, {}, card)
            cardData.spc_bonasu_pt = cardData.spc_bonasu_pt.toString()
            cardData.spc_init_stu = cardData.spc_init_stu.toString()
            if(cardData.localData){
                this.$store.commit('updatecard2store',cardData)
            }else{

            }
        }
    },
    computed:{
        mycardInVuex(){
            return this.$store.state.myCard
        }
    }
}
</script>