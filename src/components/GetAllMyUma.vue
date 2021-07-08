<!--
 * @Author: your name
 * @Date: 2021-07-08 14:49:48
 * @LastEditTime: 2021-07-08 15:07:19
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \fake-hpf:\My Repo\umamusume-calc\src\components\GetAllMyUma.vue
-->

<template>
    <div>

    </div>
</template>

<script>
import {qurSql} from '../jsfile/api/con2sql.js'
export default {
    name: 'GetAllMyUma',
    data(){
        return {
            sqlcon:{
                username:'Guest',
                userpasswd: 'password#123',
                database: 'umamusume-pbl',
            },
            result:'',
        }
    },
    mounted(){
        let query = `
                    SELECT 
                    CONCAT(uma.uma_secname, ' - ', uma.uma_name) AS uma_name, 
                    uma_speed, uma_stamina, uma_power, uma_grit, uma_intelligence, 
                    uma_total, uma_ranknum, uma_wheninsert,
                    CONCAT(sc1.spc_secname, '-', sc1.spc_name) AS sc1,
                    CONCAT(sc2.spc_secname, '-', sc2.spc_name) AS sc2,
                    CONCAT(sc3.spc_secname, '-', sc3.spc_name) AS sc3,
                    CONCAT(sc4.spc_secname, '-', sc4.spc_name) AS sc4,
                    CONCAT(sc5.spc_secname, '-', sc5.spc_name) AS sc5,
                    CONCAT(sc6.spc_secname, '-', sc6.spc_name) AS sc6
                    FROM umasingle
                    LEFT JOIN uma ON umasingle.uma_name = uma.id
                    LEFT JOIN supportcard AS sc1 ON umasingle.uma_sc1 = sc1.id
                    LEFT JOIN supportcard AS sc2 ON umasingle.uma_sc2 = sc2.id
                    LEFT JOIN supportcard AS sc3 ON umasingle.uma_sc3 = sc3.id
                    LEFT JOIN supportcard AS sc4 ON umasingle.uma_sc4 = sc4.id
                    LEFT JOIN supportcard AS sc5 ON umasingle.uma_sc5 = sc5.id
                    LEFT JOIN supportcard AS sc6 ON umasingle.uma_sc6 = sc6.id
                    `
        qurSql(this.sqlcon, query,res=>{
            this.result = res;
            console.log(res)
        })
    }
}
</script>