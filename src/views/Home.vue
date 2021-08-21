<!--
 * @Author: Akarichan
 * @LastEditors: Akarichan
-->
<template>
  <div class="Home">
    <div class="markdown-body">
    <VueMarkdown :source="text"></VueMarkdown>
    </div>
  </div>
</template>

<script>
const fs = require('fs')
import VueMarkdown from 'vue-markdown'

export default {
  name:'HomePage',
  components:{
    VueMarkdown
  },
  data(){
    return{
      text:'',
      filePath: process.env.BASE_URL + 'public/',
    }
  },
  mounted(){
    console.log(this.text)
    fs.readFile(`${this.filePath}assets/readme.md`, 'utf8' , (err, data) => {
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

.Home{
  text-align: left;
}
</style>