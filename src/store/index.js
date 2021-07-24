/*
 * @Author: your name
 * @Date: 2021-07-08 13:29:38
 * @LastEditTime: 2021-07-24 22:54:29
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \MyNotef:\My Repo\umamusume-calc\src\store\index.js
 */
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    myCard:[],
    testnum: 1919810
  },
  mutations: {
    insertcard2store(state, card){
      console.log(card)
      state.myCard.push(card)
      // console.log(`this is vuex.js and the num is ${state.testnum}`)
      // console.log(state.myCard)
    }
  },
})
