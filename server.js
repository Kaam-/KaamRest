var express = require('express'),
    app     = express(),
    usersConstructor = require('./routes/user'),
    users  = new usersConstructor(),
    goalsConstructor = require('./routes/goal'),
    goals = new goalsConstructor(),
    trophiesConstructor = require('./routes/trophies'),
    trophies = new trophiesConstructor(),
    tasksConstructor = require('./routes/tasks'),
    tasks = new tasksConstructor(),
    commentsConstructor = require('./routes/comments'),
    comments = new commentsConstructor(),
    notesConstructor = require('./routes/notes'),
    notes = new notesConstructor();
    stickersConstructor = require('./routes/stickers'),
    stickers = new stickersConstructor();

app.get('/user/all', users.getAll);
app.get('/user/:id', users.getById);

app.get('/goal/user/:id', goals.getAllGoalsForUser);
app.get('/goal/:id', goals.getById);

app.get('/trophies', trophies.getAll);
app.get('/trophies/user/:id', trophies.getAllTrophiesForUser);
app.get('/trophies/goal/:id', trophies.getAllTrophiesForGoal);

app.get('/task/user/:id', tasks.getAllByUser);
app.get('/task/:id', tasks.getById);

app.get('/comments/all', comments.getAll);
app.get('/comments/:id', comments.getById);

app.get('/note/user/:id', notes.getAllGoalsForUser);
app.get('/note/:id', notes.getById);

app.get('/sticker/all', stickers.getAll);

app.listen(3000);
