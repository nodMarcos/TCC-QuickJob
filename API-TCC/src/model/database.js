module.exports = app =>{
    const host = "localhost"
    const user = "root"
    const senha = "usbw"
    const db = "db_quickjob"
    const port = 3307
    const mysql = require("mysql")

    var conn = mysql.createPool({
        host: host,
        user: user,
        password: senha,
        database: db,
        port: port,
        connectionLimit: 10

    })
    conn.getConnection(function(err,conn){
        if(err)
        return 400;
    });

    return conn;
};