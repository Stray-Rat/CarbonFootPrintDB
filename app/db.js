const mysql = require('mysql2');

const pool = mysql.createPool({
  host: 'localhost',
  user: 'testuser',
  password: 'testuser',
  database: 'dbproject',
  connectionLimit: 10 
});

module.exports = pool;