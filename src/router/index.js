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
    path: '/UpdateSingleUma',
    name: 'UpdateSingleUma',
    component: () => import('../components/UpdateSingleUma.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
