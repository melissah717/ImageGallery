const mysql = require('mysql2');

const pool = mysql.createPool( {
    host:"localhost",
    user:"atamekitty",
    password:"Wf705401!",
    database:"dessertDB",
    connectionLimit: 50,
    waitForConnections: true,
    debug:false
});

module.exports = pool;