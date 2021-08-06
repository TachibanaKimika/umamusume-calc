<!--
 * @Author: your name
 * @Date: 2021-07-31 18:19:14
 * @LastEditTime: 2021-08-06 21:03:12
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
            <el-input v-model="user.passwd" placeholder="密码" show-password></el-input>
        </el-form-item>
        <el-form-item label="确认密码">
            <el-input v-model="user.passwdRp" placeholder="密码" show-password></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="SignUp()">注册</el-button>
        </el-form-item>
        </el-form>
    </div>
</template>

<script>
import sha256 from 'crypto-js/sha256'

import {qurSql, qurSqlPromise} from "../../jsfile/api/con2sql.js"
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
        async SignUp(){
            let bol = await this.signCheck()
            console.log(bol)
            if(!bol){
                return
            }
            let passwd = sha256(this.user.passwd).toString()
            //console.log('...')
            qurSql({
                username: 'akarichan',
                userpasswd: 'akariChan@0721',
                database: 'umamusume-pbl',
            },`INSERT INTO user (user_name, user_password, user_uuid, user_group) VALUES ('${this.user.name}', '${passwd}', ${this.user.uuid}, 'user')`,res=>{
                console.log(res)
                this.$message('注册成功')
                this.$store.commit('getUser',{uuid:this.user.uuid, name:this.user.name, group:'user'})
                this.$store.commit('dataInit')
            })
            
            

        },
        async signCheck(){
            if(!/^\d{9}$/g.test(this.user.uuid)){
                this.$message.error('uuid必须为9为纯数字')
                return false
            }
            if(!/^(a-z|A-Z|0-9)*[^$%^&*;:,<>?()\""\']{6,16}$/.test(this.user.passwdRp)){
                this.$message.error('密码长度应为6-16位')
                return false
            }
            if(!/^(a-z|A-Z|0-9)*[^$%^&*;:,<>?()\""\']{3,16}$/.test(this.user.name)){
                this.$message.error('用户名长度应为3-16位')
                return false
            }
            if(this.user.passwd!=this.user.passwdRp){
                this.$message.error('两次密码输入不一致')
                return false
            }

            let res1 = await qurSqlPromise(undefined, `select count(*) as cou from user where user_uuid=${this.user.uuid}`)
            let res2 = await qurSqlPromise(undefined, `select count(*) as cou from user where user_name='${this.user.name}'`)
            console.log(res2)
            if(res1[0].cou>0){
                this.$message.error('uuid重复')
                return false
            }
            
            if(res2[0].cou>0){
                this.$message.error('用户名重复')
                return false
            }
            console.log('return true')
            return true
        }
    }
}
</script>