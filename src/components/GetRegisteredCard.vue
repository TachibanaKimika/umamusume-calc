<template>
  <div class="GetRegisteredCard">
    <el-select v-model="seted_card_item[0]" value-key="id" filterable placeholder="请选择">
        <el-option
        v-for="item in card_item"
        :key="item.id"
        :label="item.spc_name"
        :value="item">
        </el-option>
    </el-select>
    <el-switch
        v-model="card_kizuna[0]"
        active-color="#13ce66"
        inactive-color="#ff4949"
        active-value=100
        inactive-value=0>
    </el-switch>
    <el-select v-model="seted_card_item[1]" value-key="id" filterable placeholder="请选择">
        <el-option
        v-for="item in card_item"
        :key="item.id"
        :label="item.spc_name"
        :value="item">
        </el-option>
    </el-select>
    <el-switch
        v-model="card_kizuna[1]"
        active-color="#13ce66"
        inactive-color="#ff4949"
        active-value=100
        inactive-value=0>
    </el-switch>
    <el-select v-model="seted_card_item[2]" value-key="id" filterable placeholder="请选择">
        <el-option
        v-for="item in card_item"
        :key="item.id"
        :label="item.spc_name"
        :value="item">
        </el-option>
    </el-select>
    <el-switch
        v-model="card_kizuna[2]"
        active-color="#13ce66"
        inactive-color="#ff4949"
        active-value=100
        inactive-value=0>
    </el-switch>
    <el-select v-model="seted_card_item[3]" value-key="id" filterable placeholder="请选择">
        <el-option
        v-for="item in card_item"
        :key="item.id"
        :label="item.spc_name"
        :value="item">
        </el-option>
    </el-select>
    <el-switch
        v-model="card_kizuna[3]"
        active-color="#13ce66"
        inactive-color="#ff4949"
        active-value=100
        inactive-value=0>
    </el-switch>
    <el-select v-model="seted_card_item[4]" value-key="id" filterable placeholder="请选择">
        <el-option
        v-for="item in card_item"
        :key="item.id"
        :label="item.spc_name"
        :value="item">
        </el-option>
    </el-select>
    <el-switch
        v-model="card_kizuna[4]"
        active-color="#13ce66"
        inactive-color="#ff4949"
        active-value=100
        inactive-value=0>
    </el-switch>
    <el-select v-model="seted_card_item[5]" value-key="id" filterable placeholder="请选择">
        <el-option
        v-for="item in card_item"
        :key="item.id"
        :label="item.spc_name"
        :value="item">
        </el-option>
    </el-select>
    <el-switch
        v-model="card_kizuna[5]"
        active-color="#13ce66"
        inactive-color="#ff4949"
        active-value=100
        inactive-value=0>
    </el-switch>
    <el-button @click="up2sumulationTimes(50)">UPDATE</el-button><br>
    <el-table
      stripe
      :data="result"
      style="width: 100%">
      <el-table-column
        prop="name"
        label="锻炼类型"
        width="180">
      </el-table-column>
      <el-table-column
        prop="result[0]"
        label="スビート"
        width="180">
      </el-table-column>
      <el-table-column
        prop="result[1]"
        label="スタミナ"
        width="180">
      </el-table-column>
      <el-table-column
        prop="result[2]"
        label="パワー"
        width="180">
      </el-table-column>
      <el-table-column
        prop="result[3]"
        label="根性"
        width="180">
      </el-table-column>
      <el-table-column
        prop="result[4]"
        label="賢さ"
        width="180">
      </el-table-column>
      <el-table-column
        prop="result[5]"
        label="スキルPT"
        width="180">
      </el-table-column>
      <el-table-column
        label="一緒にトレーニング"
        width="180">
        <template slot-scope="scope">
        <el-popover trigger="hover" placement="top">
          <li v-for="item in scope.row.card" :key="item.id">
                {{ item.spc_name }}
            </li>
          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">友達</el-tag>
          </div>
        </el-popover>
      </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import {qurSql} from "../jsfile/api/con2sql.js"
import {simulation} from "../jsfile/util/sumulation_tore.js"

