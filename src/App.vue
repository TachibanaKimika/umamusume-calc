<!--
 * @Author: your name
 * @Date: 2021-06-15 17:31:37
 * @LastEditTime: 2021-07-31 23:38:38
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\App.vue
-->
<template>
  <div id="app">
    <div id="nav">
      <el-menu class="el-menu-demo" mode="horizontal" router>
        <el-menu-item index="/">主页</el-menu-item>
        <el-menu-item index="/about">about</el-menu-item>
        <el-menu-item index="/ToreSimulation">练习模拟</el-menu-item>
        <el-menu-item index="/SinlgeCardAnalysis">单卡分析</el-menu-item>
        <el-menu-item index="/DataAnalysis">数据统计</el-menu-item>
        <el-menu-item index="/RegisterNewUma">更新🐎</el-menu-item>
        <el-menu-item index="/InsertCardData">插入/修改支援卡数据</el-menu-item>
        <el-menu-item index="/InsertSkill">插入技能</el-menu-item>
        <!-- <el-menu-item index="/GetAllMyUma">GETMYUMA</el-menu-item> -->
        <el-menu-item index="/InsertData2DB">更新数据库</el-menu-item>
        <el-menu-item index="/Test">测试用</el-menu-item>
        <div style="float: right; line-height: 60px; padding: 0 60px;">
          <div v-if="user.uuid==null">未登录 | <el-button size="small" @click="dialogVisible = true">登录/注册</el-button></div><div v-else="user.uuid!=null">用户id:{{user.uuid}} | <el-button size="small" @click="logout()">登出</el-button></div>
        </div>
      </el-menu>
    </div>
    <div class="router-view">
      <router-view />
    </div>
    <el-dialog
      :visible.sync="dialogVisible"
      width="30%">
      <UserSignUp />
    </el-dialog>
  </div>
</template>

<script>
import UserSignUp from "@/components/child/UserSignUp.vue"



export default {
  components:{
    UserSignUp
  },
  data(){
    return{
      dialogVisible: false,
      user:{
        uuid:'123456789',
        passwd: null
      }
    }
  },
  methods:{
    logout(){
      this.user =  {
        uuid: null,
        passwd: null
      }
    },
  },
  computed: {
    usertest() {
        return this.$store.state.user
    }
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
    padding: 30px;
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

