<!--
 * @Author: your name
 * @Date: 2021-06-20 23:40:42
 * @LastEditTime: 2021-06-27 01:55:17
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\components\Test.vue
-->
<template>
    <div class="Test">
        <ul>
            <li @click="charcur=0" :class="{active:cur==0}"><span>全部</span></li>
            <li @click="charcur=1" :class="{active:cur==1}"><span>好评</span></li>
            <li @click="charcur=2" :class="{active:cur==2}"><span>差评</span></li>
        </ul>

        <div class="showchar">
            <ul class="topnav-show " v-show="charcur==0">
                <div class="char-frame" id="supe">
                    <div class="char-st">
                        <img class="animate__animated animate__fadeIn animate__delay-1s" src="../assets/char/supe_st.png" alt="">
                    </div>
                    <div class="char-info">
                        <img class="animate__animated animate__fadeIn" src="../assets/char/supe_bg.png" alt="">
                    </div>
                    <div class="char-hanashi">
                        <img class="animate__animated animate__bounceInLeft animate__delay-2s" src="../assets/char/supe_st_t.png" alt="">
                    </div>
                </div>
            </ul>
            <ul class="topnav-show" v-show="charcur==1">
                <li>内容2</li>
            </ul>
            <ul class="topnav-show" v-show="charcur==2">
                <li>内容3</li>
            </ul>
        </div>
        <div style="width:100%;height: 400px;background-color:red">

        </div>
    </div>
</template>

<script>
export default {
    name: 'Test',
    data(){
        return {
            charcur:0,
        }
    },
}
</script>

<style scoped>
.showchar{
    margin:200px;
}


.char-frame{
    margin: 0 auto;
    position: relative;
    width:90%;
}
.char-info{
    position: absolute;
    top: 200px;
    z-index:1;
}
.char-st{
    position: absolute;
    size:80%;
    top: -200px;
    left: -50px;
    z-index: 2;
}
.char-hanashi{
    position: absolute;
    top: -200px;
    left: -50px;
    z-index: 3;
}

img {
    max-width: 100%;
    height:auto;
    display: block;
    border-style: none;
}
</style>