<template>
  <div class="UpdateDataAdmin">
      <el-form :model="spcSubmit" label-width="100px" :label-position="left">
        <el-row>
        <el-col :span="8">
        <el-form-item label="支援卡">
            <el-select v-model="spcSubmit.id" filterable placeholder="请选择">
            <el-option
            v-for="item in spcard"
            :label="item.spc_name+'-'+item.spc_secname"
            :value="item.id">
            </el-option>
            </el-select>
        </el-form-item>
        </el-col>
        <el-col :span="8">
            <el-form-item label="等级">
                <el-input-number v-model="spcSubmit.level" controls-position="right" :step="5"></el-input-number>
            </el-form-item>
        </el-col>
        <el-col :span="8">
            <el-form-item label="友情锻炼加成">
                <el-input-number v-model="spcSubmit.youujo" controls-position="right" :step="5"></el-input-number>
            </el-form-item>
        </el-col>
</el-row>
<el-row>
        <el-col :span="8">
            <el-form-item label="调子加成">
                <el-input-number v-model="spcSubmit.yaruki" controls-position="right" :step="5"></el-input-number>
            </el-form-item>
        </el-col>
        
        
        <el-col :span="8">
            <el-form-item label="练习加成">
                <el-input-number v-model="spcSubmit.tore" controls-position="right" :step="5"></el-input-number>
            </el-form-item>
        </el-col>
        <el-col :span="8">
            <el-form-item label="得意率">
                <el-input-number v-model="spcSubmit.tokuitu" controls-position="right" :step="5"></el-input-number>
            </el-form-item>
        </el-col>
</el-row>
<el-row>
        <el-col :span="8">
            <el-form-item label="初始羁绊">
                <el-input-number v-model="spcSubmit.kizuna" controls-position="right" :step="5"></el-input-number>
            </el-form-item>
        </el-col>
        <el-col :span="8">
            <el-form-item label="比赛加成">
                <el-input-number v-model="spcSubmit.race" controls-position="right" :step="5"></el-input-number>
            </el-form-item>
        </el-col>
        <el-col :span="8">
            <el-form-item label="粉丝数加成">
                <el-input-number v-model="spcSubmit.fan" controls-position="right" :step="5"></el-input-number>
            </el-form-item>
        </el-col>
</el-row>
<el-row>
        <el-col :span="8">
            <el-form-item label="hit等级加成">
                <el-input-number v-model="spcSubmit.hitlv" controls-position="right" :step="5"></el-input-number>
            </el-form-item>
        </el-col>
        <el-col :span="8">
            <el-form-item label="hit率加成">
                <el-input-number v-model="spcSubmit.hit_ritu" controls-position="right" :step="5"></el-input-number>
            </el-form-item>
        </el-col>
</el-row>
<el-row type="flex">
        <el-col :span="6">
            <el-form-item label="属性点加成">
                <el-select v-model="attrBonazu.bonasu_pt_p" placeholder="请选择">
                    <el-option
                    v-for="item in attribute_opt"
                    :label="item.label"
                    :value="item.value">
                    </el-option>
                </el-select>
            </el-form-item>
        </el-col>
        <el-col :span="6">
            <el-form-item label="数值">
                <el-input-number v-model="attrBonazu.bonasu_pt" controls-position="right" ></el-input-number>
            </el-form-item>
        </el-col>
        <el-col :span="6">
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
        <el-col :span="6">
            <el-form-item label="数值">
                <el-input-number v-model="attrBonazu.init_stu" controls-position="right" ></el-input-number>
            </el-form-item>
        </el-col>
</el-row>
<el-form-item label="Submit">
<el-button type="success" @click="updateSPCstaus()">默认按钮</el-button>
</el-form-item>
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
                hitlv: '0',
                hit_ritu: '0',
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

            result: '',
        };
    },
    mounted(){
        // qurSql(this.sqlcon,this.query,res=>{
        //     this.result = res;
        //     console.log(res)
        // })

        qurSql(this.sqlcon,'select * from supportcard',res=>{
            this.spcard = res;
            console.log(res)
        })
    },

    methods:{
        updateSPCstaus(){
            this.spcSubmit.bonasu_pt[this.attrBonazu.bonasu_pt_p] = this.attrBonazu.bonasu_pt;
            this.spcSubmit.init_stu[this.attrBonazu.init_stu_p] = this.attrBonazu.init_stu;

            //sql语句
            let querystr_a = 'INSERT INTO supportcard_stu (spc_id, spc_lv, spc_youujo, spc_yaruki, '+
                            'spc_tore, spc_bonasu_pt, spc_tokuitu, spc_kizuna, spc_init_stu, spc_race, spc_fan, spc_hit_lv, spc_hit_ritu) VALUES';
            let querystr_b = '('+this.spcSubmit.id+', '+this.spcSubmit.level+','+
                            this.spcSubmit.youujo+', '+
                            this.spcSubmit.yaruki+', '+
                            this.spcSubmit.tore+', \''+this.spcSubmit.bonasu_pt.toString()+'\', '+
                            this.spcSubmit.tokuitu+', '+this.spcSubmit.kizuna+', \''+
                            this.spcSubmit.init_stu.toString()+'\', '+this.spcSubmit.race+', '+
                            this.spcSubmit.fan+', '+this.spcSubmit.hitlv+', '+
                            this.spcSubmit.hit_ritu +')';
            console.log(querystr_a+querystr_b);
            qurSql(this.sqlcon,querystr_a+querystr_b,res=>{
                this.result = res;
                console.log(res);
            })

        }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
