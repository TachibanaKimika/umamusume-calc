<template>
  <div class="GetRegisteredCard">
    <div class="block">
    <el-row>
    <el-col :span="24">
    <el-button 
    v-model="seted_card_item[0]" 
    placeholder="支援卡1" 
    @click="dialogVisible = true;potionSelector=0"
    style="width:27%"
    class="line-limit-length">
    <span v-if="seted_card_item[0]" >{{seted_card_item[0].spc_name}}</span><span v-else>请选择支援卡1</span>
    </el-button>
    <el-switch
        v-model="card_kizuna[0]"
        active-color="#13ce66"
        inactive-color="#ff4949"
        active-value=100
        inactive-value=0>
    </el-switch>
    <el-button 
    v-model="seted_card_item[1]" 
    placeholder="支援卡2" 
    @click="dialogVisible = true;potionSelector=1"
    style="width:27%"
    class="line-limit-length">
    <span v-if="seted_card_item[1]" >{{seted_card_item[1].spc_name}}</span><span v-else>请选择支援卡2</span>
    </el-button>
    <el-switch
        v-model="card_kizuna[1]"
        active-color="#13ce66"
        inactive-color="#ff4949"
        active-value=100
        inactive-value=0>
    </el-switch>
    <el-button 
    v-model="seted_card_item[2]" 
    placeholder="支援卡3" 
    @click="dialogVisible = true;potionSelector=2"
    style="width:27%"
    class="line-limit-length">
    <span v-if="seted_card_item[2]" >{{seted_card_item[2].spc_name}}</span><span v-else>请选择支援卡3</span>
    </el-button>
    <el-switch
        v-model="card_kizuna[2]"
        active-color="#13ce66"
        inactive-color="#ff4949"
        active-value=100
        inactive-value=0>
    </el-switch>
    </el-col>
    <el-button 
    v-model="seted_card_item[3]" 
    placeholder="支援卡4" 
    @click="dialogVisible = true;potionSelector=3"
    style="width:27%"
    class="line-limit-length">
    <span v-if="seted_card_item[3]" >{{seted_card_item[3].spc_name}}</span><span v-else>请选择支援卡4</span>
    </el-button>
    <el-switch
        v-model="card_kizuna[3]"
        active-color="#13ce66"
        inactive-color="#ff4949"
        active-value=100
        inactive-value=0>
    </el-switch>
    <el-button 
    v-model="seted_card_item[4]" 
    placeholder="支援卡5" 
    @click="dialogVisible = true;potionSelector=4"
    style="width:27%"
    class="line-limit-length">
    <span v-if="seted_card_item[4]" >{{seted_card_item[4].spc_name}}</span><span v-else>请选择支援卡5</span>
    </el-button>
    <el-switch
        v-model="card_kizuna[4]"
        active-color="#13ce66"
        inactive-color="#ff4949"
        active-value=100
        inactive-value=0>
    </el-switch>
    <el-button 
    v-model="seted_card_item[5]" 
    placeholder="支援卡6" 
    @click="dialogVisible = true;potionSelector=5"
    style="width:27%"
    class="line-limit-length">
    <span v-if="seted_card_item[5]" >{{seted_card_item[5].spc_name}}</span><span v-else>请选择支援卡6</span>
    </el-button>
    <el-switch
        v-model="card_kizuna[5]"
        active-color="#13ce66"
        inactive-color="#ff4949"
        active-value=100
        inactive-value=0>
    </el-switch>
    </el-row>
    </div>
    <div class="block">
    <el-row :gutter="20">
    <el-col :span="2"><el-button @click="up2sumulation()" >模拟</el-button></el-col>
    <el-col :span="3"><el-button @click="up2sumulationTimes()" >模拟多次取平均值</el-button></el-col>
    <el-col :span="5"><el-slider v-model="simulationtime" style=" padding: 0 10px;"></el-slider></el-col>
    <el-col :span="6"></el-col>
    <el-col :span="8"></el-col>
    </el-row>
    </div>
    <div class="Option">
    <el-row :gutter="20">
    <el-col :span="1"><p>属性</p></el-col>
    <div v-for="(item, index) in options.uma" :key="index">
        <el-col :span="2">
        <el-input  v-model="options.uma[index]" style="width:80%; padding: 10px 10px;" />
        </el-col>
    </div>
    <el-col :span="2"><p>练习等级</p></el-col>
    <div v-for="(item, index) in options.torelv">
        <el-col :span="1">
        <!-- <el-input  v-model="options.torelv[index]" style="width:80%; padding: 10px 10px;" /> -->
        <el-slider
        v-model="options.torelv[index]"
        :step="1"
        :min="1" :max="5"
        show-stops
        style="width:80%; padding: 10px 10px;" />
        </el-col>
    </div>
    <el-col :span="2"><p>调子</p></el-col>
    <el-col :span="4"><el-input  v-model="options.yaruki" style="width:80%; padding: 10px 10px;" /></el-col>
    </el-row>
    </div>
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
      <el-table-column
        prop="up"
        label="上升值"
        width="180">
      </el-table-column>
    </el-table>
    <div id="BoxChart" class="echarts" style="width: 1800px; height: 1200px"></div>
    
    <el-dialog
        title="选择支援卡"
        :visible.sync="dialogVisible">
            <SelectWindowOfRegistedCard :cards="card_item" v-on:getCardFromChild='reciveCardItem'/>
        </el-dialog>
  </div>
