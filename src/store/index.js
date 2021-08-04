/*
 * @Author: your name
 * @Date: 2021-07-08 13:29:38
 * @LastEditTime: 2021-08-05 01:41:40
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \MyNotef:\My Repo\umamusume-calc\src\store\index.js
 */
import Vue from 'vue'
import Vuex from 'vuex'

import {qurSql} from "../jsfile/api/con2sql.js"

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    cards:[], // 数据库中用户的卡
    myCard:[], // 用户本地保存的卡
    myCardDb:[], // 数据库中的用户的卡
    myCardDbAdmin:[], // 数据库中主表的卡
    user:{
      uuid:null,
      name:null,
      group:null
    }
  },
  mutations: {

    // 将卡插入到本地
    insertcard2store(state, card){
      console.log(card)
      state.myCard.push(card)
      // console.log(`this is vuex.js and the num is ${state.testnum}`)
      // console.log(state.myCard)
    },
    // 使卡提交更改(本地)
    updatecard2store(state, card){
      for(let i in state.myCard){
        if(state.myCard[i].id === card.id){
          state.myCard[i] = card
          return
        }
      }
    },

    //设置用户名
    getUser(state, user){
      state.user.uuid = user.uuid
      state.user.name = user.name
    },

    // 取得数据库中的卡
    getcardInDb(state){

      //先是没有数值的卡
      qurSql(undefined, `SELECT id, spc_attribute AS atb, spc_rare AS rare ,CONCAT('【',spc_secname,'】　－　',spc_name) AS \`name\` FROM supportcard`, res => {
          state.myCardDb = res;
      })

      qurSql(undefined, `SELECT id, spc_attribute AS atb, spc_rare AS rare ,CONCAT('【',spc_secname,'】　－　',spc_name) AS \`name\` FROM supportcard`, res => {
        state.myCardDb = res;
      })
    }
  },
})
