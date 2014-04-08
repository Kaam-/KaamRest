var mysql = require('mysql');
var settings = require('../settings/settings.js');
var connection = mysql.createConnection({
        host     : settings.db.host,
        user     : settings.db.user,
        password : settings.db.password,
        database : settings.db.database
});

var Goal = function(){

  var self = this;

  self.getAllGoalsForUser = function (req, res){
      var fkUser = req.params.id;
      connection.query("select * from Goals where fkUser = ?" ,[fkUser], function(err, result){
          if(err) console.log("Error : " + err);
          res.send(result);
      });
  };

  self.getById = function (req, res){
      var pkGoal = req.params.id;
      connection.query("select * from Goals where pkGoal = ?" ,[pkGoal] , function(err, result){
          if(err) console.log("Error : " + err);
          res.send(result);
      });
  };

};

module.exports = Goal;