</template>

<script>
import {qurSql} from "../jsfile/api/con2sql.js"
import {simulation} from "../jsfile/util/sumulation_tore.js"
import {initChartsOption_boxplot} from "../jsfile/util/initChartsOption.js"
import SelectWindowOfRegistedCard from "@/components/child/SelectWindowOfRegistedCard.vue"

export default {
    name: 'GetRegisteredCard',
    components: {
        SelectWindowOfRegistedCard
    },
    data(){
        return {
            sqlcon:{
                username: 'akarichan',
                userpasswd: 'akariChan@0721',
                database: 'umamusume-pbl',
            },
            card_item: [],
            seted_card_item: [],//将卡用id表示
            trash:[],
            card_kizuna:[0,0,0,0,0,0],
            stdtore:[
                {
                    cost:21,
                    lv:[[10,0,5,0,0,2],
                    [11,0,5,0,0,2],
                    [12,0,5,0,0,2],
                    [13,0,6,0,0,2],
                    [14,0,7,0,0,2]]
                },
                {
                    cost:19,
                    lv:[[0,9,0,4,0,2],
                    [0,10,0,4,0,2],
                    [0,11,0,4,0,2],
                    [0,12,0,5,0,2],
                    [0,13,0,6,0,2]]
                },
                {
                    cost:20,
                    lv:[[0,5,8,0,0,2],
                    [0,5,9,0,0,2],
                    [0,5,10,0,0,2],
                    [0,6,11,0,0,2],
                    [0,7,12,0,0,2]]
                },
                {
                    cost:22,
                    lv:[[4,0,4,8,0,2],
                    [4,0,4,9,0,2],
                    [4,0,4,10,0,2],
                    [5,0,4,11,0,2],
                    [5,0,5,12,0,2]]
                },
                {
                    cost:-5,
                    lv:[[2,0,0,0,9,4],
                    [2,0,0,0,10,4],
                    [2,0,0,0,11,4],
                    [3,0,0,0,12,4],
                    [4,0,0,0,13,4]]
                },
            ],
            options:{
                //马的属性值加成
                uma:[20,10,0,0,0],
                //调子加成
                yaruki:1.1,
                //练习等级
                torelv:[5,3,1,1,3]
            },
            recivedresult:[],
            result:[
                {
                    name:'speed',
                    result:[0,0,0,0,0,0],
                    up:0
                },{
                    name:'stamina',
                    result:[0,0,0,0,0,0],
                    up:0
                },{
                    name:'power',
                    result:[0,0,0,0,0,0],
                    up:0
                },{
                    name:'konnjyo',
                    result:[0,0,0,0,0,0],
                    up:0
                },{
                    name:'kashikosa',
                    result:[0,0,0,0,0,0],
                    up:0
                }],
            totalResult:[
                {name:'speed',num:[]},
                {name:'sutamina',num:[]},
                {name:'power',num:[]},
                {name:'konnjyo',num:[]},
                {name:'kashikosa',num:[]},
            ],
            singleCard:{
                card:{},
                result:[0,0,0,0,0],   
            },
            
            simulationtime:20,
            dialogVisible:false,
            potionSelector:'',
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
                        LEFT JOIN supportcard ON supportcard.`id` = supportcard_stu.`spc_id`\
                        ORDER BY spc_name DESC'
        qurSql(this.sqlcon,querystr,res=>{
            this.card_item = res;
            for(let i in this.card_item){
                this.card_item[i].spc_bonasu_pt = this.card_item[i].spc_bonasu_pt.split(',').map(Number);
                this.card_item[i].spc_init_stu = this.card_item[i].spc_init_stu.split(',').map(Number);
                
            }
            //console.log(this.card_item);
        })
    },
    methods:{
        up2sumulation(){
            console.log(this.options.uma)
            // this.options.uma = this.options.uma.split(',');
            // this.options.torelv = this.options.torelv.split(',');
            if(this.checkUpdata(this.seted_card_item)){
                for(let i in this.card_kizuna){
                    this.seted_card_item[i].spc_kizuna = this.card_kizuna[i]
                }
                this.recivedresult = simulation(this.seted_card_item,this.options)
                for(let i in this.recivedresult){
                    this.result[i].result = this.recivedresult[i].result;
                    this.result[i].card = this.recivedresult[i].card;
                }
            }
        },
        checkUpdata(data){
            if(data.length != 6){
                //console.log("数组长度为"+data.length)
                this.showMsg("数组长度为"+data.length,'error')
                return false;
            };
            for(let i=0 ; i<6; i++){
                if(!data[i]){
                    //console.log("没选全")
                    this.showMsg("没选全",'error')
                    return false;
                }
            }
            return true;
        },
        up2sumulationTimes(){
            //初始化
            this.totalResult=[
                {name:'speed',num:[]},
                {name:'sutamina',num:[]},
                {name:'power',num:[]},
                {name:'konnjyo',num:[]},
                {name:'kashikosa',num:[]},
            ];
            var times = this.simulationtime*100;
            if(this.checkUpdata(this.seted_card_item)){
                for(var i in this.card_kizuna){
                    this.seted_card_item[i].spc_kizuna = this.card_kizuna[i]
                }
                for(var i in this.recivedresult){
                        this.result[i].result = [0,0,0,0,0,0];
                }

                //相加多次
                for(let j = 0; j<times; j++){
                    this.recivedresult = simulation(this.seted_card_item,this.options)
                    for(var i in this.recivedresult){
                        //两个数组相加
                        this.totalResult[i].num.push(this.recivedresult[i].result[i]);
                        this.result[i].result = this.result[i].result.map((v,ii)=>v + this.recivedresult[i].result[ii]/times)
                    }
                }
                for(let i in this.result){
                    for(let j in this.result[i].result){
                        this.result[i].result[j] = Math.round(this.result[i].result[j]);
                    }
                }


                for(let i in this.result){
                    this.result[i].up = this.result[i].result[i]/this.stdtore[i].lv[this.options.torelv[i]-1][i]/this.options.yaruki/((this.options.uma[i]+100)/100)
                }
                // console.log(this.totalResult)

                let boxChart = this.$echarts.init(document.getElementById('BoxChart'))
                var options = initChartsOption_boxplot(this.totalResult)
                //console.log(options)
                boxChart.setOption(options)
            }
            
        },
        showMsg(msg,type){
            this.$message({
                message:msg,
                type:type
            })
        },
        reciveCardItem(data){
            console.log(this.potionSelector)
            this.seted_card_item[this.potionSelector]=data;
            this.dialogVisible=false
        },
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.el-select{
    padding: 10px;
}


.line-limit-length {
    margin:10px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap; 
}
</style>
