<!--
 * @Author: your name
 * @Date: 2021-07-31 17:56:35
 * @LastEditTime: 2021-08-06 20:36:32
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \MyNotef:\My Repo\umamusume-calc\src\components\child\UserLogIn.vue
-->
<template>
    <div>
        <el-form :model="user">
        <el-form-item label="选择登录方式">
            <el-radio-group v-model="user.methods">
                <el-radio type="primary" label="0" true>uuid登录</el-radio>
                <el-radio type="primary" label="1">用户名登录</el-radio>
            </el-radio-group>
        </el-form-item>
        <el-form-item label="uuid" v-if="user.methods == 0">
            <el-input v-model="user.uuid"></el-input>
        </el-form-item>
        <el-form-item label="用户名" v-if="user.methods == 1">
            <el-input v-model="user.name"></el-input>
        </el-form-item>
        <el-form-item label="密码">
            <el-input v-model="user.passwd" placeholder="密码" show-password></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="logIn()">登录</el-button>
        </el-form-item>
        </el-form>
    </div>
</template>

<script>
import {qurSql} from "../../jsfile/api/con2sql.js"
import sha256 from 'crypto-js/sha256'
export default {
    name: 'UserLogIn',
    data(){
        return{
            user: {
                uuid: '',
                name: '',
                passwd: '',
                methods: '0'  //0:uuid;1:username
            }
        }
    },
    methods: {
        logIn(){
            let passwd = sha256(this.user.passwd).toString()
            let query = `select user_name as 'name', user_uuid as 'uuid', user_group as 'group' from user where ${this.user.methods==0?'user_uuid':'user_name'} = ${this.user.methods==0?this.user.uuid:'\''+this.user.name+'\''} AND user_password = '${passwd}'`
            console.log(query)
            qurSql(undefined, query, res => {
                if(res.length == 1){
                    this.$message.success('登录成功')
                    this.$store.commit('getUser',{uuid:res[0].uuid, name:res[0].name, group:res[0].group})
                    console.log(res)
                    //登录成功后, 重新初始化一遍数据
                    this.$store.commit('dataInit')
                }else{
                    this.$message.error('登录失败')
                }
            })

        },
    }
}
</script>