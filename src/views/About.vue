<!--
 * @Author: your name
 * @Date: 2021-06-15 17:31:37
 * @LastEditTime: 2021-08-25 13:20:39
 * @LastEditors: Akarichan
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
      text:`# 赛🐎💃相关数据


## 支援卡固有技能


|Column1  |Column2  |
|---------|---------|
|能力ボーナス(+)     |     1    |
|友情ボーナス(*)     |    10%     |
|やる気ボーナス(+)   |    15%     |
|トレーニング効果(+) |    5%     |
|得意率(*)           |    20%     |


## 练习的基础数据

### 速度锻炼
|等级  |速度  |体力  |力量  | 根性 | 智慧 | 技能点 | 消耗体力 |
|-----|------|------|------|------|-----|--------|---------|
|LV1  | 10   |  0   |  5   |  0   |  0   |   2  |21|
|LV2  | 11   |  0   |  5   |  0   |  0   |   2  |22|
|LV3  | 12   |  0   |  5   |  0   |  0   |   2  |23|
|LV4  | 13   |  0   |  6   |  0   |  0   |   2  |25|
|LV5  | 14   |  0   |  7   |  0   |  0   |   2  |27|

### 体力锻炼
|等级  |速度  |体力  |力量  | 根性 | 智慧 | 技能点 | 消耗体力 |
|-----|------|------|------|------|-----|--------|---------|
|LV1  |  0   |  9    |  0   |  4   |  0   |   2  |19|
|LV2  |  0   |  10   |  0   |  4   |  0   |   2  |20|
|LV3  |  0   |  11   |  0   |  4   |  0   |   2  |21|
|LV4  |  0   |  12   |  0   |  5   |  0   |   2  |23|
|LV5  |  0   |  13   |  0   |  6   |  0   |   2  |25|

### 力量锻炼
|等级  |速度  |体力  |力量  | 根性 | 智慧 | 技能点 | 消耗体力 |
|-----|------|------|------|------|-----|--------|---------|
|LV1  |  0   |  5    |  8   |  0   |  0   |   2  |20|
|LV2  |  0   |  5    |  9   |  0   |  0   |   2  |21|
|LV3  |  0   |  5    |  10  |  0   |  0   |   2  |22|
|LV4  |  0   |  6    |  11  |  0   |  0   |   2  |24|
|LV5  |  0   |  7    |  12  |  0   |  0   |   2  |26|


### 根性锻炼
|等级  |速度  |体力  |力量  | 根性 | 智慧 | 技能点 | 消耗体力 |
|-----|------|------|------|------|-----|--------|---------|
|LV1  |  4   |  0    |  4   |  8   |  0   |   2  |22|
|LV2  |  4   |  0    |  4   |  9   |  0   |   2  |23|
|LV3  |  4   |  0    |  4   |  10  |  0   |   2  |24|
|LV4  |  5   |  0    |  4   |  11  |  0   |   2  |26|
|LV5  |  5   |  0    |  5   |  12  |  0   |   2  |28|


### 智力锻炼
|等级  |速度  |体力  |力量  | 根性 | 智慧 | 技能点 | 消耗体力 |
|-----|------|------|------|------|-----|--------|---------|
|LV1  |  2   |  0    |  0   |  9   |  0   |   4  |-5|
|LV2  |  2   |  0    |  0   |  10   |  0   |   4  |-5|
|LV3  |  2   |  0    |  0   |  11  |  0   |   4  |-5|
|LV4  |  3   |  0    |  0   |  12  |  0   |   4  |-5|
|LV5  |  4   |  0    |  0   |  13  |  0   |   4  |-5|`,
      // filePath: process.env.BASE_URL + 'public/',
    }
  },
  // mounted(){
  //   console.log(this.text)
  //   // let path = require('../assets/wiki.md')
  //   fs.readFile(`${this.filePath}assets/wiki.md`, 'utf8' , (err, data) => {
  //     if (err) {
  //       console.error(err)
  //       return
  //     }
  //     this.text = data
  //     console.log(this.text)
  //   })
  // }
}
</script>

<style scoped>

.about{
  text-align: left;
}
</style>