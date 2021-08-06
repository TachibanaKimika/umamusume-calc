<!-- 新增 修改 支援卡 -->
<template>
    <div class="InsertCardData">
        <el-form :model="spcSubmit" label-width="140px">
            <el-row :gutter="20">
                <el-col :span="6">
                    <span v-if="selectedCardName" >{{selectedCardName}}</span><span v-else>请选择支援卡</span>
                </el-col>
                <el-col :span="2">
                    <!-- new -->
                    <el-tooltip class="item" effect="dark" content="新增支援卡数据" placement="top-start">
                    <el-button @click="dialogVisible = true;getRegiedCard()" icon="el-icon-plus" circle></el-button>   
                    </el-tooltip>
                    <!-- edit -->
                    <el-tooltip class="item" effect="dark" content="修改已有数据" placement="top-start">
                    <el-button @click="dialogVisible_registered = true;" icon="el-icon-edit" circle></el-button>
                    </el-tooltip>
                </el-col>
                <el-col :span="8">
                    <el-form-item label="等级">
                        <el-input-number v-model="spcSubmit.level" controls-position="right" :step="5" :max="50"
                            :min="1">
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
                        <el-button
                            @click="spcSubmit.youujo!=0?spcSubmit.youujo = ((spcSubmit.youujo/100+1)*1.1-1)*100:spcSubmit.youujo+=10">
                            固有</el-button>
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
                        <el-input-number v-model="spcSubmit.tore" controls-position="right" :step="5" :min="0">
                        </el-input-number>
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
                        <el-input-number v-model="spcSubmit.race" controls-position="right" :step="5" :min="0">
                        </el-input-number>
                    </el-form-item>

                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="8">
                    <el-form-item label="ファン数ボーナス">
                        <el-input-number v-model="spcSubmit.fan" controls-position="right" :step="5" :min="0">
                        </el-input-number>
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
                        <el-button
                            @click="spcSubmit.tokuitu!=0?spcSubmit.tokuitu = ((spcSubmit.tokuitu/100+1)*1.2-1)*100:spcSubmit.tokuitu+=20">
                            固有</el-button>
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
                        <el-input-number v-model="spcSubmit.reduce_shipai" controls-position="right" :step="10"
                            :min="0">
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
                    <!-- <el-input v-model="sqlcon.username" placeholder="数据库用户名"></el-input> -->
                </el-col>
                <el-col :span="4">
                    <!-- <el-input show-password v-model="sqlcon.userpasswd" placeholder="数据库密码"></el-input> -->
                </el-col>
                <el-col :span="8">
                    <el-form-item label="提交更改">
                        <el-button type="success" @click="updateSPCstaus()">提交</el-button>
                        <el-button type="success" @click="updateSPCstaus('local')">提交至本地</el-button>
                    </el-form-item>
                </el-col>
            </el-row>
        </el-form>

        <el-dialog title="选择支援卡" :visible.sync="dialogVisible">
            <SelectWindow v-on:getCardFromChild='reciveCardItem' />
        </el-dialog>

        <el-dialog title="选择支援卡" :visible.sync="dialogVisible_registered">
            <SelectWindowOfRegistedCard v-on:getCardFromChild='reciveCardItem2' />
        </el-dialog>
    </div>
</template>

