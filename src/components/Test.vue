<!--
 * @Author: your name
 * @Date: 2021-06-20 23:40:42
 * @LastEditTime: 2021-06-26 00:44:56
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\components\Test.vue
-->
<template>
    <div class="Test">
        <VueYoutubeTest/>
    </div>
</template>

<script>
import VueYoutubeTest from "@/components/child/VueYoutubeTest.vue"

export default {
    name: 'Test',
    components:{
        VueYoutubeTest
    },
}
</script>

<style scoped>
.el-radio-group, .el-input-number, .el-input{
    display: inline-block;
    margin:10px;
}
</style>