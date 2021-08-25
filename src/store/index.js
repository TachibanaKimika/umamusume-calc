/*
 * @Author: your name
 * @Date: 2021-07-08 13:29:38
 * @LastEditTime: 2021-08-25 11:22:46
 * @LastEditors: Akarichan
 * @Description: In User Settings Edit
 * @FilePath: \MyNotef:\My Repo\umamusume-calc\src\store\index.js
 */
import Vue from 'vue'
import Vuex from 'vuex'

import {qurSql} from "../jsfile/api/con2sql.js"

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    uma:[],
    cards:[], // 数据库中的卡(raw)
    myCard:[], // 用户本地保存的卡(in vuex)
    myCardDb:[], // 数据库中主表的卡
    myCardDbUser:[], // 数据库中的用户的卡
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
      state.user.group = user.group
    },

    // 取得数据库中的卡
    dataInit(state){

      //先是没有数值的卡
      qurSql(undefined, 
        `SELECT id, spc_attribute AS atb, spc_rare AS rare ,CONCAT('【',spc_secname,'】　－　',spc_name) AS 'name', spc_img imgurl FROM supportcard`
        
        , res => {
          state.cards = res;
      })

      qurSql(undefined, `SELECT id, CONCAT('【',uma_secname,'】－',uma_name) AS 'name', uma_icon imgurl FROM uma`, res=>{
        state.uma = res
      })

      //更新有数值的卡 
      qurSql(undefined, `SELECT 
      supportcard_stu.id, supportcard_stu.spc_id,supportcard.spc_attribute,supportcard.spc_rare,
      supportcard_stu.spc_lv,supportcard_stu.spc_youujo,supportcard_stu.spc_yaruki,supportcard_stu.spc_tore,
      supportcard_stu.spc_bonasu_pt,supportcard_stu.spc_tokuitu,supportcard_stu.spc_kizuna,
      supportcard_stu.spc_init_stu,supportcard_stu.spc_race,supportcard_stu.spc_fan,supportcard_stu.spc_hit_lv,
      supportcard_stu.spc_hit_ritu,supportcard_stu.spc_reduce_suta,supportcard_stu.spc_reduce_shipai,
      supportcard.spc_img imgurl,
      CONCAT('【',supportcard_stu.spc_lv,'】 ‐ 【',supportcard.spc_secname,'】　-　',supportcard.spc_name) spc_name
      FROM supportcard_stu
      LEFT JOIN supportcard ON supportcard.id = supportcard_stu.spc_id
      ORDER BY spc_name DESC`, res => {
          state.myCardDb = res;
      })

      //若有登录的账户, 获取其账户中的数据
      if(state.user.group != null){
        qurSql(undefined, `SELECT   
        supportcard_stu_user.id, spc_id, supportcard.spc_attribute, supportcard.spc_rare,
        spc_lv, spc_youujo, spc_yaruki, spc_tore,
        spc_bonasu_pt, spc_tokuitu, spc_kizuna,
        spc_init_stu, spc_race, spc_fan, spc_hit_lv,
        spc_hit_ritu, spc_reduce_suta, spc_reduce_shipai,
        supportcard.spc_img imgurl,
        CONCAT('【', spc_lv,'】 ‐ 【', spc_secname,'】　-　', spc_name) spc_name
        FROM supportcard_stu_user
        LEFT JOIN supportcard ON supportcard.id = supportcard_stu_user.spc_id
        WHERE spc_uuid = ${state.user.uuid}
        ORDER BY spc_name DESC`,res=>{
          state.myCardDbUser = res
        })
      }
    }
  },
})
