var Faker = require('./Faker');
var mysql   = require('mysql'),
    mysqlConnection = mysql.createConnection({
        host     : '206.253.166.168',
        user     : 'remoteKaam',
        password : 'KAAMsuperSecretPassWord',
        database : 'kaam'
    });

mysqlConnection.connect(function(err) {
  // connected! (unless `err` is set)
});


var _insertToDatabase = function(row) {
    var sql = "INSERT INTO Users (FirstName, LastName, AvatarUrl, Username, Password, Email, DateCreated, LastUpdated) VALUES ('" + row.FirstName + "', '" + row.LastName +"', '"+ row.AvatarUrl +"', '" + row.Username +"', '" + row.Password +"', '" + row.Email +"', '" + row.DateCreated +"', '"+ row.LastUpdate +"')";
    mysqlConnection.query(sql, function(err, result) {
       if(err) {
        console.log("error", err);
        } else {
            console.log("result", result);
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

var _generateRandomDateTime = function() {
    var year = _getRandomNumber(2010, 2014);
    var month = _getRandomNumber(0, 11);
    var day = _getRandomNumber(1, 28);
    var hours = _getRandomNumber(0, 23);
    var minutes = _getRandomNumber(0, 59);
    var seconds = 0;
    var milliseconds = 0;

    var date = new Date(year, month, day, hours, minutes, seconds, milliseconds);
    return Math.floor(date.getTime()/1000);
};

var _getRandomNumber = function(start, end) {
    return Math.floor(Math.random() * (end - start)) + start;
};

var _updateDB = function() {

    for (var i = 0; i < 100; i++) {
        var row = new DataRowConstructor();
        row.FirstName = Faker.Name.firstName();
        row.LastName = Faker.Name.lastName();
        row.AvatarUrl = Faker.Internet.domainName();
        row.Username = Faker.PhoneNumber.phoneNumberFormat(0);
        row.Password = Faker.Company.bsNoSpace();
        row.Email = Faker.Internet.email();
        row.DateCreated = _generateRandomDateTime();
        row.LastUpdated = _generateRandomDateTime();

        _insertToDatabase(row);
    }

};

_updateDB();