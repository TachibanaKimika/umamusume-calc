<template>
    <TestSelectWindow cards=card_item />
</template>

<script>
import {qurSql} from "../jsfile/api/con2sql.js"
import TestSelectWindow from "@/components/child/TestSelectWindow.vue"
export default {
    name:'InsertUma',
    components: {
        TestSelectWindow
    },
    data(){
        return {
            sqlcon:{
                username: 'Guest',
                userpasswd: 'password#123',
                hostname: 'rm-bp1id4y905ysrz6pvjo.mysql.rds.aliyuncs.com',
                database: 'umamusume-pbl',
            },
            card_item: [],
        }
    },
    mounted(){
        let query = 'SELECT id, spc_attribute AS atb, spc_rare AS rare ,CONCAT(\'【\',spc_secname,\'】　－　\',spc_name) AS `name` FROM supportcard'
        qurSql(this.sqlcon, query, res=>{
            this.card_item = res;
        })
    }

}
</script>