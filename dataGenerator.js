var Faker = require('./Faker');
var mysql   = require('mysql'),
    settings = require('./settings/settings'),
    mysqlConnection = mysql.createConnection({
        host     : settings.db.host,
        user     : settings.db.user,
        password : settings.db.password,
        database : settings.db.database
    });


var _insertToDatabase = function(row, queryNumber, callback) {
    var sql = "INSERT INTO Users (FirstName, LastName, AvatarUrl, Username, Password, Email, DateCreated, LastUpdated) VALUES ('" + row.FirstName + "', '" + row.LastName +"', '"+ row.AvatarUrl +"', '" + row.Username +"', '" + row.Password +"', '" + row.Email +"', '" + row.DateCreated +"', '"+ row.LastUpdated +"')";
    mysqlConnection.query(sql, function(err, result) {
       if(err) {
        console.log("error", err);
        } else {
            console.log("result", result);
            callback(queryNumber);
        }

    });
};

var _insertToGoalsTable = function(row, queryNumber, callback){
    var sql = "INSERT INTO Goals (fkUser, Name, DateCreated, EndDate, DateCompleted, GroupGoal, EventOrTime, NumOfSubTasks, CompletedTasks, IncompleteTasks, Stars, NumOfEvents, LastUpdated) VALUES ('"
       + row.fkUser + "', '" + row.Name + "', '" + row.DateCreated + "', '" + row.EndDate + "', '" + row.DateCompleted + "', '" + row.GroupGoal + "', '"
      + row.EventOrTime + "', '" + row.NumOfSubTasks + "', '" + row.CompletedTasks + "', '" + row.IncompleteTasks + "', '" + row.Stars + "', '" + row.NumOfEvents + "', '" + row.LastUpdated + "')";
      mysqlConnection.query(sql, function(err, result) {
         if(err) {
          console.log("error", err);
          } else {
              console.log("result", result);
              callback(queryNumber);
          }

      });
};

var DataRowConstructor = function() {
    return {
        FirstName : null,
        LastName : null,
        AvatarUrl : null,
        Username : null,
        Password : null,
        Email : null,
        DateCreated : null,
        LastUpdated : null,
    };
};

var GoalRowConstructor = function(){
    return {
        fkUser : null,
        Name : null,
        DateCreated : null,
        EndDate : null,
        DateCompleted : null,
        GroupGoal : null,
        EventOrTime : null,
        NumOfSubTasks : null,
        CompletedTasks : null,
        IncompleteTasks : null,
        Stars : null,
        NumOfEvents : null,
        LastUpdated : null
    };
};

var _generateRandomDateTime = function() {
    var year = _getRandomNumber(2010, 2014);
    var month = _getRandomNumber(0, 11);
    var day = _getRandomNumber(1, 28);
    var hours = _getRandomNumber(0, 23);
    var minutes = _getRandomNumber(0, 59);
    var seconds = 0;
    var milliseconds = 0;

    var date = new Date(year, month, day, hours, minutes, seconds, milliseconds);
    var myDate_string = date.toISOString();

    myDate_string = myDate_string.replace("T"," ");
    myDate_string = myDate_string.substring(0, myDate_string.length - 5);
    return myDate_string;
};

var _getRandomNumber = function(start, end) {
    return Math.floor(Math.random() * (end - start)) + start;
};

var _updateDB = function() {

    for (var i = 0; i < 300; i++) {
        var row = new DataRowConstructor();
        row.FirstName = Faker.Name.firstName();
        row.LastName = Faker.Name.lastName();
        row.AvatarUrl = Faker.Internet.domainName();
        row.Username = Faker.PhoneNumber.phoneNumberFormat(0);
        row.Password = Faker.Company.bsNoSpace();
        row.Email = Faker.Internet.email();
        row.DateCreated = _generateRandomDateTime();
        row.LastUpdated = _generateRandomDateTime();
        /*_insertToDatabase(row, i, function(queryNumber) {
            if(queryNumber >= 299) {
                process.exit();
            }
        });*/

    }

};

var _createGoals = function() {
    for(var i = 0; i < 500; i++){
        var row = new GoalRowConstructor();
        row.fkUser = _getRandomNumber(0, 300);
        row.Name = Faker.Lorem.words();
        row.DateCreated = _generateRandomDateTime();
        row.EndDate = _generateRandomDateTime();
        row.DateCompleted = _generateRandomDateTime();
        row.GroupGoal = _getRandomNumber(0, 1);
        row.EventOrTime = _getRandomNumber(0, 1);
        row.NumOfSubTasks = _getRandomNumber(1, 15);
        row.CompletedTasks = _getRandomNumber(1, 10);
        row.IncompleteTasks = _getRandomNumber(1, 5);
        row.Stars = _getRandomNumber(1, 10);
        row.NumOfEvents = _getRandomNumber(1, 5);
        row.LastUpdated = _generateRandomDateTime();
        _insertToGoalsTable(row, i , function(queryNumber){
            if(queryNumber >= 499){
                process.exit();
            }
        });
    }
};

_updateDB();
_createGoals();
