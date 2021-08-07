/*
 * @Author: your name
 * @Date: 2021-07-08 13:29:38
 * @LastEditTime: 2021-08-07 00:55:21
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \MyNotef:\My Repo\umamusume-calc\src\jsfile\api\insertUma.js
 */
import {qurSql} from './con2sql.js';

var updatenewuma = async function(obj){
  let sqlcon = {
    username:'akarichan',
    userpasswd: 'akariChan@0721',
    database: 'umamusume-pbl',
  }
  Date.prototype.Format = function (fmt) { // author: meizz
    var o = {
        "M+": this.getMonth() + 1, // 月份
        "d+": this.getDate(), // 日
        "h+": this.getHours(), // 小时
        "m+": this.getMinutes(), // 分
        "s+": this.getSeconds(), // 秒
        "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
        "S": this.getMilliseconds() // 毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
  }




  var nowtime = new Date().Format("yyyy-MM-dd hh:mm:ss");
  var rankcalc = function(ranknum){
    if(4900>ranknum){
      return 'C';
    }else if(4900<=ranknum&&ranknum<6500){
      return 'C+';
    }else if(6500<=ranknum&&ranknum<8200){
      return 'B';
    }else if(8200<=ranknum&&ranknum<10000){
      return 'B+';
    }else if(10000<=ranknum&&ranknum<12100){
      return 'A';
    }else if(12100<=ranknum&&ranknum<14500){
      return 'A+';
    }else if(14500<=ranknum){
      return 'S';
    }
  }
  var rank = rankcalc(obj.status[5])
  var totalStatus = 0
  for(var i = 0; i < 5; i++){
    totalStatus+=obj.status[i]
  }
  console.log(totalStatus)
  var query = `INSERT INTO umasingle (uma_name, uma_speed, uma_stamina, uma_power, uma_grit, uma_intelligence, uma_total, uma_ranknum, uma_rank, uma_sc1, uma_sc2, uma_sc3, uma_sc4, uma_sc5, uma_sc6, uma_scl1, uma_scl2, uma_scl3, uma_scl4, uma_scl5, uma_scl6, uma_wheninsert, uma_user_id, uma_others, uma_skill) 
              VALUES (${obj.id_name}, ${obj.status[0]}, ${obj.status[1]}, ${obj.status[2]}, ${obj.status[3]}, ${obj.status[4]}, ${totalStatus}, ${obj.status[5]}, '${rank}',
              ${obj.cardItem[0].id}, ${obj.cardItem[1].id}, ${obj.cardItem[2].id}, ${obj.cardItem[3].id}, ${obj.cardItem[4].id}, ${obj.cardItem[5].id},
              ${obj.cardItemLV[0]}, ${obj.cardItemLV[1]}, ${obj.cardItemLV[2]}, ${obj.cardItemLV[3]}, ${obj.cardItemLV[4]}, ${obj.cardItemLV[5]}, '${nowtime}', ${obj.userUUID}, '${JSON.stringify(obj.moreinfo)}', '${JSON.stringify(obj.skill)}')`

  console.log(query)
  qurSql(sqlcon,query,res=>{
    console.log(res)
  })
 
  
}




export { 
    updatenewuma
}