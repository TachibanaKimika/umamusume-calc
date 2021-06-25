/*
 * @Author: your name
 * @Date: 2021-06-15 17:31:37
 * @LastEditTime: 2021-06-26 00:40:34
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\router\index.js
 */
import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: '/UpdataAdm',
    name: 'UpdataAdm',
    component: () => import(/* webpackChunkName: "" */ '../components/UpdateDataAdmin.vue')
  },
  {
    path: '/RegisteredCard',
    name: 'RegisteredCard',
    component: () => import(/* webpackChunkName: "" */ '../components/GetRegisteredCard.vue')
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
    path: '/Test',
    name: 'Test',
    component: () => import('../components/Test.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
