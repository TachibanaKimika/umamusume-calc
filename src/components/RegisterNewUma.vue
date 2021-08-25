<!-- 
    更新🐎页面
 -->


<template>
    <div id="Test">
        <div class="inputspcCard">
            <el-row>
                <el-col :span='8'>
                    <el-button v-model="myCardItem[0]" placeholder="支援卡1"
                        @click="dialogVisibleSpc = true;potionSelector=0"><span
                            v-if="myCardItem[0]">{{myCardItem[0].name}}</span><span v-else>请选择支援卡1</span></el-button>
                    <el-input-number v-model="myCardItemLV[0]" :min="1" :max="50" :step="5" controls-position="right">
                    </el-input-number>
                </el-col>
                <el-col :span='8'>
                    <el-button v-model="myCardItem[1]" placeholder="支援卡2"
                        @click="dialogVisibleSpc = true;potionSelector=1"><span
                            v-if="myCardItem[1]">{{myCardItem[1].name}}</span><span v-else>请选择支援卡2</span></el-button>
                    <el-input-number v-model="myCardItemLV[1]" :min="1" :max="50" :step="5" controls-position="right">
                    </el-input-number>
                </el-col>
                <el-col :span='8'>
                    <el-button v-model="myCardItem[2]" placeholder="支援卡3"
                        @click="dialogVisibleSpc = true;potionSelector=2"><span
                            v-if="myCardItem[2]">{{myCardItem[2].name}}</span><span v-else>请选择支援卡3</span></el-button>
                    <el-input-number v-model="myCardItemLV[2]" :min="1" :max="50" :step="5" controls-position="right">
                    </el-input-number>
                </el-col>
            </el-row>
            <el-row>
                <el-col :span='8'>
                    <el-button v-model="myCardItem[3]" placeholder="支援卡4"
                        @click="dialogVisibleSpc = true;potionSelector=3"><span
                            v-if="myCardItem[3]">{{myCardItem[3].name}}</span><span v-else>请选择支援卡4</span></el-button>
                    <el-input-number v-model="myCardItemLV[3]" :min="1" :max="50" :step="5" controls-position="right">
                    </el-input-number>
                </el-col>
                <el-col :span='8'>
                    <el-button v-model="myCardItem[4]" placeholder="支援卡5"
                        @click="dialogVisibleSpc = true;potionSelector=4"><span
                            v-if="myCardItem[4]">{{myCardItem[4].name}}</span><span v-else>请选择支援卡5</span></el-button>
                    <el-input-number v-model="myCardItemLV[4]" :min="1" :max="50" :step="5" controls-position="right">
                    </el-input-number>
                </el-col>
                <el-col :span='8'>
                    <el-button v-model="myCardItem[5]" placeholder="支援卡6"
                        @click="dialogVisibleSpc = true;potionSelector=5"><span
                            v-if="myCardItem[5]">{{myCardItem[5].name}}</span><span v-else>请选择支援卡6</span></el-button>
                    <el-input-number v-model="myCardItemLV[5]" :min="1" :max="50" :step="5" controls-position="right">
                    </el-input-number>
                </el-col>
            </el-row>
        </div>
        <div class="inputUma">
            <el-row>
                <el-col :span='8'>
                    <el-tag>スビ</el-tag>
                    <el-input-number v-model="myUmaStaus[0]" controls-position="right" :min="1" :max="1200" :step="100">
                    </el-input-number>
                    <el-tag>スタ</el-tag>
                    <el-input-number v-model="myUmaStaus[1]" controls-position="right" :min="1" :max="1200" :step="100">
                    </el-input-number>
                </el-col>
                <el-col :span='8'>
                    <el-tag>パワー</el-tag>
                    <el-input-number v-model="myUmaStaus[2]" controls-position="right" :min="1" :max="1200" :step="100">
                    </el-input-number>
                    <el-tag>根性</el-tag>
                    <el-input-number v-model="myUmaStaus[3]" controls-position="right" :min="1" :max="1200" :step="100">
                    </el-input-number>
                </el-col>
                <el-col :span='8'>
                    <el-tag>賢さ</el-tag>
                    <el-input-number v-model="myUmaStaus[4]" controls-position="right" :min="1" :max="1200" :step="100">
                    </el-input-number>
                    <el-tag>スコア</el-tag>
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
                    <el-button　@click="dialogVisibleTekisei=true">適性</el-button>
                    <el-button　@click="dialogVisibleSkill=true">スキル</el-button>
                </el-col>
                <el-col :span="8">
                    <el-checkbox v-model="notshowUser">匿名提交</el-checkbox>
                    <el-button @click="insertUma2Sql" style="width:30%;margin-left:20px;" type="success"><span>提交</span></el-button>
                </el-col>
            </el-row>
        </div>
        <el-dialog title="适性选择" width="60%" class="umaconfig"  :visible.sync="dialogVisibleTekisei">
            <span>馬場適性</span>  
            <el-tag>芝</el-tag>
            <el-select v-model="myUmaConfig.baba.shiba" size="mini">
                <el-option
                v-for="item in rankOption"
                :key="item"
                :value="item">
                </el-option>
            </el-select>

            <el-tag>ダート</el-tag>
            <el-select v-model="myUmaConfig.baba.dato" size="mini">
                <el-option
                v-for="item in rankOption"
                :key="item"
                :value="item">
                </el-option>
            </el-select>

            <br>

            <span>距離適性</span>  
            <el-tag>短距離</el-tag>
            <el-select v-model="myUmaConfig.kyori.tankyori" size="mini">
                <el-option
                v-for="item in rankOption"
                :key="item"
                :value="item">
                </el-option>
            </el-select>

            <el-tag>マイル</el-tag>
            <el-select v-model="myUmaConfig.kyori.mairu" size="mini">
                <el-option
                v-for="item in rankOption"
                :key="item"
                :value="item">
                </el-option>
            </el-select>

            <el-tag>中距離</el-tag>
            <el-select v-model="myUmaConfig.kyori.juukyori" size="mini">
                <el-option
                v-for="item in rankOption"
                :key="item"
                :value="item">
                </el-option>
            </el-select>

            <el-tag>長距離</el-tag>
            <el-select v-model="myUmaConfig.kyori.cyoukyori" size="mini">
                <el-option
                v-for="item in rankOption"
                :key="item"
                :value="item">
                </el-option>
            </el-select>

            <br>

            <span>脚質</span>  
            <el-tag>逃げ</el-tag>
            <el-select v-model="myUmaConfig.kyakushitu.nige" size="mini">
                <el-option
                v-for="item in rankOption"
                :key="item"
                :value="item">
                </el-option>
            </el-select>

            <el-tag>先行</el-tag>
            <el-select v-model="myUmaConfig.kyakushitu.senkou" size="mini">
                <el-option
                v-for="item in rankOption"
                :key="item"
                :value="item">
                </el-option>
            </el-select>

            <el-tag>差し</el-tag>
            <el-select v-model="myUmaConfig.kyakushitu.sashi" size="mini">
                <el-option
                v-for="item in rankOption"
                :key="item"
                :value="item">
                </el-option>
            </el-select>

            <el-tag>追込</el-tag>
            <el-select v-model="myUmaConfig.kyakushitu.oikomi" size="mini">
                <el-option
                v-for="item in rankOption"
                :key="item"
                :value="item">
                </el-option>
            </el-select>

        </el-dialog>
        

        <el-dialog title="选择支援卡" :visible.sync="dialogVisibleSpc">
            <SelectWindow  v-on:getCardFromChild='reciveCardItem' />
        </el-dialog>

        <el-dialog title="选择技能" :visible.sync="dialogVisibleSkill" fullscreen>
            <SelectSkill v-on:getSkillFromChild='reciveSkill'/>
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
    import SelectSkill from "@/components/child/SelectSkill.vue"
    export default {
        name: 'RegisterNewUma',
        components: {
            SelectWindow,SelectSkill
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
                dialogVisibleTekisei: false,
                dialogVisibleSpc: false,
                dialogVisibleSkill:false,
                potionSelector: '0',
                umaItem: [],
                myUmaItem: '', //🐎-提交
                myUmaStaus: [0, 0, 0, 0, 0, 0], //数值-提交

                // TODO: 添加🐎的配置, 添加🐎的技能
                myUmaConfig: {
                    baba:{
                        shiba:"A",
                        dato:"A"
                    },
                    kyori:{
                        tankyori:"A",
                        mairu:"A",
                        juukyori:"A",
                        cyoukyori:"A",
                    },
                    kyakushitu:{
                        nige:"A",
                        senkou:"A",
                        sashi:"A",
                        oikomi:"A"
                    }
                },
                rankOption:['S','A', 'B', 'C', 'D', 'E','F','G'],
                myUmaSkill:[],
                notshowUser:false
            }
        },
        mounted() {
            let query_uma = 'SELECT id, CONCAT(\'【\',uma_secname,\'】－\',uma_name) AS `name` FROM uma'
            qurSql(this.sqlcon, query_uma, res => {
                this.umaItem = res
                console.log(res)
            })
        },
        methods: {
            reciveCardItem(data) {
                this.myCardItem[this.potionSelector] = data;
                this.dialogVisibleSpc = false
            },
            reciveSkill(data){
                this.myUmaSkill = data
                this.dialogVisibleSkill = false
            },
            async insertUma2Sql() {
                // console.log(this.notshowUser)
                if(!(this.notshowUser || !this.$store.state.user.uuid==null)){
                    this.$message.error('请先登录')
                    return
                }
                var umaInsert = {
                    id_name: this.myUmaItem,
                    status: this.myUmaStaus,
                    cardItem: this.myCardItem,
                    cardItemLV: this.myCardItemLV,
                    moreinfo: this.myUmaConfig,
                    skill: this.myUmaSkill,
                    userUUID: this.showUser?this.$store.state.user.uuid:null,
                }
                let flag = true;
                if(this.myUmaItem == '' ){
                    this.$message.error('马没选')
                    flag=false
                }
                if(this.myUmaSkill.length == 0){
                    this.$message.error('技能没选')
                    flag=false
                }
                if(this.myCardItem.length !=6){
                    this.$message.error('支援卡没选全')
                    flag=false
                }else{
                    this.myCardItem.forEach((el)=>{
                        if(el==null){
                            flag=false
                            this.$message.error('支援卡没选全')
                        }
                    })

                }
                
                if(!flag){
                    return
                }
                await updatenewuma(umaInsert)
                this.$message("提交成功")
            }
        },
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

    .el-dialog .el-tag{
        margin: 0.5vw
    }

    .el-dialog .el-select{
        width: 6vw
    }

    .umaconfig{
        text-align: left;
        
    }
</style>