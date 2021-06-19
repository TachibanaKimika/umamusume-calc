var mysql = require('mysql');

//链接数据库-需要密码
var qurSql = async function(sqlcon,myquery,callback){
    const pool = mysql.createPool({
        host:    'rm-bp1id4y905ysrz6pvjo.mysql.rds.aliyuncs.com',
        user:    sqlcon.username,
        password:sqlcon.userpasswd,
        database:sqlcon.database,
    });

    await pool.getConnection(function(err,connection){
        connection.query(myquery,(err,response,fieleds) => {
            return callback(response);
        })
    })
}

var qurSqlPromise = function(sqlcon,myquery){
    const pool = mysql.createPool({
        host:    'rm-bp1id4y905ysrz6pvjo.mysql.rds.aliyuncs.com',
        user:    sqlcon.username,
        password:sqlcon.userpasswd,
        database:sqlcon.database,
    });

    // pool.getConnection(function(err,connection){
    //     connection.query(myquery,(err,response,fieleds) => {
    //         resolve(response);
    //     })
    // })
    return new Promise((resolve)=>{
        pool.getConnection(function(err,connection){
            connection.query(myquery,(err,response,fieleds) => {
                resolve(response);
            })
        })
    })
}


export{
    qurSql,
    qurSqlPromise
}