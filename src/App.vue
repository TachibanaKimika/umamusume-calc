<!--
 * @Author: your name
 * @Date: 2021-06-15 17:31:37
 * @LastEditTime: 2021-08-16 23:42:16
 * @LastEditors: Akarichan
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\App.vue
-->
<template>
  <div id="app">
    <BackGround style="z-index:-100" />
    <div id="nav">
      <el-menu class="el-menu-demo" mode="horizontal" router>
        <el-menu-item index="/">主页</el-menu-item>
        <el-menu-item index="/about">about</el-menu-item>
        <el-menu-item index="/ToreSimulation">练习模拟</el-menu-item>
        <el-menu-item index="/SinlgeCardAnalysis">单卡分析</el-menu-item>
        <el-menu-item index="/DataAnalysis">数据统计</el-menu-item>
        <el-menu-item index="/GetAllMyUma">查看🐎</el-menu-item>
        <el-menu-item index="/RegisterNewUma">更新🐎</el-menu-item>
        <el-menu-item index="/InsertCardData">插入/修改支援卡数据</el-menu-item>
        <el-menu-item index="/InsertSkill" v-if="this.$store.state.user.group=='admin'">插入技能</el-menu-item>
        <el-menu-item index="/InsertData2DB" v-if="this.$store.state.user.group=='admin'">更新数据库</el-menu-item>
        <el-menu-item index="/Test" v-if="this.$store.state.user.group=='admin'">测试用</el-menu-item>
        <div style="float: right; line-height: 60px; padding: 0 60px;">
          <div v-if="user.uuid==null">未登录 | <el-button size="small" @click="dialogVisible = true">登录/注册</el-button></div><div v-else="user.uuid!=null">{{user.name}} | {{user.uuid}} | <el-button size="small" @click="logout()">登出</el-button></div>
        </div>
      </el-menu>
    </div>
    <div class="router-view">
      <router-view />
    </div>
    <el-dialog
      :visible.sync="dialogVisible"
      width="30%">
      <el-radio-group v-model="signOrLog">
        <el-radio-button label="0">注册</el-radio-button>
        <el-radio-button label="1">登录</el-radio-button>
      </el-radio-group>
      <UserSignUp v-if="signOrLog==0" />
      <UserLogIn v-if="signOrLog==1" />
    </el-dialog>
  </div>
</template>

<script>
import UserSignUp from "@/components/child/UserSignUp.vue"
import UserLogIn from "@/components/child/UserLogIn.vue"
import BackGround from '@/components/BackGround.vue'
export default {
  components:{
    BackGround,
    UserSignUp,
    UserLogIn
  },
  data(){
    return{
      signOrLog:0,  //sign-0, log-1
      dialogVisible: false,
    }
  },
  methods:{
    logout(){
      this.$store.commit('getUser',{uuid:null, name:null, group:null})
    },
  },
  computed: {
    user() {
        return this.$store.state.user
    }
  },
  mounted(){
    this.$store.commit('dataInit')
  }
}
</script>


<style>
  #app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
  }

  #nav {
    padding-bottom: 30px;
  }

  #nav a {
    font-weight: bold;
    color: #2c3e50;
  }

  #nav a.router-link-exact-active {
    color: #42b983;
  }

  .router-view {
    padding: 0px 40px;
  }
</style>

