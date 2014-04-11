var mysql = require('mysql');
var settings = require('../settings/settings.js');
var connection = mysql.createConnection({
        host     : settings.db.host,
        user     : settings.db.user,
        password : settings.db.password,
        database : settings.db.database
});

var Stickers = function() {
    var self = this;

    self.getAll = function(req, res) {
        connection.query("select * from Stickers", function(err, result) {
            if(err) console.log("Err:" + err);
            res.send(result);
        });
    };
};

module.exports = Stickers;
