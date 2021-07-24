<!--
 * @Author: your name
 * @Date: 2021-06-20 23:40:42
 * @LastEditTime: 2021-07-24 16:45:34
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\components\Test.vue
-->
<template>
    <div class="Test">
       
    </div>
</template>

<script>
export default {
    name: 'Test',
    data(){
        return {
            charcur:0,
            charstcur:0
        }
    },
    mounted() {
        // console.log(this.$store.state.myCard)
    }
}
</script>

<style scoped>
/* animation delay */



.ttl{
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    height: 67px;
    margin-bottom: 90px;
    background: #63c404 no-repeat 50%;
    border: 3px solid #479000;
    position: relative;
    z-index: 2;
}

/* 整体的框 */
.showchar{
    margin:100px;
    height:900px;
}

/* 选择角色 */
.char-selector img{
    display:inline;
    margin:0 20px;
    transition: all 0.1s linear;
}
.char-selector img:hover{
    transform: scale(0.92);
}



.char-frame{
    margin: 0 auto;
    position: relative;
    width:1200px;
    bottom:100px;
}
/* 整个背景 */
.char-info{
    position: absolute;
    top: 200px;
    z-index:1;
}
/* 立绘 */
.char-st{
    position: absolute;
    top: -100px;
    left: 30px;
    z-index: 2;
}
.char-st img{
    width:80%;
    height:80%;
}
/* 对话条 */
.char-hanashi{
    position: absolute;
    top: -100px;
    z-index: 3;
}
.char-hanashi img{
    width: 80%;
}

/* 观看介绍条 */
.char-moreinfo{
    position: absolute;
    top: 900px;
    right: 90px;
    z-index: 3;
    border-radius: 10px;
    background-size: contain;
    transition:background-size 0.3s ease;
}
.char-moreinfo img{
    margin: 0 auto;
}
.char-moreinfo:hover{
    transform: scale(0.87);
}
/* 立绘按钮组 */
.char-st-selector{
    position: absolute;
    top:760px;
    right: 620px;
    z-index: 3;
}
/* 选择立绘按钮 */
.char-st-selector ul li a{
    position: relative;
    background-size: 100%;
    width: 60px;
    height: 62px;
    position: relative;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
    -webkit-justify-content: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    margin: 10px 0;
    color: #fff;
    font-size: 1rem;
    font-weight: 700;
    text-decoration: none;
    padding-right: 3px;
    padding-bottom: 3px;
    transition: all 0.1s linear;
}
.char-st-selector ul li a:hover{
    transform: scale(0.87);
}


/* 替换 */
#supe .char-moreinfo{
    background:url(../assets/char/supe_moreinfo_2.png) repeat
}
#supe .char-st-selector ul li a{
    background: url(../assets/char/supe_btn.png); /* 只换这个 */
    background-size: 100%;
}

#unsu .char-moreinfo{
    background:url(../assets/char/unsu_moreinfo_2.png) repeat
}
#unsu .char-st-selector ul li a{
    background: url(../assets/char/unsu_btn.png); /* 只换这个 */
    background-size: 100%;
}



img {
    max-width: 100%;
    height:auto;
    display: block;
    border-style: none;
}

li{
    list-style: none;
}
:root{
    --animation-delay: 0.1s;
}

</style>