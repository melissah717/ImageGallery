const mysql = require('mysql2');

const pool = mysql.createPool({
    connectionLimit: 50,
    host: 'localhost',
    user: 'root',
    password: '7054',
    database: 'dessertDB',
    connectionLimit: 50,
    // debug: true,

});

const promisePool = pool.promise();

module.exports = promisePool;