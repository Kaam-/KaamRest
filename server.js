var express = require('express'),
    app     = express(),
    usersConstructor = require('./routes/user'),
    users  = new usersConstructor(),
    goalsConstructor = require('./routes/goal'),
    goals = new goalsConstructor(),
    trophiesConstructor = require('./routes/trophies'),
    trophies = new trophiesConstructor(),
    tasksConstructor = require('./routes/tasks'),
    tasks = new tasksConstructor();


app.get('/user/all', users.getAll);
app.get('/user/:id', users.getById);

app.get('/goal/user/:id', goals.getAllGoalsForUser);
app.get('/goal/:id', goals.getById);

app.get('/trophies', trophies.getAll);
app.get('/trophies/user/:id', trophies.getAllTrophiesForUser);
app.get('/trophies/goal/:id', trophies.getAllTrophiesForGoal);

app.get('/task/user/:id', tasks.getAllByUser);
app.get('/task/:id', tasks.getById);




app.listen(3000);
