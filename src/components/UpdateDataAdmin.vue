<template>
  <div class="UpdateDataAdmin">
      <el-form :model="spcSubmit" label-width="140px">
        <el-row :gutter="20">
        <el-col :span="8">
            <el-select v-model="spcSubmit.id" filterable placeholder="更新数据的卡" clearable style="width:350px" @change="getRegiedCard">
            <el-option
            v-for="item in spcard"
            :label="'【'+item.spc_secname+'】 - '+item.spc_name"
            :value="item.id">
            </el-option>
            </el-select>
        </el-col>
        <el-col :span="8">
            <el-form-item label="等级">
                <el-input-number v-model="spcSubmit.level" controls-position="right" :step="5"></el-input-number>
            </el-form-item>
        </el-col>
        <el-col :span="8">
            <el-form-item label="等级">
                <el-select v-model="result" filterable placeholder="已存在的等级" clearable >
                <el-option
                v-for="item in regedcard"
                disabled
                :label="'【'+item.spc_lv+'】'"
                :value="item.spc_id">
                </el-option>
                </el-select>
            </el-form-item>
        </el-col>
</el-row>
<el-row :gutter="20">
    <el-col :span="8">
            <el-form-item label="友情ボーナス">
                <el-input-number v-model="spcSubmit.youujo" controls-position="right" :step="10"></el-input-number>
            </el-form-item>
        </el-col>
    
        <el-col :span="8">
            <el-form-item label="やる気効果">
                <el-input-number v-model="spcSubmit.yaruki" controls-position="right" :step="15"></el-input-number>
            </el-form-item>
        </el-col>
        <el-col :span="8">
            <el-form-item label="属性点加成">
                <el-select v-model="attrBonazu.bonasu_pt_p" placeholder="请选择" style="width:100px; padding:0 10px">
                    <el-option
                    v-for="item in attribute_opt"
                    :label="item.label"
                    :value="item.value">
                    </el-option>
                </el-select>
                <el-button type="primary" @click="add1PtBonasu_PT()" >+1</el-button>
                <el-button type="primary" @click="add1PtBonasu_PT('reset')" >reset</el-button>
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
                <el-input-number v-model="spcSubmit.kizuna" controls-position="right" :step="15"></el-input-number>
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
                <el-input-number v-model="spcSubmit.hitlv" controls-position="right" :step="1"></el-input-number>
            </el-form-item>
            
        </el-col>
        <el-col :span="8">
            <el-form-item label="ヒント発生率アップ">
                <el-input-number v-model="spcSubmit.hit_ritu" controls-position="right" :step="20"></el-input-number>
            </el-form-item>
            
        </el-col>
</el-row>
<el-row :gutter="20">
        <el-col :span="8">
            <el-form-item label="得意率">
                <el-input-number v-model="spcSubmit.tokuitu" controls-position="right" :step="20"></el-input-number>
            </el-form-item>
            
        </el-col>
        <el-col :span="8">
            <el-form-item label="消耗体力减少">
                <el-input-number v-model="spcSubmit.reduce_suta" controls-position="right" :step="5"></el-input-number>
            </el-form-item>
            
        </el-col>
        <el-col :span="8">
            <el-form-item label="失败率降低">
                <el-input-number v-model="spcSubmit.reduce_shipai" controls-position="right" :step="10"></el-input-number>
            </el-form-item>
            
        </el-col>
</el-row>
<el-row :gutter="20">
        <el-col :span="8">
            <el-form-item label="初始属性点">
                <el-select v-model="attrBonazu.init_stu_p" placeholder="请选择">
                    <el-option
                    v-for="item in attribute_opt"
                    :label="item.label"
                    :value="item.value">
                    </el-option>
                </el-select>
            </el-form-item>
        </el-col>
        <el-col :span="8">
            <el-form-item label="具体值">
            <el-input-number v-model="attrBonazu.init_stu" controls-position="right" :step="20"></el-input-number>
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
        </el-form-item>
    </el-col>
</el-row>
    </el-form>
  </div>
</template>

<script>
import {qurSql} from "../jsfile/api/con2sql.js"