<script>
    import {
        qurSql
    } from "../jsfile/api/con2sql.js"

    import SelectWindow from "@/components/child/SelectWindow.vue"
    import SelectWindowOfRegistedCard from "@/components/child/SelectWindowOfRegistedCard.vue"

    export default {
        name: 'InsertCardData',
        components: {
            SelectWindow,
            SelectWindowOfRegistedCard
        },
        data() {
            return {
                dialogVisible: false,
                dialogVisible_registered: false,
                //spcard: [],
                spcSubmit: {
                    id: '', //此处指支援卡id
                    level: '30', //等级
                    youujo: '0', //友情锻炼加成
                    yaruki: '0', //调子加成
                    tore: '0', //练习加成
                    bonasu_pt: [0, 0, 0, 0, 0, 0], //练习属性点加成,最后为技能点
                    tokuitu: '0', //练习得意率
                    kizuna: '0', //初始羁绊
                    init_stu: [0, 0, 0, 0, 0, 0], //初始能力值加成, 最后为技能点
                    race: '0', //比赛加成
                    fan: '0', //粉丝数加成
                    hitlv: '0', //hit等级提升
                    hit_ritu: '0', //hit率加成
                    reduce_suta: '0', //体力减少
                    reduce_shipai: '0', //失败率降低
                    Inf_ID: '0' //唯一识别id
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
                regedcard: [],
                regedcardtmp: '',
                result: '',
                selectedCardName: '',
            };
        },

        methods: {
            async updateSPCstaus(method) {
                if (this.spcSubmit.id == '') {
                    this.callOutMsg('error', '请先选择一张卡');
                    return;
                }

                //加载到本地
                if (method == 'local') {
                    console.log("this.spcSubmit")
                    console.log(this.spcSubmit)
                    console.log(this.mycardInVuex)
                    if(this.isItemExist('vuex')){//有重复
                        this.$confirm('检测到本地已有重复的卡, 是否更新', '提示', {
                            confirmButtonText: '确定',
                            cancelButtonText: '取消',
                            type: 'warning'
                        }).then(() => {
                            let id = this.spcSubmit.Inf_ID
                            let sub = this.transfer2std(this.spcSubmit)
                            sub.id = id
                            this.$store.commit('updatecard2store', sub)
                            this.callOutMsg('success', '修改成功')
                        }).catch((err) => {
                            console.log(err)
                            this.callOutMsg('info', '已取消更改')
                        });
                        return
                    }else{
                        let sub = this.transfer2std(this.spcSubmit)
                        this.$store.commit('insertcard2store', sub)
                        this.callOutMsg('success', '添加至本地成功')
                        return
                    }
                    
                }

                if(this.userData.uuid == null){
                    this.callOutMsg('error', '请先登录')
                    return
                }
                let isexist = await this.isItemExist('sql')
                //当数据已存在时更改数据
                if (!isexist) {
                    this.$confirm('检测到已有重复的卡, 是否更新', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(() => {
                        let query = `UPDATE ${this.$store.state.user.group == 'admin'?'supportcard_stu':'supportcard_stu_user'}
                        SET spc_youujo=${this.spcSubmit.youujo}, spc_yaruki=${this.spcSubmit.yaruki}, spc_tore=${this.spcSubmit.tore}, spc_bonasu_pt='${this.spcSubmit.bonasu_pt.toString()}', spc_tokuitu=${this.spcSubmit.tokuitu},
                        spc_kizuna=${this.spcSubmit.kizuna}, spc_init_stu='${this.spcSubmit.init_stu.toString()}', spc_race=${this.spcSubmit.race}, 
                        spc_fan=${this.spcSubmit.fan}, spc_hit_lv=${this.spcSubmit.hitlv}, spc_hit_ritu=${this.spcSubmit.hit_ritu}, spc_reduce_suta=${this.spcSubmit.reduce_suta}, spc_reduce_shipai=${this.spcSubmit.reduce_shipai}
                        WHERE spc_id = ${this.spcSubmit.id} AND spc_lv = ${this.spcSubmit.level} ${this.$store.state.user.group == 'admin'?'':'AND spc_uuid='+this.$store.state.user.uuid}`
                        console.log(query)
                        qurSql(this.sqlcon, query, res => {
                            console.log(res)
                            let msg = `修改成功, 影响行数:  + ${res.affectedRows}, msg=${res.message}`
                            this.callOutMsg('success', msg)
                        })
                    }).catch((err) => {
                        console.log(err)
                        this.callOutMsg('info', '已取消更改')
                    });
                    return;
                }

                //插入数据(用户以及管理员通用)
                let querystr = `INSERT INTO ${this.$store.state.user.group == 'admin'?'supportcard_stu':'supportcard_stu_user'} (spc_id, spc_lv, spc_youujo, spc_yaruki, 
                                spc_tore, spc_bonasu_pt, spc_tokuitu, spc_kizuna, spc_init_stu, spc_race, 
                                spc_fan, spc_hit_lv, spc_hit_ritu, spc_reduce_suta, spc_reduce_shipai
                                ${this.$store.state.user.group == 'admin'?'':', spc_uuid'}) VALUES
                                (${this.spcSubmit.id}, ${this.spcSubmit.level}, ${this.spcSubmit.youujo}, ${this.spcSubmit.yaruki}, 
                                ${this.spcSubmit.tore}, '${this.spcSubmit.bonasu_pt.toString()}', ${this.spcSubmit.tokuitu}, ${this.spcSubmit.kizuna}, '${this.spcSubmit.init_stu.toString()}',${this.spcSubmit.race},
                                ${this.spcSubmit.fan}, ${this.spcSubmit.hitlv}, ${this.spcSubmit.hit_ritu}, ${this.spcSubmit.reduce_suta}, ${this.spcSubmit.reduce_shipai}
                                ${this.$store.state.user.group == 'admin'?'':', '+this.$store.state.user.uuid})`
                console.log(querystr)
                qurSql(this.sqlcon, querystr, res => {
                    console.log(res)
                    let msg = "插入成功, 影响行数: " + res.affectedRows + "; insertId:" + res.insertId;
                    this.callOutMsg('success', msg);
                })
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
                this.$set(this.spcSubmit.init_stu, this.attrBonazu.init_stu_p, this.attrBonazu.init_stu)
            },
            isItemExist(method) {
                if(method==='sql'){
                    //检测数据库中是否有重复的行, user检测该uuid下的数据是否有重复, admin检测主表的数据是否有重复
                    return new Promise((resolve, reject) => {
                        let id = this.spcSubmit.id
                        let level = this.spcSubmit.level
                        let querystr = `SELECT COUNT(*) AS Count FROM ${this.$store.state.user.group == 'admin'?'supportcard_stu':'supportcard_stu_user'} 
                                        WHERE spc_id=${id} AND spc_lv=${level} ${this.$store.state.user.group == 'admin'?'':'AND spc_uuid='+this.$store.state.user.uuid}`
                        let returnData
                        qurSql(this.sqlcon, querystr, res => {
                            if (res[0].Count > 0) {
                                returnData = false
                            } else {
                                returnData = true
                            }
                            resolve(returnData)
                        })
                    })
                }else if(method ==='vuex'){
                    for(let i in this.mycardInVuex){
                        if(this.mycardInVuex[i].id === this.spcSubmit.Inf_ID){
                            console.log(this.spcSubmit.Inf_ID)
                            return true
                        }
                    }
                    return false
                }
                
            },
            callOutMsg(type, data) {
                this.$message({
                    showClose: true,
                    center: true,
                    message: data,
                    type: type
                });
            },

            //查找此卡对应的等级
            getRegiedCard() {
                let querystr = `SELECT * FROM supportcard_stu WHERE supportcard_stu.spc_id = ${this.spcSubmit.id}`;
                qurSql(undefined, querystr, res => {
                    this.regedcard = res;
                })
            },

            //子组件(未注册的支援卡)
            reciveCardItem(data) {
                this.selectedCardName = data.name
                this.spcSubmit.id = data.id
                this.spcSubmit.atb = data.atb
                this.spcSubmit.rare = data.rare
                this.spcSubmit.name = data.name
                this.dialogVisible = false
                this.getRegiedCard()
            },

            //子组件(注册的支援卡)
            reciveCardItem2(data) {
                console.log(data)
                this.selectedCardName = data.spc_name
                this.spcSubmit = this.transferStd2Submit(data)
                this.dialogVisible_registered = false
            },


            //将本页面数据转换为标准数据格式
            transfer2std(rowcard) {
                //let {atb, name, rare} = this.spcard.find({id:rowcard.id})
                return {
                    id: rowcard.id * rowcard.id + Math.floor(Math.random() * (1000)) + 1000,
                    spc_bonasu_pt: rowcard.bonasu_pt.toString(),
                    spc_fan: rowcard.fan,
                    spc_hit_lv: rowcard.hitlv,
                    spc_hit_ritu: rowcard.hit_ritu,
                    spc_id: rowcard.id,
                    spc_init_stu: rowcard.init_stu.toString(),
                    spc_kizuna: parseInt(rowcard.kizuna),
                    spc_lv: rowcard.level,
                    spc_race: rowcard.race,
                    spc_tokuitu: parseInt(rowcard.tokuitu),
                    spc_tore: rowcard.tore,
                    spc_yaruki: rowcard.yaruki,
                    spc_youujo: parseInt(rowcard.youujo),
                    spc_name: rowcard.name,
                    spc_attribute: rowcard.atb,
                    spc_rare: rowcard.rare,
                    spc_reduce_suta: rowcard.reduce_suta,
                    spc_reduce_shipai: rowcard.reduce_shipai,
                    // atb:rowcard.atb,
                    // name:rowcard.name,
                    // rare: rowcard.rare,
                    localData: true
                }
            },

            //将标准格式转换成本页面格式
            transferStd2Submit(std) {
                return {
                    id: std.spc_id,
                    Inf_ID:std.id,
                    bonasu_pt: std.spc_bonasu_pt,
                    fan: std.spc_fan,
                    hitlv: std.spc_hit_lv,
                    hit_ritu: std.spc_hit_ritu,
                    init_stu: std.spc_init_stu,
                    kizuna: std.spc_kizuna,
                    level: std.spc_lv,
                    race: std.spc_race,
                    tokuitu: std.spc_tokuitu,
                    tore: std.spc_tore,
                    yaruki: std.spc_yaruki,
                    youujo: std.spc_youujo,
                    name: std.spc_name,
                    atb: std.spc_attribute,
                    rare: std.spc_rare,
                    reduce_suta: std.spc_reduce_suta,
                    reduce_shipai: std.spc_reduce_shipai,
                }
            },


            updateOrInsertBySQL(method_1, method_2, carddata){
                
            }
        },
        watch: {
            spcSubmit: {
                deep: true,
                handler() {
                    this.spcSubmit.youujo = (this.spcSubmit.youujo * 1).toFixed(0)
                    this.spcSubmit.tokuitu = (this.spcSubmit.tokuitu * 1).toFixed(0)
                }
            }
        },
        computed: {
            mycardInVuex() {
                return this.$store.state.myCard
            },
            userData(){
                return this.$store.state.user
            }
        }
    }
</script>


<style scoped>
.el-button{
    margin: 0 10px
}
</style>