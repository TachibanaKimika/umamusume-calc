/*
 * @Author: your name
 * @Date: 2021-06-15 17:31:37
 * @LastEditTime: 2021-06-26 03:21:02
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\main.js
 */
import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

import animate from 'animate.css'

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

import * as echarts from 'echarts'
Vue.prototype.$echarts = echarts

import VueYoutube from 'vue-youtube'

import twitter from 'vue-twitter'

Vue.config.productionTip = false

Vue.use(ElementUI)
Vue.use(VueYoutube)
Vue.use(twitter)
Vue.use(animate)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
