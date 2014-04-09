var mysql = require('mysql');
var settings = require('../settings/settings.js');
var connection = mysql.createConnection({
        host     : settings.db.host,
        user     : settings.db.user,
        password : settings.db.password,
        database : settings.db.database
});

var Trophies = function() {
    var self = this;

    self.getAllTrophiesForUser = function(req, res) {
        var fkUser = req.params.id;
        connection.query("select * from TrophyToGoal as TTG join Trophies T ON TTG.fkTrophy = T.phTrophy where TTG.fkUser = ?", [fkUser], function(err, result){
            if(err) console.log("Err: " + err);
            res.send(result);
        });
    };

    self.getAllTrophiesForGoal = function(req, res) {
        var fkGoal = req.params.id;
            connection.query("select * from TrophyToGoal as TTG join Trophies T ON TTG.fkTrophy = T.phTrophy where TTG.fkGoal = ?", [fkGoal], function(err, result){
            if(err) console.log("Err: " + err);
            res.send(result);
        });
    };

    self.getAll = function(req, res) {
        connection.query("select * from Trophies", function(err, result) {
            if(err) console.log("Err:" + err);
            res.send(result);
        });
    };
};

module.exports = Trophies;
