/*
 * @Author: your name
 * @Date: 2021-06-15 17:31:37
 * @LastEditTime: 2021-08-27 14:16:51
 * @LastEditors: Akarichan
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\router\index.js
 */
import Vue from 'vue'
import VueRouter from 'vue-router'


Vue.use(VueRouter)

const routes = [{
    path: '/',
    name: 'Home',
    component: () => import('../views/Home.vue')
  },
  {
    path: '/about',
    name: 'About',
    component: () => import('../views/About.vue')
  },
  {
    path: '/InsertCardData',
    name: 'InsertCardData',
    component: () => import('../components/InsertCardData.vue')
  },
  {
    path: '/ToreSimulation',
    name: 'ToreSimulation',
    component: () => import('../components/ToreSimulation.vue')
  },
  {
    path: '/DataAnalysis',
    name: 'DataAnalysis',
    component: () => import('../components/DataAnalysis.vue')
  },
  {
    path: '/RegisterNewUma',
    name: 'RegisterNewUma',
    component: () => import('../components/RegisterNewUma.vue')
  },
  {
    path: '/InsertSkill',
    name: 'InsertSkill',
    component: () => import('../components/InsertSkill.vue')
  },
  {
    path: '/GetAllMyUma',
    name: 'GetAllMyUma',
    component: () => import('../components/GetAllMyUma.vue')
  },
  {
    path: '/Test',
    name: 'Test',
    component: () => import('../components/QueryInit.vue')
  },
  {
    path: '/SinlgeCardAnalysis',
    name: 'SinlgeCardAnalysis',
    component: () => import('../components/SinlgeCardAnalysis.vue')
  },{
    path: '/InsertData2DB',
    name: 'InsertData2DB',
    component: () => import('../components/InsertData2DB.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router