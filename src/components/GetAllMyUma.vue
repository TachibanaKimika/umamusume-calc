<!--
 * @Author: your name
 * @Date: 2021-07-08 14:49:48
 * @LastEditTime: 2021-08-10 23:12:38
 * @LastEditors: Akarichan
 * @Description: In User Settings Edit
 * @FilePath: \fake-hpf:\My Repo\umamusume-calc\src\components\GetAllMyUma.vue
-->

<template>
    <div>
        <el-table
        :data="uma" stripe
        style="width: 100%">
            <el-table-column
                prop="time"
                label="時間"
                width="200">
            </el-table-column>
            <el-table-column
                prop="uma_name"
                label="名前"
                width="350">
            </el-table-column>
            <el-table-column
                prop="speed"
                label="スビ"
                width="80">
            </el-table-column>
            <el-table-column
                prop="sutamina"
                label="スタ"
                width="80">
            </el-table-column>
            <el-table-column
                prop="power"
                label="パワー"
                width="80">
            </el-table-column>
            <el-table-column
                prop="grit"
                label="根性"
                width="80">
            </el-table-column>
            <el-table-column
                prop="intelligence"
                label="賢さ"
                width="80">
            </el-table-column>
            <el-table-column
                prop="ranknum"
                label="スコア"
                width="80">
            </el-table-column>
            <el-table-column
                label="moreinfo"
                >
                <template slot-scope="scope">
                <el-button @click="singleUma=scope.row;moreinfoVisible=true;">moreinfo</el-button>
                </template>
            </el-table-column>
        </el-table>

        <!-- TODO:显示🐎的详细信息 -->
        <el-dialog
        :title="singleUma.uma_name"
        :visible.sync="moreinfoVisible"
        id="umapage"
        width="60%">
        <table class="umaInfo">
            <tr>
                <td>スビート</td>
                <td>スタミナ</td>
                <td>パワー</td>
                <td>根性</td>
                <td>賢さ</td>
            </tr>
            <tr>
                <td><img :src="getRankImg(singleUma.speed)" style="height:20px"></td>
                <td><img :src="getRankImg(singleUma.sutamina)" style="height:20px"></td>
                <td><img :src="getRankImg(singleUma.power)" style="height:20px"></td>
                <td><img :src="getRankImg(singleUma.grit)" style="height:20px"></td>
                <td><img :src="getRankImg(singleUma.intelligence)" style="height:20px"></td>
            </tr>
        </table>

        <span class="info"><span>Speed: {{singleUma.speed}}</span><img :src="getRankImg(singleUma.speed)" style="height:20px"></span>
        <span slot="footer" class="dialog-footer">
            <el-button type="primary" @click="moreinfoVisible = false">确 定</el-button>
        </span>
        </el-dialog>
    </div>
</template>

<script>
import {qurSql} from '../jsfile/api/con2sql.js'
import '../assets/css/umapage.scss'
export default {
    name: 'GetAllMyUma',
    data(){
        return {
            sqlcon:{
                username:'Guest',
                userpasswd: 'password#123',
                database: 'umamusume-pbl',
            },
            moreinfoVisible:false,
            uma:[],
            singleUma:'',
        }
    },
    mounted(){
        let query = `
                    SELECT umasingle.id 'id', 
                    CONCAT(uma.uma_secname,'-',uma.uma_name) uma_name, 
                    uma_speed speed, uma_stamina sutamina, uma_power 'power', uma_grit grit, uma_intelligence intelligence, uma_total total, uma_ranknum ranknum, uma_rank 'rank',uma_wheninsert 'time',
                    uma_skill skill, uma_user_id userid, uma_others others,
                    CONCAT('[',uma_scl1,']-',spc1.spc_secname,'-',spc1.spc_name) spc1 , 
                    CONCAT('[',uma_scl2,']-',spc2.spc_secname,'-',spc2.spc_name) spc2 , 
                    CONCAT('[',uma_scl3,']-',spc3.spc_secname,'-',spc3.spc_name) spc3 , 
                    CONCAT('[',uma_scl4,']-',spc4.spc_secname,'-',spc4.spc_name) spc4 , 
                    CONCAT('[',uma_scl5,']-',spc5.spc_secname,'-',spc5.spc_name) spc5 , 
                    CONCAT('[',uma_scl6,']-',spc6.spc_secname,'-',spc6.spc_name) spc6 
                    FROM umasingle
                    LEFT JOIN uma ON umasingle.uma_name = uma.id
                    LEFT JOIN supportcard AS spc1 ON uma_sc1=spc1.id
                    LEFT JOIN supportcard AS spc2 ON uma_sc2=spc2.id
                    LEFT JOIN supportcard AS spc3 ON uma_sc3=spc3.id
                    LEFT JOIN supportcard AS spc4 ON uma_sc4=spc4.id
                    LEFT JOIN supportcard AS spc5 ON uma_sc5=spc5.id
                    LEFT JOIN supportcard AS spc6 ON uma_sc6=spc6.id
                    `
        qurSql(this.sqlcon, query,res=>{
            this.uma = res;
            console.log(res)
        })
    },
    methods:{
        getRankImg(numstr){
            numstr == undefined?numstr=0:true
            let rank = 'SSp'
            let num = Number(numstr)
            console.log(num)
            switch(true){
                case (1150<=num&&num<=1200):
                    rank = 'SSp'
                    break
                case (1100<=num&&num<1150):
                    rank = 'SS'
                    break
                case (1050<=num&&num<1100):
                    rank = 'Sp'
                    break
                case (1000<=num&&num<1050):
                    rank = 'S'
                    break
                case (900<=num&&num<1000):
                    rank = 'Ap'
                    break
                case (800<=num&&num<900):
                    rank = 'A'
                    break
                case (700<=num&&num<800):
                    rank = 'Bp'
                    break
                case (600<=num&&num<700):
                    rank = 'B'
                    break
                case (500<=num&&num<600):
                    rank = 'Cp'
                    break
                case (400<=num&&num<500):
                    rank = 'C'
                    break
                case (350<=num&&num<400):
                    rank = 'Dp'
                    break
                case (300<=num&&num<350):
                    rank = 'D'
                    break
                case (250<=num&&num<300):
                    rank = 'Ep'
                    break
                case (200<=num&&num<250):
                    rank = 'E'
                    break
                case (150<=num&&num<200):
                    rank = 'Fp'
                    break
                case (100<=num&&num<150):
                    rank = 'F'
                    break
                case (50<=num&&num<100):
                    rank = 'Gp'
                    break
                case (num<50):
                    rank = 'G'
                    break
            }
            let path = `i_rank_${rank}.png`
            console.log(path)
            return require('../assets/img/rank/umastatus/'+path)
        }
    },

}
</script>