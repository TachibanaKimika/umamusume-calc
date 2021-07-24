<template>
    <div class="UpdateDataAdmin">
        <el-form :model="spcSubmit" label-width="140px">
            <el-row :gutter="20">
                <el-col :span="8">
                    <!-- <el-select v-model="spcSubmit.id" filterable placeholder="更新数据的卡" clearable style="width:350px" @change="getRegiedCard">
            <el-option
            v-for="item in spcard"
            :label="'【'+item.spc_secname+'】 - '+item.spc_name"
            :value="item.id">
            </el-option>
            </el-select> -->
                    <el-button v-model="spcSubmit.id" @click="dialogVisible = true;getRegiedCard()"><span
                            v-if="selectedCardName">{{selectedCardName}}</span><span v-else>请选择支援卡</span></el-button>
                </el-col>
                <el-col :span="8">
                    <el-form-item label="等级">
                        <el-input-number v-model="spcSubmit.level" controls-position="right" :step="5">
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
                        <el-input-number v-model="spcSubmit.youujo" :controls=false style="width:7vw">
                        </el-input-number>
                        <el-button @click="spcSubmit.youujo!=0?spcSubmit.youujo = ((spcSubmit.youujo/100+1)*1.1-1)*100:spcSubmit.youujo+=10">固有</el-button>
                    </el-form-item>
                </el-col>
                <el-col :span="8">
                    <el-form-item label="やる気効果">
                        <el-input-number v-model="spcSubmit.yaruki" controls-position="right" :step="15">
                        </el-input-number>
                    </el-form-item>
                </el-col>
                <el-col :span="8">
                    <el-form-item label="属性点加成">
                        <el-select v-model="attrBonazu.bonasu_pt_p" placeholder="请选择"
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
                        <el-input-number v-model="spcSubmit.tore" controls-position="right" :step="5"></el-input-number>
                    </el-form-item>
                </el-col>
                <el-col :span="8">
                    <el-form-item label="初期絆ゲージ">
                        <el-input-number v-model="spcSubmit.kizuna" controls-position="right" :step="15">
                        </el-input-number>
                    </el-form-item>

                </el-col>
                <el-col :span="8">
                    <el-form-item label="レースボーナス">
                        <el-input-number v-model="spcSubmit.race" controls-position="right" :step="5"></el-input-number>
                    </el-form-item>

                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="8">
                    <el-form-item label="ファン数ボーナス">
                        <el-input-number v-model="spcSubmit.fan" controls-position="right" :step="5"></el-input-number>
                    </el-form-item>

                </el-col>
                <el-col :span="8">
                    <el-form-item label="ヒントレベルアップ">
                        <el-input-number v-model="spcSubmit.hitlv" controls-position="right" :step="1">
                        </el-input-number>
                    </el-form-item>

                </el-col>
                <el-col :span="8">
                    <el-form-item label="ヒント発生率アップ">
                        <el-input-number v-model="spcSubmit.hit_ritu" controls-position="right" :step="20">
                        </el-input-number>
                    </el-form-item>

                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="8">
                    <el-form-item label="得意率">
                        <el-input-number v-model="spcSubmit.tokuitu" :controls=false style="width:7vw">
                        </el-input-number>
                        <el-button @click="spcSubmit.tokuitu!=0?spcSubmit.tokuitu = ((spcSubmit.tokuitu/100+1)*1.2-1)*100:spcSubmit.tokuitu+=20">固有</el-button>
                    </el-form-item>

                </el-col>
                <el-col :span="8">
                    <el-form-item label="消耗体力减少">
                        <el-input-number v-model="spcSubmit.reduce_suta" controls-position="right" :step="5">
                        </el-input-number>
                    </el-form-item>

                </el-col>
                <el-col :span="8">
                    <el-form-item label="失败率降低">
                        <el-input-number v-model="spcSubmit.reduce_shipai" controls-position="right" :step="10">
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
                        <el-input-number v-model="attrBonazu.init_stu" controls-position="right" :step="20">
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

        <el-dialog title="选择支援卡" :visible.sync="dialogVisible">
            <SelectWindow :cards="spcard" v-on:getCardFromChild='reciveCardItem' />
        </el-dialog>
    </div>
</template>

