<!--
 * @Author: your name
 * @Date: 2021-07-31 17:56:35
 * @LastEditTime: 2021-07-31 18:18:11
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \MyNotef:\My Repo\umamusume-calc\src\components\child\UserLogIn.vue
-->
<template>
    <div>
        <el-form :model="user">
        <el-form-item label="选择登录方式">
            <el-radio-group v-model="user.methods">
                <el-radio type="primary" label="0">uuid登录</el-button>
                <el-radio type="primary" label="1">用户名登录</el-button>
            </el-radio-group>
        </el-form-item>
        <el-form-item label="uuid" v-if="user.methods == 0">
            <el-input v-model="user.uuid"></el-input>
        </el-form-item>
        <el-form-item label="用户名" v-if="user.methods == 1">
            <el-input v-model="user.name"></el-input>
        </el-form-item>
        <el-form-item label="密码">
            <el-input v-model="user.passwd" placeholder="密码"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="logIn()">登录</el-button>
        </el-form-item>
        </el-form>
    </div>
</template>

<script>
export default {
    name: UserLogIn,
    data(){
        return{
            user: {
                uuid: '',
                name: '',
                passwd: '',
                methods: 0  //0:uuid;1:username
            }
        }
    },
    methods: {
        logIn(){
            let query = `select count(*) from user where ${this.user.methods==0?'user_uuid':'user_name'} = ${this.user.methods==0?this.user.uuid:this.user.name}`
        },
    }
}
</script>