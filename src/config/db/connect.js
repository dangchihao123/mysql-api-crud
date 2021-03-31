// ta import cái module mysql
var mysql = require('mysql');
var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'abc'
});
db.connect(function(err) {
    if (err) throw err;
    console.log('Da ket noi database');
});
// export ra để các module có thể import và sử dụng
module.exports = db;