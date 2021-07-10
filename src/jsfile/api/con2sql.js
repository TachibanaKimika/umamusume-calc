/*
 * @Author: your name
 * @Date: 2021-06-15 17:44:03
 * @LastEditTime: 2021-07-11 02:09:19
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\jsfile\api\con2sql.js
 */
var mysql = require('mysql');
var sqlurl = require('../../../package.json').config.sqldomain;
//链接数据库-需要密码
var qurSql = async function (sqlcon, myquery, callback) {
    const pool = mysql.createPool({
        host: sqlurl,
        user: sqlcon.username,
        password: sqlcon.userpasswd,
        database: sqlcon.database,
    });

    await pool.getConnection(function (err, connection) {
        connection.query(myquery, (err, response, fieleds) => {
            return callback(response);
        })
    })
}

var qurSqlPromise = function (sqlcon, myquery) {
    const pool = mysql.createPool({
        host: sqlurl,
        user: sqlcon.username,
        password: sqlcon.userpasswd,
        database: sqlcon.database,
    });
    console.log(sqlurl)
    // pool.getConnection(function(err,connection){
    //     connection.query(myquery,(err,response,fieleds) => {
    //         resolve(response);
    //     })
    // })
    return new Promise((resolve) => {
        pool.getConnection(function (err, connection) {
            connection.query(myquery, (err, response, fieleds) => {
                resolve(response);
            })
        })
    })
}


export {
    qurSql,
    qurSqlPromise
}