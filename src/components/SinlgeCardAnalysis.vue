<!--
 * @Author: your name
 * @Date: 2021-07-10 03:08:08
 * @LastEditTime: 2021-07-10 04:36:16
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \fake-hpf:\My Repo\umamusume-calc\src\components\SinlgeCardAnalysis.vue
-->

<template>
    <div>
        <div calss="count">
            <ul>
                <li>

                </li>
            </ul>

        </div>
    </div>
</template>

<script>
import $ from 'jquery'
import {qurSql} from '../jsfile/api/con2sql.js'
export default {
    name:'SinlgeCardAnalysis',
    data(){
        return{
            sqlcon:{
                username: 'akarichan',
                userpasswd: 'akariChan@0721',
                database: 'umamusume-pbl',
            },
            card:[],
            selected_card:'',



            calc_options:{
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
                yaruki:1.1,
                torelv:[5,5,5,5,5]
            }
        }
    },
    mounted(){
        let query = `SELECT * FROM supportcard_stu LEFT JOIN supportcard ON supportcard.id = supportcard_stu.spc_id`
        qurSql(this.sqlcon, query, res=>{
            this.card = res
            this.select_card = this.card[0] //test
            // console.log(res)
            this.calcCard(this.select_card)
        })
    },
    methods:{
        calcCard(card){
            const calc_options = this.calc_options;
            let mytore=[];
            console.log(card)
            //基础值
            for(let i in calc_options.torelv){
                // console.log(this.calc_options.stdtore[i].lv)
                // console.log(this.calc_options.torelv[i])
                mytore[i] = calc_options.stdtore[i].lv[calc_options.torelv[i]-1]
            }
            const stdtore = $.extend(true,{},mytore); 
            // console.log(mytore)

            //计算每一项的加成点:
            card.spc_bonasu_pt = card.spc_bonasu_pt.split(",")
            for(let i in mytore){
                for(let j in mytore[i]){
                    if(mytore[i][j]!=0){
                        mytore[i][j]+=parseInt(card.spc_bonasu_pt[j])
                    }
                }
            }
            for(let i in mytore){
                mytore[i] = mytore[i].map(function(item, index, array){
                    //        //人头数    //联系性能                //干劲
                    let num = item*1.05*(1+card.spc_tore/100)*(1+(calc_options.yaruki-1)*(1+card.spc_yaruki/100))
                    return parseInt(num.toFixed(0))
                })
            }
            let mytore_y = []
            for(let i in mytore){
                mytore_y[i] = mytore[i].map(function(item, index, array){
                    let num = i==card.spc_attribute-1?item*(1+card.spc_youujo/100):item
                    return parseInt(num.toFixed(0))
                })
            }
            console.log(stdtore)
            console.log(mytore)
            console.log(mytore_y)
        }
    }
}
</script>