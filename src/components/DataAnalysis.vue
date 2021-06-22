<template>
  <div class="DataAns">
    <div id="AtbCountChart" class="echarts" style="width: 45%; height: 400px;"></div>
    <div id="CardCountChart" class="echarts" style="width: 45%; height: 400px;"></div>
  </div>
</template>

<script>
import {getCardCount} from '../jsfile/api/getStaticData.js'

export default {
  name: 'DataAnalysis',
  data(){
      return {
        rowData:{},
        options_Echarts_1: {
          title: {
            text: '支援卡使用比例',
            left: 'center'
          },
          tooltip: {
              trigger: 'item'
          },
          legend: {
              orient: 'vertical',
              left: 'left',
          },
          dataset: [{
            dimensions: ['spc_attribute_sum','util_name'],
            source: []
          }],
          
          series: [{
              name: '数量',
              type: 'pie',
          }]
        },
        options_Echarts_2: {
          title: {
            text: '支援卡具体使用比例',
            left: 'center'
          },
          tooltip: {
              trigger: 'item'
          },
          legend: {
              orient: 'vertical',
              left: 'left',
          },
          dataZoom: [
              {
                  show: true,
                  start: 0,
                  end: 10
              },
              {
                  type: 'inside',
                  start: 0,
                  end: 10
              },
              {
                  show: true,
                  yAxisIndex: 0,
                  filterMode: 'empty',
                  width: 30,
                  height: '80%',
                  showDataShadow: false,
                  left: '93%'
              }
          ],
          dataset: [
            {
              dimensions: ['atb_count','spc_name'],
              source: []
            },
            {
              transform: {
                  type: 'sort',
                  config: { dimension: 'atb_count', order: 'desc' }
              }
            }
          ],
          xAxis: {
            type: 'category',
          },
          yAxis: {},
          series: {
              name: '数量',
              type: 'bar',
              encode: { x: 'spc_name', y: 'atb_count' },
              datasetIndex: 1,
              itemStyle:{
                normal: {
                  color:function(params){
                    //console.log(params.data.spc_attribute);
                    switch(params.data.spc_attribute){
                      case 1:return "#62BAF9";
                      case 2:return "#F3887F";
                      case 3:return "#EF9940";
                      case 4:return "#F08FAD";
                      case 5:return "#64BD8E";
                      case 6:return "#FFD351";
                    }
                  }
                }
              }
          }
        },
      }
  },
  methods: {
     async getData(){
       await getCardCount().then(res =>{
         this.options_Echarts_1.dataset[0].source = res.atbCount;
         this.options_Echarts_2.dataset[0].source = res.cardCount;
         console.log(this.options_Echarts_2.dataset[0].source)
       }).catch(err =>{
         console.log(err)
       })
     },
     async drawLine(){
       let atbCountChart = this.$echarts.init(document.getElementById('AtbCountChart'))
       let cardCountChart = this.$echarts.init(document.getElementById('CardCountChart'))
       await this.getData();
       atbCountChart.setOption(this.options_Echarts_1)
       cardCountChart.setOption(this.options_Echarts_2)
     }
  },
  async mounted(){
    this.drawLine();
  }
}
</script>


<style scoped>
.echarts{
    display: inline-block;
    padding: 20px;
    margin:10px;
    background-color: rgba(209, 209, 233,0.5);
    box-shadow: 3px 3px 6px -3px black;
    border-radius: 25px;
}
</style>