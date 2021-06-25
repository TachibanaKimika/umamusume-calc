<!--
 * @Author: your name
 * @Date: 2021-06-15 17:31:37
 * @LastEditTime: 2021-06-26 02:54:59
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\views\Home.vue
-->
<template>
  <div class="home">

    <!-- 这里的为弹窗 -->
    <el-dialog title="播放视频" :visible.sync="dialogPlay" @close="closeDialog">
      <youtube :video-id="videoId" ref="youtube" @playing="playing" ></youtube>
    </el-dialog>



    <div class="wow animate__animated animate__slideInUp animate__delay-1s" style="margin:30px">
      <img src="../assets/ttl_pv.png">
    </div>


    <div class="wow animate__animated animate__slideInUp animate__delay-1s" style="margin:30px">
      <div class="pv-block">
        <div class="block" @click="playVideo" ></div>
      </div>
    </div>
    <div class="wow animate__animated animate__slideInUp animate__delay-1s twitter-block">

      <div class="twitter-block">
      <twitter>
        <div class="twitter-block-loading" slot="loading">
          <div class="loader" >
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
          </div>
        </div>
        <a class="twitter-timeline" data-lang="zh-cn" data-width="500" data-height="600" data-theme="light" href="https://twitter.com/uma_musu?ref_src=twsrc%5Etfw">Tweets by uma_musu</a>
      </twitter>
      </div>
    </div>
    <div class="wow animate__animated animate__slideInUp animate__delay-1s">
      <div class="block"></div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import WOW from 'wowjs'


export default {
  name: 'Home',
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
.twitter-block{
  width:fit-content;
  margin: 0 auto;
  animation: animated-border 1.5s infinite;
  font-family: Arial;
  color: rgba(68, 187, 255, 0.74);
  border: 2px solid;
}
.twitter-block-loading{
  width:500px;
  height:600px;
}
.loader {
  position: absolute;
  top: 50%;
  left: 40%;
  margin-left: 10%;
  transform: translate3d(-50%, -50%, 0);
}
.dot {
  width: 24px;
  height: 24px;
  background: #3ac;
  border-radius: 100%;
  display: inline-block;
  animation: slide 1s infinite;
}
.dot:nth-child(1) {
  animation-delay: 0.1s;
  background: #32aacc;
}
.dot:nth-child(2) {
  animation-delay: 0.2s;
  background: #64aacc;
}
.dot:nth-child(3) {
  animation-delay: 0.3s;
  background: #96aacc;
}
.dot:nth-child(4) {
  animation-delay: 0.4s;
  background: #c8aacc;
}
.dot:nth-child(5) {
  animation-delay: 0.5s;
  background: #faaacc;
}
@-moz-keyframes slide {
  0% {
    transform: scale(1);
  }
  50% {
    opacity: 0.3;
    transform: scale(2);
  }
  100% {
    transform: scale(1);
  }
}
@-webkit-keyframes slide {
  0% {
    transform: scale(1);
  }
  50% {
    opacity: 0.3;
    transform: scale(2);
  }
  100% {
    transform: scale(1);
  }
}
@-o-keyframes slide {
  0% {
    transform: scale(1);
  }
  50% {
    opacity: 0.3;
    transform: scale(2);
  }
  100% {
    transform: scale(1);
  }
}
@keyframes slide {
  0% {
    transform: scale(1);
  }
  50% {
    opacity: 0.3;
    transform: scale(2);
  }
  100% {
    transform: scale(1);
  }
}


.block{
  margin: 0 auto;
  background-color:rgba(1,1,1,0.5);
  width: 400px;
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
  width:fit-content;
  margin: 0 auto;
  animation: animated-border-pv 1.5s infinite;
  color: rgba(238, 85, 255, 0.74);
  border: 2px solid;
}
</style>