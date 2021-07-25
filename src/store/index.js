/*
 * @Author: your name
 * @Date: 2021-07-08 13:29:38
 * @LastEditTime: 2021-07-25 15:52:45
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
  },
  mutations: {
    insertcard2store(state, card){
      console.log(card)
      state.myCard.push(card)
      // console.log(`this is vuex.js and the num is ${state.testnum}`)
      // console.log(state.myCard)
    },
    updatecard2store(state, card){
      for(let i in state.myCard){
        if(state.myCard[i].id === card.id){
          state.myCard[i] = card
          return
        }
      }
    }
  },
})