export default {
    name: 'GetRegisteredCard',
    data(){
        return {
            sqlcon:{
                username: 'akarichan',
                userpasswd: 'akariChan@0721',
                hostname: 'rm-bp1id4y905ysrz6pvjo.mysql.rds.aliyuncs.com',
                database: 'umamusume-pbl',
            },
            card_item: [],
            seted_card_item: [],//将卡用id表示
            card_kizuna:[0,0,0,0,0,0],
            options:{
                //马的属性值加成
                uma:[20,10,0,0,0],
                //调子加成
                yaruki:1.2,
                //练习等级
                torelv:[5,3,1,1,3]
            },
            recivedresult:[],
            result:[
                {
                    name:'speed',
                    result:[0,0,0,0,0,0]
                },{
                    name:'stamina',
                    result:[0,0,0,0,0,0]
                },{
                    name:'power',
                    result:[0,0,0,0,0,0]
                },{
                    name:'konnjyo',
                    result:[0,0,0,0,0,0]
                },{
                    name:'kashikosa',
                    result:[0,0,0,0,0,0]
                }],
        }
    },
    mounted(){
        let querystr = 'SELECT \
                        supportcard_stu.`id`, supportcard_stu.`spc_id`,supportcard.`spc_attribute`,\
                        supportcard_stu.`spc_lv`,supportcard_stu.`spc_youujo`,supportcard_stu.`spc_yaruki`,supportcard_stu.`spc_tore`,\
                        supportcard_stu.`spc_bonasu_pt`,supportcard_stu.`spc_tokuitu`,supportcard_stu.`spc_kizuna`,\
                        supportcard_stu.`spc_init_stu`,supportcard_stu.`spc_race`,supportcard_stu.`spc_fan`,supportcard_stu.`spc_hit_lv`,\
                        supportcard_stu.`spc_hit_ritu`,supportcard_stu.`spc_reduce_suta`,supportcard_stu.`spc_reduce_shipai`,\
                        CONCAT(\'【\',supportcard_stu.`spc_lv`,\'】 ‐ 【\',supportcard.`spc_secname`,\'】　-　\',supportcard.`spc_name`) spc_name\
                        FROM supportcard_stu\
                        LEFT JOIN supportcard ON supportcard.`id` = supportcard_stu.`spc_id`'
        qurSql(this.sqlcon,querystr,res=>{
            this.card_item = res;
            for(var i in this.card_item){
                this.card_item[i].spc_bonasu_pt = this.card_item[i].spc_bonasu_pt.split(',').map(Number);
                this.card_item[i].spc_init_stu = this.card_item[i].spc_init_stu.split(',').map(Number);
                
            }
            console.log(this.card_item);
        })
    },
    methods:{
        up2sumulation(){
            if(this.checkUpdata(this.seted_card_item)){
                for(var i in this.card_kizuna){
                    this.seted_card_item[i].spc_kizuna = this.card_kizuna[i]
                }
                this.recivedresult = simulation(this.seted_card_item,this.options)
                for(var i in this.recivedresult){
                    this.result[i].result = this.recivedresult[i].result;
                    this.result[i].card = this.recivedresult[i].card;
                }
            }
        },
        checkUpdata(data){
            if(data.length != 6){
                console.log("数组长度为"+data.length)
                return false;
            };
            for(var i=0 ; i<6; i++){
                if(!data[i]){
                    console.log("没选全")
                    return false;
                }
            }
            return true;
        },
        up2sumulationTimes(times){
            if(this.checkUpdata(this.seted_card_item)){
                for(var i in this.card_kizuna){
                    this.seted_card_item[i].spc_kizuna = this.card_kizuna[i]
                }
                for(var i in this.recivedresult){
                        this.result[i].result = [0,0,0,0,0,0];
                }
                for(var j = 0; j<times; j++){
                    this.recivedresult = simulation(this.seted_card_item,this.options)
                    for(var i in this.recivedresult){
                        //两个数组相加
                        this.result[i].result = this.result[i].result.map((v,ii)=>v + this.recivedresult[i].result[ii]/times)
                    }
                }
            }
        }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.el-select{
    padding: 10px;
}
</style>
