<!--
 * @Author: your name
 * @Date: 2021-07-26 20:07:01
 * @LastEditTime: 2021-07-26 21:47:10
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \MyNotef:\My Repo\umamusume-calc\src\components\InsertData2DB.vue
-->
<template>
<div>
    <!-- Form -->
    <el-button type="text" @click="dialogFormVisible_SPC = true">更新支援卡</el-button>

    <el-dialog title="card" :visible.sync="dialogFormVisible_SPC">
        <el-form :model="card">
            <el-form-item label="名前" :label-width="formLabelWidth">
            <el-input v-model="card.name" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="二つ名" :label-width="formLabelWidth">
            <el-input v-model="card.secname" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="タイプ" :label-width="formLabelWidth">
            <el-select v-model="card.atb" placeholder="タイプ">
                <el-option label="スビート" value="1"></el-option>
                <el-option label="スタミナ" value="2"></el-option>
                <el-option label="パワー" value="3"></el-option>
                <el-option label="根性" value="4"></el-option>
                <el-option label="賢さ" value="5"></el-option>
                <el-option label="友人" value="6"></el-option>
            </el-select>
            </el-form-item>
            <el-form-item label="レア度" :label-width="formLabelWidth">
            <el-select v-model="card.rare" placeholder="レア度">
                <el-option label="SSR" value="3"></el-option>
                <el-option label="SR" value="2"></el-option>
            </el-select>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>
        </div>
    </el-dialog>
</div>
</template>

<script>
import {qurSql} from '../jsfile/api/con2sql.js'

export default {
    name: 'InsertData2DB',
    data() {
        return{
            dialogFormVisible_SPC: false,
            card:{
                name: '',
                secname: '',
                atb: '',
                rare: '',
            },
            uma:{
                name: '',
                secname: ''
            },
            sqlcon: {
                username: 'akarichan',
                userpasswd: 'akariChan@0721',
                database: 'umamusume-pbl',
            },
        }
    },
    method:{
        insertUma(){
            let query = `INSERT INTO uma (uma_name, uma_secname) VALUES ('${this.uma.name}', '${this.uma.secname}')`
            qurSql(this.sqlcon, query, res => {
                console.log(res)
                let msg = `插入成功, 影响行数:  + ${res.affectedRows}, msg=${res.message}`
                this.callOutMsg('success', msg)
            })
        },
        insertSupportCard(){
            let query = `INSERT INTO supportcard (spc_attribute, spc_name, spc_secname, spc_rare) VALUES (${this.card.atb} ,'${this.card.name}', '${this.card.secname}', ${this.card.rare})`
        },
        callOutMsg(type, data) {
            this.$message({
                showClose: true,
                center: true,
                message: data,
                type: type
            });
        },
    }
}
</script>