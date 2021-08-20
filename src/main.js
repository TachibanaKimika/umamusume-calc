/*
 * @Author: your name
 * @Date: 2021-06-15 17:31:37
 * @LastEditTime: 2021-08-17 19:11:35
 * @LastEditors: Akarichan
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\main.js
 */
import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

import Sugar from 'sugar'
Sugar.extend()

import animate from 'animate.css'

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

import * as echarts from 'echarts'
Vue.prototype.$echarts = echarts

import VueYoutube from 'vue-youtube'
import twitter from 'vue-twitter'

Vue.config.productionTip = false

import 'github-markdown-css/github-markdown.css'

Vue.use(ElementUI)
Vue.use(VueYoutube)
Vue.use(twitter)
Vue.use(animate)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
