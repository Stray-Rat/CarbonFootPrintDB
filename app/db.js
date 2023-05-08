const mysql = require('mysql2');

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'cs157a',
  database: 'dbproject',
  connectionLimit: 10 
});

module.exports = pool;