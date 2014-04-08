var express = require('express'),
    app     = express(),
    usersConstructor = require('./routes/user'),
    users  = new usersConstructor(),
    goalsConstructor = require('./routes/goal'),
    goals = new goalsConstructor();

app.get('/user/all', users.getAll);
app.get('/user/:id', users.getById);

app.get('/goal/user/:id', goals.getAllGoalsForUser);
app.get('/goal/:id', goals.getById);


app.listen(3000);

var handleError = function(error) {
    console.log("Error", error);
};
