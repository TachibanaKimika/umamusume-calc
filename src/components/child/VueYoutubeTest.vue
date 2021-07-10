<!--
 * @Author: your name
 * @Date: 2021-06-26 00:37:39
 * @LastEditTime: 2021-07-11 02:10:00
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\components\child\VueYoutubeTest.vue
-->

<template>
  <div>
    <youtube :video-id="videoId" ref="youtube"></youtube>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        videoId: 'lG0Ys-2d4MA'
      }
    },
    methods: {
      playVideo() {
        this.player.playVideo()
      },
      playing() {
        console.log('\o/ we are watching!!!')
      }
    },
    computed: {
      player() {
        return this.$refs.youtube.player
      }
    }
  }
</script>