<!--
 * @Author: your name
 * @Date: 2021-07-08 14:49:48
 * @LastEditTime: 2021-08-12 12:19:53
 * @LastEditors: Akarichan
 * @Description: In User Settings Edit
 * @FilePath: \fake-hpf:\My Repo\umamusume-calc\src\components\GetAllMyUma.vue
-->

<template>
    <div>
        <el-table
        :data="uma" stripe
        style="width: 100%"
        height="680">
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
        id="umapage">
        <div class="uma_dia">
            <div class="uma_status">
            <table class="umainfo_table">
                <tr class="umainfo_name">
                    <th>スビート</th>
                    <th>スタミナ</th>
                    <th>パワー</th>
                    <th>根性</th>
                    <th>賢さ</th>
                </tr>
                <tr class="umainfo_number">
                    <td><img :src="getRankImg(singleUma.speed)"><span>{{singleUma.speed}}</span></td>
                    <td><img :src="getRankImg(singleUma.sutamina)"><span>{{singleUma.sutamina}}</span></td>
                    <td><img :src="getRankImg(singleUma.power)"><span>{{singleUma.power}}</span></td>
                    <td><img :src="getRankImg(singleUma.grit)"><span>{{singleUma.grit}}</span></td>
                    <td><img :src="getRankImg(singleUma.intelligence)"><span>{{singleUma.intelligence}}</span></td>
                </tr>
            </table>
            </div>
            <div class="uma_info">
                <div class="uma_config_row">
                    <span class="uma_config_label">バ場適性</span>
                    <span class="uma_config_item"><span class="uma_config_item_label">芝</span><span class="uma_config_item_img"><img :src="getConfigImg(this.singleUma.others.baba.shiba)" alt=""></span></span>
                    <span class="uma_config_item"><span class="uma_config_item_label">ダート</span><span class="uma_config_item_img"><img :src="getConfigImg(this.singleUma.others.baba.dato)" alt=""></span></span>
                </div>
                <div class="uma_config_row">
                    <span class="uma_config_label">距離適性</span>
                    <span class="uma_config_item"><span class="uma_config_item_label">短距離</span><span class="uma_config_item_img"><img :src="getConfigImg(this.singleUma.others.kyori.tankyori)" alt=""></span></span>
                    <span class="uma_config_item"><span class="uma_config_item_label">マイル</span><span class="uma_config_item_img"><img :src="getConfigImg(this.singleUma.others.kyori.mairu)" alt=""></span></span>
                    <span class="uma_config_item"><span class="uma_config_item_label">中距離</span><span class="uma_config_item_img"><img :src="getConfigImg(this.singleUma.others.kyori.juukyori)" alt=""></span></span>
                    <span class="uma_config_item"><span class="uma_config_item_label">長距離</span><span class="uma_config_item_img"><img :src="getConfigImg(this.singleUma.others.kyori.cyoukyori)" alt=""></span></span>
                </div>
                <div class="uma_config_row">
                    <span class="uma_config_label">脚質適性</span>
                    <span class="uma_config_item"><span class="uma_config_item_label">逃げ</span><span class="uma_config_item_img"><img :src="getConfigImg(this.singleUma.others.kyakushitu.nige)" alt=""></span></span>
                    <span class="uma_config_item"><span class="uma_config_item_label">先行</span><span class="uma_config_item_img"><img :src="getConfigImg(this.singleUma.others.kyakushitu.senkou)" alt=""></span></span>
                    <span class="uma_config_item"><span class="uma_config_item_label">差し</span><span class="uma_config_item_img"><img :src="getConfigImg(this.singleUma.others.kyakushitu.sashi)" alt=""></span></span>
                    <span class="uma_config_item"><span class="uma_config_item_label">追込</span><span class="uma_config_item_img"><img :src="getConfigImg(this.singleUma.others.kyakushitu.oikomi)" alt=""></span></span>
                </div>
            </div>
        </div>
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
            singleUma:{
                id:0,
                others:{"baba": {"dato": "E", "shiba": "S"}, "kyori": {"mairu": "A", "juukyori": "A", "tankyori": "F", "cyoukyori": "C"}, "kyakushitu": {"nige": "A", "sashi": "D", "oikomi": "G", "senkou": "B"}}
            },
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
    methods: {
        getRankImg(numstr){
            numstr == undefined?numstr=0:true
            let rank = 'SSp'
            let num = Number(numstr)
            // console.log(num)
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
            // console.log(path)
            return require('../assets/img/rank/umastatus/'+path)
        },
        getConfigImg(str){
            return require('../assets/img/rank/umaconfig/i_rank_'+str+'.png')
        }
    },
    watch: {
        singleUma: {
            deep: true,
            handler(){
                if(typeof this.singleUma.others=='string'){
                    this.singleUma.others=JSON.parse(this.singleUma.others)
                }else if(this.singleUma.others==null){
                    this.singleUma.others=JSON.parse(`{"baba": {"dato": "A", "shiba": "A"}, "kyori": {"mairu": "S", "juukyori": "S", "tankyori": "A", "cyoukyori": "A"}, "kyakushitu": {"nige": "A", "sashi": "A", "oikomi": "B", "senkou": "A"}}`)
                }
                if(typeof this.singleUma.skill=='string'){
                    this.singleUma.skill=JSON.parse(this.singleUma.skill)
                }else if(this.singleUma.skill==null){
                    this.skill=JSON.parse(`[{"id": 3, "skill_pt": 170, "skill_dsc": "ラストスパートで速度が上がる", "skill_long": 0, "skill_name": "全身全霊", "skill_rare": 0, "skill_type": 0, "skill_sakusen": 0}, {"id": 20, "skill_pt": 170, "skill_dsc": "レース中盤に追い抜くと速度が上がる", "skill_long": 0, "skill_name": "アガッてきた！", "skill_rare": 0, "skill_type": 0, "skill_sakusen": 0}, {"id": 26, "skill_pt": 180, "skill_dsc": "華麗なコーナーワークで加速力が上がる", "skill_long": 0, "skill_name": "曲線のソムリエ", "skill_rare": 0, "skill_type": 0, "skill_sakusen": 0}, {"id": 44, "skill_pt": 170, "skill_dsc": "下り坂で疲れにくくなる", "skill_long": 0, "skill_name": "下校後のスペシャリスト", "skill_rare": 0, "skill_type": 1, "skill_sakusen": 1}, {"id": 2, "skill_pt": 160, "skill_dsc": "レース中盤に前の方だと好位置を取りやすくなる", "skill_long": 3, "skill_name": "キラーチューン", "skill_rare": 0, "skill_type": 0, "skill_sakusen": 0}, {"id": 12, "skill_pt": 160, "skill_dsc": "レース序盤に先頭だと差を広げやすくなる", "skill_long": 2, "skill_name": "マイルの支配者", "skill_rare": 0, "skill_type": 0, "skill_sakusen": 0}]`)
                }
            }
        }
    }
}
</script>