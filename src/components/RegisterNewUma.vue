<!-- 
    更新🐎页面
 -->


<template>
    <div id="Test">
        <div class="inputspcCard">
            <el-row>
                <el-col :span='8'>
                    <el-button v-model="myCardItem[0]" placeholder="支援卡1"
                        @click="dialogVisible = true;potionSelector=0"><span
                            v-if="myCardItem[0]">{{myCardItem[0].name}}</span><span v-else>请选择支援卡1</span></el-button>
                    <el-input-number v-model="myCardItemLV[0]" :min="1" :max="50" :step="5" controls-position="right">
                    </el-input-number>
                </el-col>
                <el-col :span='8'>
                    <el-button v-model="myCardItem[1]" placeholder="支援卡2"
                        @click="dialogVisible = true;potionSelector=1"><span
                            v-if="myCardItem[1]">{{myCardItem[1].name}}</span><span v-else>请选择支援卡2</span></el-button>
                    <el-input-number v-model="myCardItemLV[1]" :min="1" :max="50" :step="5" controls-position="right">
                    </el-input-number>
                </el-col>
                <el-col :span='8'>
                    <el-button v-model="myCardItem[2]" placeholder="支援卡3"
                        @click="dialogVisible = true;potionSelector=2"><span
                            v-if="myCardItem[2]">{{myCardItem[2].name}}</span><span v-else>请选择支援卡3</span></el-button>
                    <el-input-number v-model="myCardItemLV[2]" :min="1" :max="50" :step="5" controls-position="right">
                    </el-input-number>
                </el-col>
            </el-row>
            <el-row>
                <el-col :span='8'>
                    <el-button v-model="myCardItem[3]" placeholder="支援卡1"
                        @click="dialogVisible = true;potionSelector=3"><span
                            v-if="myCardItem[3]">{{myCardItem[3].name}}</span><span v-else>请选择支援卡4</span></el-button>
                    <el-input-number v-model="myCardItemLV[3]" :min="1" :max="50" :step="5" controls-position="right">
                    </el-input-number>
                </el-col>
                <el-col :span='8'>
                    <el-button v-model="myCardItem[4]" placeholder="支援卡2"
                        @click="dialogVisible = true;potionSelector=4"><span
                            v-if="myCardItem[4]">{{myCardItem[4].name}}</span><span v-else>请选择支援卡5</span></el-button>
                    <el-input-number v-model="myCardItemLV[4]" :min="1" :max="50" :step="5" controls-position="right">
                    </el-input-number>
                </el-col>
                <el-col :span='8'>
                    <el-button v-model="myCardItem[5]" placeholder="支援卡3"
                        @click="dialogVisible = true;potionSelector=5"><span
                            v-if="myCardItem[5]">{{myCardItem[5].name}}</span><span v-else>请选择支援卡6</span></el-button>
                    <el-input-number v-model="myCardItemLV[5]" :min="1" :max="50" :step="5" controls-position="right">
                    </el-input-number>
                </el-col>
            </el-row>
        </div>
        <div class="inputUma">
            <el-row>
                <el-col :span='8'>
                    <el-input-number v-model="myUmaStaus[0]" controls-position="right" :min="1" :max="1200" :step="100">
                    </el-input-number>
                    <el-input-number v-model="myUmaStaus[1]" controls-position="right" :min="1" :max="1200" :step="100">
                    </el-input-number>
                </el-col>
                <el-col :span='8'>
                    <el-input-number v-model="myUmaStaus[2]" controls-position="right" :min="1" :max="1200" :step="100">
                    </el-input-number>
                    <el-input-number v-model="myUmaStaus[3]" controls-position="right" :min="1" :max="1200" :step="100">
                    </el-input-number>
                </el-col>
                <el-col :span='8'>
                    <el-input-number v-model="myUmaStaus[4]" controls-position="right" :min="1" :max="1200" :step="100">
                    </el-input-number>
                    <el-input-number v-model="myUmaStaus[5]" controls-position="right"></el-input-number>
                </el-col>
            </el-row>
            <el-row>
                <el-col :span="8">
                    <el-select v-model="myUmaItem" placeholder="🐎名" filterable style="width: 60%">
                        <el-option v-for="item in umaItem" :key="item.id" :value="item.id" :label="item.name">
                        </el-option>
                    </el-select>
                </el-col>
                <!-- rank -->
                <el-col :span="8">
                    <el-input-number style="width:50%" v-model="myUmaStaus[5]"></el-input-number>
                </el-col>
                <el-col :span="8">
                    <el-button @click="insertUma2Sql" style="width:40%" type="success"><span>提交</span></el-button>
                </el-col>
            </el-row>
        </div>


        <el-dialog title="选择支援卡" :visible.sync="dialogVisible">
            <SelectWindow  v-on:getCardFromChild='reciveCardItem' />
        </el-dialog>
    </div>
</template>

<script>
    import {
        qurSql
    } from "../jsfile/api/con2sql.js"
    import {
        updatenewuma
    } from "../jsfile/api/insertUma.js"

    import SelectWindow from "@/components/child/SelectWindow.vue"
    export default {
        name: 'RegisterNewUma',
        components: {
            SelectWindow
        },
        data() {
            return {
                sqlcon: {
                    username: 'Guest',
                    userpasswd: 'password#123',
                    database: 'umamusume-pbl',
                },
                //cardItem: [],
                myCardItem: [], //卡-提交
                myCardItemLV: [30, 30, 30, 30, 30, 30], //等级-提交
                dialogVisible: false,
                potionSelector: '0',
                umaItem: [],
                myUmaItem: '', //🐎-提交
                myUmaStaus: [0, 0, 0, 0, 0, 0] //数值-提交
            }
        },
        mounted() {
            // let query_spc =
            //     'SELECT id, spc_attribute AS atb, spc_rare AS rare ,CONCAT(\'【\',spc_secname,\'】－\',spc_name) AS `name` FROM supportcard'
            let query_uma = 'SELECT id, CONCAT(\'【\',uma_secname,\'】－\',uma_name) AS `name` FROM uma'
            // qurSql(this.sqlcon, query_spc, res => {
            //     this.cardItem = res
            //     console.log(res)
            // })
            qurSql(this.sqlcon, query_uma, res => {
                this.umaItem = res
                console.log(res)
            })
        },
        methods: {
            reciveCardItem(data) {
                //console.log(this.potionSelector)
                this.myCardItem[this.potionSelector] = data;
                this.dialogVisible = false
            },
            insertUma2Sql() {
                var umaIsert = {
                    id_name: this.myUmaItem,
                    status: this.myUmaStaus,
                    cardItem: this.myCardItem,
                    cardItemLV: this.myCardItemLV
                }
                updatenewuma(umaIsert, this.sqlcon)
                this.$message("SUCCESS")
            }
        }

    }
</script>

<style scoped>
    .el-row {
        margin: auto;
        padding: 5px 5px;
    }

    .el-input-number {
        width: 25%;
        margin: 5px 5px !important;

    }
</style>