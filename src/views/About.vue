<!--
 * @Author: your name
 * @Date: 2021-06-15 17:31:37
 * @LastEditTime: 2021-06-28 18:11:49
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\views\About.vue
-->
<template>
  <div class="about">
    <div class="markdown-body">
    <VueMarkdown :source="text"></VueMarkdown>
    </div>
  </div>
</template>

<script>
const fs = require('fs')
import VueMarkdown from 'vue-markdown'

export default {
  name:'AboutVue',
  components:{
    VueMarkdown
  },
  data(){
    return{
      text:''
    }
  },
  mounted(){
    console.log(this.text)
    fs.readFile('./README.md', 'utf8' , (err, data) => {
      if (err) {
        console.error(err)
        return
      }
      this.text = data
      console.log(this.text)
    })
  }
}
</script>

<style scoped>

.about{
  text-align: left;
}
</style>