<script>
    import {
        qurSql
    } from "../jsfile/api/con2sql.js"

    import SelectWindow from "@/components/child/SelectWindow.vue"
    export default {
        name: 'UpdateDataAdmin',
        components: {
            SelectWindow
        },
        data() {
            return {
                dialogVisible: false,
                spcard: [],
                spcSubmit: {
                    id: '',
                    //等级
                    level: '30',
                    //友情锻炼加成
                    youujo: '0',
                    //调子加成
                    yaruki: '0',
                    //练习加成
                    tore: '0',
                    //练习属性点加成,最后为技能点
                    bonasu_pt: [0, 0, 0, 0, 0, 0],
                    //练习得意率
                    tokuitu: '0',
                    //初始羁绊
                    kizuna: '0',
                    //初始能力值加成, 最后为技能点
                    init_stu: [0, 0, 0, 0, 0, 0],
                    //比赛加成
                    race: '0',
                    //粉丝数加成
                    fan: '0',
                    //hit等级提升
                    hitlv: '0',
                    //hit率加成
                    hit_ritu: '0',
                    //体力减少
                    reduce_suta: '0',
                    //失败率降低
                    reduce_shipai: '0',
                },
                sqlcon: {
                    username: 'akarichan',
                    userpasswd: 'akariChan@0721',
                    database: 'umamusume-pbl',
                },
                attribute_opt: [{
                    label: "スビート",
                    value: 0
                }, {
                    label: "スタミナ",
                    value: 1
                }, {
                    label: "パワー",
                    value: 2
                }, {
                    label: "根性",
                    value: 3
                }, {
                    label: "賢さ",
                    value: 4
                }, {
                    label: "スキル",
                    value: 5
                }],
                attrBonazu: {
                    init_stu_p: 0,
                    init_stu: 0,
                    bonasu_pt_p: 0,
                    bonasu_pt: 0
                },
                query: 'select * from supportcard',
                regedcard: [],
                regedcardtmp: '',
                result: '',
                selectedCardName: '',
            };
        },
        mounted() {
            let query_spc =
                'SELECT id, spc_attribute AS atb, spc_rare AS rare ,CONCAT(\'【\',spc_secname,\'】　－　\',spc_name) AS `name` FROM supportcard'

            qurSql({
                username: 'Guest',
                userpasswd: 'password#123',
                database: 'umamusume-pbl',
            }, query_spc, res => {
                this.spcard = res;
            })
        },

        methods: {
            async updateSPCstaus(method) {
                //this.spcSubmit.bonasu_pt[this.attrBonazu.bonasu_pt_p] = this.attrBonazu.bonasu_pt;
                //this.spcSubmit.init_stu[this.attrBonazu.init_stu_p] = this.attrBonazu.init_stu;
                if(method == 'local'){  
                    //TO DO
                    console.log(this.spcSubmit)
                    let sub = this.transfer2std(this.spcSubmit)
                    this.$store.commit('insertcard2store',sub);
                    
                    //let tmp = await this.$store.state.myCard
                    console.log('this is component')
                    console.log(this.mycardInVuex)
                    return;
                }
                let isexist;
                await this.isItemExist().then(res => {
                    isexist = res;
                }).catch(err => {
                    console.log(err)
                })
                if (!isexist) {
                    this.$message.error('此条记录已存在');
                    return;
                }

                
                //sql语句
                let querystr_a = 'INSERT INTO supportcard_stu (spc_id, spc_lv, spc_youujo, spc_yaruki, \
                            spc_tore, spc_bonasu_pt, spc_tokuitu, spc_kizuna, spc_init_stu, spc_race, \
                            spc_fan, spc_hit_lv, spc_hit_ritu, spc_reduce_suta, spc_reduce_shipai) VALUES';
                let querystr_b = '(' + this.spcSubmit.id + ', ' + this.spcSubmit.level + ',' +
                    this.spcSubmit.youujo + ', ' +
                    this.spcSubmit.yaruki + ', ' +
                    this.spcSubmit.tore + ', \'' + this.spcSubmit.bonasu_pt.toString() + '\', ' +
                    this.spcSubmit.tokuitu + ', ' + this.spcSubmit.kizuna + ', \'' +
                    this.spcSubmit.init_stu.toString() + '\', ' + this.spcSubmit.race + ', ' +
                    this.spcSubmit.fan + ', ' + this.spcSubmit.hitlv + ', ' +
                    this.spcSubmit.hit_ritu + ', ' + this.spcSubmit.reduce_suta + ', ' +
                    this.spcSubmit.reduce_shipai + ')';
                // console.log(querystr_a+querystr_b);
                qurSql(this.sqlcon, querystr_a + querystr_b, res => {
                    this.result = res;
                    // console.log(res)
                    let msg = "插入成功, 影响行数: " + res.affectedRows + "; insertId:" + res.insertId;
                    this.callOutMsg('success', msg);
                    // console.log(res);
                })
                // console.log("success");
            },

            add1PtBonasu_PT(str) {
                if (str == 'reset') {
                    this.$set(this.spcSubmit, "bonasu_pt", [0, 0, 0, 0, 0, 0])
                    return;
                }
                this.$set(this.spcSubmit.bonasu_pt, this.attrBonazu.bonasu_pt_p, this.spcSubmit.bonasu_pt[this
                    .attrBonazu.bonasu_pt_p] + 1)
                //this.spcSubmit.bonasu_pt[this.attrBonazu.bonasu_pt_p] ++;
            },
            addInit_stu() {
                //this.spcSubmit.init_stu[this.attrBonazu.init_stu_p] = this.attrBonazu.init_stu;
                this.$set(this.spcSubmit.init_stu, this.attrBonazu.init_stu_p, this.attrBonazu.init_stu)
            },
            isItemExist() {
                return new Promise((resolve, reject) => {
                    let id = this.spcSubmit.id;
                    let level = this.spcSubmit.level;
                    let querystr_a = 'SELECT COUNT(*) AS Count \
                                FROM supportcard_stu \
                                WHERE ';
                    let querystr_b = 'spc_id=' + id + ' AND spc_lv=' + level;
                    let returnData;
                    qurSql(this.sqlcon, querystr_a + querystr_b, res => {
                        if (res[0].Count > 0) {
                            returnData = false;
                        } else {
                            returnData = true;
                        }
                        resolve(returnData);
                    })
                    //reject("ERR")
                })
            },
            callOutMsg(type, data) {
                this.$message({
                    showClose: true,
                    center: true,
                    message: data,
                    type: type
                });
            },
            getRegiedCard() {
                let querystr = `SELECT * FROM
                supportcard_stu
                WHERE supportcard_stu.spc_id = ${this.spcSubmit.id}`;
                qurSql({
                    username: 'Guest',
                    userpasswd: 'password#123',
                    database: 'umamusume-pbl',
                }, querystr, res => {
                    this.regedcard = res;
                })

            },
            reciveCardItem(data) {
                // console.log(data)
                this.selectedCardName = data.name
                this.spcSubmit.id = data.id
                
                this.dialogVisible = false
                this.getRegiedCard()
            },
            transfer2std(rowcard){
                // Sugar.extend();
                /*
                row={
                    //useful
                    bonasu_pt:array[6],
                    fan:number,
                    hit_ritu:number,
                    hitlv:number,
                    id:number,
                    init_su:array[6],
                    kizuna:number,
                    level:number,
                    race:number,
                    tokuitu:string,
                    tore:number,
                    yaruki:number,
                    youjo:string
                }
                final={
                    id:number,//具体卡的id值
                    spc_arribute:number,
                    spc_bonasu_pt:string(array[6]),
                    spc_fan:number,
                    spc_hit_lv:number,
                    spc_hit_ritu:number,
                    spc_id:number,
                    spc_init_stu:string(array[6]),
                    spc_kizuna:number,
                    spc_lv:number,
                    spc_name:string,
                    spc_race:number,
                    spc_rare, 
                    // spc_reduce_shipai, 
                    // spc_reduce_suta, 
                    spc_tokuitu, 
                    spc_tore, 
                    spc_yaruki, 
                    spc_youujo
                }
                */
                let {atb, name, rare} = this.spcard.find({id:rowcard.id})
                return {
                    id: rowcard.id*rowcard.id + Math.floor(Math.random()*(1000)),
                    spc_bonasu_pt: rowcard.bonasu_pt.toString(),
                    spc_fan: rowcard.fan,
                    spc_hit_lv: rowcard.hitlv,
                    spc_hit_ritu: rowcard.hit_ritu,
                    spc_id: rowcard.id,
                    spc_init_stu: rowcard.init_stu.toString(),
                    spc_kizuna: rowcard.kizuna,
                    spc_lv: rowcard.level,
                    spc_race: rowcard.race,
                    spc_tokuitu: rowcard.tokuitu,
                    spc_tore: rowcard.tore,
                    spc_yaruki: rowcard.yaruki,
                    spc_youujo: rowcard.youujo,
                    spc_name: name, 
                    spc_attribute: atb,
                    spc_rare: rare
                }
            }
        },
        watch:{
            spcSubmit:{
                deep: true,
                handler(){
                    this.spcSubmit.youujo = (this.spcSubmit.youujo*1).toFixed(0)
                    this.spcSubmit.tokuitu = (this.spcSubmit.tokuitu*1).toFixed(0)
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

<style scoped>
</style>