export default {
    name: 'UpdateDataAdmin',
    data() {
        return {
            spcard:[],
            spcSubmit:{
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
                bonasu_pt: [0,0,0,0,0,0],
                //练习得意率
                tokuitu: '0',
                //初始羁绊
                kizuna: '0',
                //初始能力值加成, 最后为技能点
                init_stu: [0,0,0,0,0,0],
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
            sqlcon:{
                username: 'akarichan',
                userpasswd: 'akariChan@0721',
                hostname: 'rm-bp1id4y905ysrz6pvjo.mysql.rds.aliyuncs.com',
                database: 'umamusume-pbl',
            },
            attribute_opt:[{
                label:"スビート",
                value:0
            },{
                label:"スタミナ",
                value:1
            },{
                label:"パワー",
                value:2
            },{
                label:"根性",
                value:3
            },{
                label:"賢さ",
                value:4
            },{
                label:"スキル",
                value:5
            }],
            attrBonazu:{
                init_stu_p:0,init_stu:0,
                bonasu_pt_p:0,bonasu_pt:0
            },
            query:'select * from supportcard',
            regedcard:[],
            regedcardtmp:'',
            result: '',
        };
    },
    mounted(){
        qurSql(this.sqlcon,'select * from supportcard',res=>{
            this.spcard = res;
            //console.log(res)
        })
    },

    methods:{
        async updateSPCstaus(){
            //this.spcSubmit.bonasu_pt[this.attrBonazu.bonasu_pt_p] = this.attrBonazu.bonasu_pt;
            //this.spcSubmit.init_stu[this.attrBonazu.init_stu_p] = this.attrBonazu.init_stu;

            let isexist;
            await this.isItemExist().then(res => {
                isexist = res;
            }).catch(err => {
                console.log(err)
            })
            if(!isexist){
                this.$message.error('此条记录已存在');
                return;
            }

            //sql语句
            let querystr_a = 'INSERT INTO supportcard_stu (spc_id, spc_lv, spc_youujo, spc_yaruki, \
                            spc_tore, spc_bonasu_pt, spc_tokuitu, spc_kizuna, spc_init_stu, spc_race, \
                            spc_fan, spc_hit_lv, spc_hit_ritu, spc_reduce_suta, spc_reduce_shipai) VALUES';
            let querystr_b = '('+this.spcSubmit.id+', '+this.spcSubmit.level+','+
                            this.spcSubmit.youujo+', '+
                            this.spcSubmit.yaruki+', '+
                            this.spcSubmit.tore+', \''+this.spcSubmit.bonasu_pt.toString()+'\', '+
                            this.spcSubmit.tokuitu+', '+this.spcSubmit.kizuna+', \''+
                            this.spcSubmit.init_stu.toString()+'\', '+this.spcSubmit.race+', '+
                            this.spcSubmit.fan+', '+this.spcSubmit.hitlv+', '+
                            this.spcSubmit.hit_ritu +', '+this.spcSubmit.reduce_suta+', '+
                            this.spcSubmit.reduce_shipai+')';
            console.log(querystr_a+querystr_b);
            qurSql(this.sqlcon,querystr_a+querystr_b,res=>{
                this.result = res;
                console.log(res)
                let msg = "插入成功, 影响行数: "+res.affectedRows+"; insertId:"+res.insertId;
                this.callOutMsg('success',msg);
                console.log(res);
            })
            console.log("success");
        },

        add1PtBonasu_PT(str){
            if(str == 'reset'){
                this.$set(this.spcSubmit,"bonasu_pt",[0,0,0,0,0,0])
                return;
            }
            this.$set(this.spcSubmit.bonasu_pt, this.attrBonazu.bonasu_pt_p, this.spcSubmit.bonasu_pt[this.attrBonazu.bonasu_pt_p]+1)
            //this.spcSubmit.bonasu_pt[this.attrBonazu.bonasu_pt_p] ++;
        },
        addInit_stu(){
            //this.spcSubmit.init_stu[this.attrBonazu.init_stu_p] = this.attrBonazu.init_stu;
            this.$set(this.spcSubmit.init_stu, this.attrBonazu.init_stu_p,this.attrBonazu.init_stu)
        },
        isItemExist(){
            return new Promise((resolve, reject) =>{
                let id = this.spcSubmit.id;
                let level = this.spcSubmit.level;
                let querystr_a = 'SELECT COUNT(*) AS Count \
                                FROM supportcard_stu \
                                WHERE ';
                let querystr_b = 'spc_id='+id+' AND spc_lv='+level;
                let returnData;
                qurSql(this.sqlcon,querystr_a+querystr_b,res=>{
                    if(res[0].Count>0){
                        returnData = false;
                    }else{
                        returnData = true;
                    }
                    resolve(returnData);
                })
                //reject("ERR")
            })
        },
        callOutMsg(type, data){
            this.$message({
                showClose: true,
                center: true,
                message: data,
                type: type
            });
        },
        getRegiedCard(){
            let querystr = `SELECT * FROM
            supportcard_stu
            WHERE supportcard_stu.spc_id = ${this.spcSubmit.id}`;
            qurSql(this.sqlcon,querystr,res=>{
                this.regedcard = res;
                console.log('getRegiedCard')
                console.log(res)
            })

        }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
