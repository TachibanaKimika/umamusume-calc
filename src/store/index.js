/*
 * @Author: your name
 * @Date: 2021-07-08 13:29:38
 * @LastEditTime: 2021-07-31 17:29:24
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
    user:{
      uuid:null,
      passwd:null
    }
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
    },
    getUser(state, user){
      state.user.uuid = user.uuid
      state.user.passwd = user.passwd
    }
  },
})
