var mysql = require('mysql');
var settings = require('../settings/settings.js');
var connection = mysql.createConnection({
        host     : settings.db.host,
        user     : settings.db.user,
        password : settings.db.password,
        database : settings.db.database
});

var User = function() {
    var self = this;

    self.getAll = function(req, res) {
        connection.query("select * from Users", function (err, result) {
            if(err) console.log("err", err);
            res.send(result);
        });

    };

    self.getById = function(req, res) {
        connection.query("select * from Users where pkUser = " + req.params.id, function(err, result){
            if(err){console.log("Err: " + err);}
            res.send(result);
        });
    };
}

module.exports = User;
