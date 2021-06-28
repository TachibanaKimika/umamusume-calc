/*
 * @Author: your name
 * @Date: 2021-06-27 14:10:31
 * @LastEditTime: 2021-06-27 15:58:18
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\jsfile\api\regist.js
 */
sha1 = require('js-sha1');
import {qurSql} from './con2sql.js';

var registryAccount = function(acount){

    password = sha1(acount.password)
    qurSql;
}

export{
    registryAccount
}