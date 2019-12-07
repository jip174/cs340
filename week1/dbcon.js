var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_phillij6',
  password        : '7732',
  database        : 'cs340_phillij6'
});

module.exports.pool = pool;
