var express = require('express'),
    app     = express(),
    usersConstructor = require('./routes/user'),
    users  = new usersConstructor(),
    goalsConstructor = require('./routes/goal'),
    goals = new goalsConstructor();

app.get('/get/user/all', users.getAll);
app.get('/get/user/:id', users.getById);

app.get('/get/goal/user/:id', goals.getAllGoalsForUser);
app.get('/get/goal/goal/:id', goals.getById);


app.listen(3000);

var handleError = function(error) {
    console.log("Error", error);
};
