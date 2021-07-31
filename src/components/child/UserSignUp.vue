<!--
 * @Author: your name
 * @Date: 2021-07-31 18:19:14
 * @LastEditTime: 2021-08-01 00:03:01
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \MyNotef:\My Repo\umamusume-calc\src\components\child\UserSignIn.vue
-->
<template>
    <div>
        <el-form :model="user">
        <el-form-item label="uuid">
            <el-input v-model="user.uuid" placeholder="赛马娘游戏id"></el-input>
        </el-form-item>
        <el-form-item label="用户名">
            <el-input v-model="user.name"></el-input>
        </el-form-item>
        <el-form-item label="密码">
            <el-input v-model="user.passwd" placeholder="密码"></el-input>
        </el-form-item>
        <el-form-item label="确认密码">
            <el-input v-model="user.passwdRp" placeholder="密码"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="SignUp()">注册</el-button>
        </el-form-item>
        </el-form>
    </div>
</template>

<script>
import sha256 from 'crypto-js/sha256'

import {qurSql} from "../../jsfile/api/con2sql.js"
export default {
    name: 'UserSignUp',
    data(){
        return{
            user: {
                uuid: '',
                name: '',
                passwd: '',
                passwdRp: '', 
            }
        }
    },
    methods: {
        SignUp(){
            if(!this.signCheck()){
                return
            }
            let passwd = sha256(this.user.passwd).toString()
            qurSql({
                username: 'akarichan',
                userpasswd: 'akariChan@0721',
                database: 'umamusume-pbl',
            },`INSERT INTO user (user_name, user_password, user_uuid) VALUES ('${this.user.name}', '${passwd}', ${this.user.uuid})`,res=>{
                console.log(res)
                this.$message('注册成功')
            })

        },
        signCheck(){
            if(!/^\d{9}$/g.test(this.user.uuid)){
                this.$message.error('uuid必须为9为纯数字')
            }
            if(this.user.passwd!=this.user.passwdRp){
                this.$message.error('两次密码输入不一致')
                return false
            }
            qurSql(undefined, `select count(*) as cou from user where user_uuid=${this.user.uuid}`, res=>{
                if(res.cou > 0){
                    this.$message.error('已有重复的uuid, 无法注册')
                    return false
                }
            })
            return true
        }
    }
}
</script>