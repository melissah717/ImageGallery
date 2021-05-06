var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var sessions = require('express-session');
var mysqlSession = require('express-mysql-session')(sessions);
var flash = require('express-flash');

var handlebars = require('express-handlebars');
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
//var usersRouter = require('./routes/dbtest');
var dbRouter = require('./routes/dbtest');

var errorPrint = require('./helpers/debug/debugprinters').errorPrint;
var requestPrint = require('./helpers/debug/debugprinters').requestPrint;
var app = express();

app.engine(
    "hbs", 
    handlebars({
        layoutsDir: path.join(__dirname, "views/layouts"),
        partialsDir: path.join(__dirname, "views/partials"),
        extname: ".hbs",
        defaultLayout: "home",
        helpers: {
            emptyObject: (obj) => {
                return !(obj.constructor === Object && Object.keys(obj).length == 0)
            }
        },
    })
);

var mysqlSessionStore = new mysqlSession({
    /**using default options */
    },
    require('./config/database')
);

app.use(sessions({
    key: "csid",
    secret: "meow",
    store: mysqlSessionStore,
    resave: false, 
    saveUninitialized: false
}));

app.use(flash());
app.set("view engine", "hbs");
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use("/public", express.static(path.join(__dirname, 'public')));


app.use((req, res, next) => {
    requestPrint(req.url);
    next(); //safe for middleware functions
});

app.use((req, res, next) => {
    console.log(req.session);
    if(req.session.username){
        res.locals.logged = true;
    }
    next();
});

app.use('/', indexRouter);
//app.use('/dbtest', dbRouter);
app.use('/users', usersRouter);  

app.use((err, req, res, next) => {
    console.log(err);
    res.render('error', {err_message: err});
}); //error middleware because 4 parameters and first is err

module.exports = app;
