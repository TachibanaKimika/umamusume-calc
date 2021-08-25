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
      text:`# umamusume-calc

# 使用文档

## 使用说明

若有图片显示不出, 可以按<kbd>ctrl</kbd>+<kbd>shift</kbd>+<kbd>I</kbd>打开控制台查看相关错误信息.
由于图片使用的基本是gamewith上现成的, 多多少少会有点问题, 一般挂个梯子就好了

### **练习模拟**

使用6张支援卡, 可以模拟单次或若干次练习次数最后生成盒须图查看结果的数值以及分布情况.

盒须图生成后的数据说明: 
- 每个盒须图的颜色对应练习的种类, 盒须图的位置对应加成的数值


### **单卡分析**

对比支援卡数据, 并且可以对任意练习进行单次模拟比较数据

### **数据统计**

对数据库中马的数据进行整合统计, 并将其可视化


### **查看🐎**

查看各个用户养成的🐎, 包括数值适性, 支援卡组成等等


### **单体🐎更新(需要登录账户)**

更新🐎, 🐎会更新到用户自己的账户数据中

包括数值及其配置等

**技能说明** 由于懒, 技能只对颜色以及稀有度进行了分类, 并非游戏数据错误

### **插入, 修改支援卡数据**

可以选择插入到数据库(管理员), 若无管理员账号, 会将🐎更新到表 \`supportcard_stu_user\`中, 用户登录后可以继续使用, 也可以选择将数据更新到本地(Vuex)


### **更新数据库**

更新数据库, 需要管理员权限

### **其他**

- 若游戏数据有误, 或新的数据没有提交, 请将相关问题发送到\`hlx12155326@gmail.com\`中
- 若程序有bug, 请提交issue, 仓库地址: **https://github.com/TachibanaKimika/umamusume-calc**
`,
    }
  },

}
</script>

<style scoped>

.Home{
  text-align: left;
}
</style>