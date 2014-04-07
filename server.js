var express = require('express'),
    app     = express(),
    usersConstructor = require('./routes/user'),
    users  = new usersConstructor();

app.get('/users', users.getAll);
app.get('/users/:id', users.getById);


app.listen(3000);

var handleError = function(error) {
    console.log("Error", error);
};