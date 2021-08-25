/*
 * @Author: your name
 * @Date: 2021-06-15 17:44:03
 * @LastEditTime: 2021-08-25 13:15:03
 * @LastEditors: Akarichan
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\src\jsfile\api\con2sql.js
 */
var mysql = require('mysql');
var sqlconfig = require('../../../config.json');
//链接数据库-需要密码
var qurSql = async function (sqlcon, myquery, callback) {
    sqlcon = {
        username: sqlconfig.database_account.username,
        userpasswd: sqlconfig.database_account.password,
        database: sqlconfig.sqlcon.database,
    }
    const pool = mysql.createPool({
        host: sqlconfig.sqlcon.sqldomain,
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
    sqlcon = {
        username: sqlconfig.database_account.username,
        userpasswd: sqlconfig.database_account.password,
        database: sqlconfig.sqlcon.database,
    }
    const pool = mysql.createPool({
        host: sqlconfig.sqlcon.sqldomain,
        user: sqlcon.username,
        password: sqlcon.userpasswd,
        database: sqlcon.database,
    });
    // console.log(sqlurl)
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