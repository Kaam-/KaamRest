var mysql = require('mysql');
var settings = require('../settings/settings.js');
var connection = mysql.createConnection({
        host     : settings.db.host,
        user     : settings.db.user,
        password : settings.db.password,
        database : settings.db.database
});

var Comment = function(){

  var self = this;

  self.getAll = function (req, res){
      connection.query("select * from Comments" , function(err, result){
          if(err) console.log("Error : " + err);
          res.send(result);
      });
  };

  self.getById = function (req, res){
      var pkComment = req.params.id;
      connection.query("select * from Comments where pkComment = ?" ,[pkComment] , function(err, result){
          if(err) console.log("Error : " + err);
          res.send(result);
      });
  };

};

module.exports = Comment;
