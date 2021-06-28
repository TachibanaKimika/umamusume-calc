<!--
 * @Author: your name
 * @Date: 2021-06-15 17:31:37
 * @LastEditTime: 2021-06-28 17:30:11
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\views\Home.vue
-->
<template>
  <div class="home">

    <!-- 弹窗 -->
    <el-dialog :visible.sync="dialogPlay">
      <youtube :video-id="videoId" ref="youtube"></youtube>
    </el-dialog>


    <div class="headblock" style="margin:30px">
      <div class="carousel">
      <!-- <span class="demonstration">默认 Hover 指示器触发</span>
      <el-carousel height="150px">
        <el-carousel-item v-for="item in 4" :key="item">
          <h3 class="small">{{ item }}</h3>
        </el-carousel-item>
      </el-carousel> -->
      </div>
    </div>


    <div class="wow animate__animated animate__fadeInUp animate__faster" style="margin:100px">
      <img src="../assets/ttl_pv.png">
    </div>


    <div class="wow animate__animated animate__fadeInUp" style="margin:100px">
      <div class="pv-block" @click="dialogPlay=true">
        
      </div>
    </div>

    <div class="wow animate__animated animate__fadeInUp" style="margin:100px">
      <img src="../assets/ttl_tw.png">
    </div>

    <div class="wow animate__animated animate__fadeInUp" style="margin:30px">
      <div class="twitter-block">
      <twitter>
        <div class="twitter-block-loading" slot="loading">
          <div class="loader">Loading...</div>
        </div>
        <a class="twitter-timeline" data-lang="zh-cn" data-width="800" data-height="1000" data-theme="light" href="https://twitter.com/uma_musu?ref_src=twsrc%5Etfw">Tweets by uma_musu</a>
      </twitter>
      </div>
    </div>
    <div>
      <CharShow />
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import WOW from 'wowjs'
import CharShow from '@/components/child/CharShow.vue'

export default {
  name: 'Home',
  components: {
    CharShow
  },
  computed: {
    player() {
      return this.$refs.youtube.player
    }
  },
  data(){
    return {
      videoId: 'TkedWm8XvCc',
      dialogPlay: false
    }
  },
  mounted(){
    new WOW.WOW().init()
  },
  methods: {
    playVideo() {
      this.dialogPlay = true;
    }
  }
}
</script>

<style scoped>


body {
  margin: 0;
}

.headblock{
  height: 800px;
  margin: 0 auto;
  background:url(../assets/bg.jpg) no-repeat  top;
  background-size:cover
}


.twitter-block{
  width:fit-content;
  margin: 0 auto;
  animation: animated-border 1.5s infinite;
  font-family: Arial;
  color: rgba(68, 187, 255, 0.74);
  border: 2px solid;
}
.twitter-block-loading{
  display: flex;
  width:800px;
  height:600px;
  justify-content: center;
  align-items: center;
}
.loader {
  width: 250px;
  height: 50px;
  line-height: 50px;
  text-align: center;
  position: absolute;
  font-family: helvetica, arial, sans-serif;
  text-transform: uppercase;
  font-weight: 900;
  color: #ce4233;
  letter-spacing: 0.2em;
}
.loader::before, .loader::after {
  content: "";
  display: block;
  width: 15px;
  height: 15px;
  background: #ce4233;
  position: absolute;
  -webkit-animation: load 0.7s infinite alternate ease-in-out;
          animation: load 0.7s infinite alternate ease-in-out;
}
.loader::before {
  top: 0;
}
.loader::after {
  bottom: 0;
}

@-webkit-keyframes load {
  0% {
    left: 0;
    height: 30px;
    width: 15px;
  }
  50% {
    height: 8px;
    width: 40px;
  }
  100% {
    left: 235px;
    height: 30px;
    width: 15px;
  }
}

@keyframes load {
  0% {
    left: 0;
    height: 30px;
    width: 15px;
  }
  50% {
    height: 8px;
    width: 40px;
  }
  100% {
    left: 235px;
    height: 30px;
    width: 15px;
  }
}


.block{
  margin: 0 auto;
  background-color:rgba(1,1,1,0.5);
  width: 800px;
  height: 400px;
}


@keyframes animated-border-pv {
  0% {
    box-shadow: 0 0 0 0 rgba(255, 137, 137, 0.4);
  }
  100% {
     box-shadow: 0 0 0 20px rgba(255,255,255,0);
  }
}
.pv-block {
  width:800px;
  height:450px;
  background:url(../assets/pv.png) no-repeat center center;
  background-size:101% 101%;
  margin: 0 auto;
  animation: animated-border-pv 1.5s infinite;
  color: rgba(238, 85, 255, 0.74);
  border: 2px solid;
  transition:background-size 0.3s ease;
}

.pv-block:hover{
  background-size:120% 120%;
}
</style>