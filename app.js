var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan')
var HttpStatusCode = require("http-status-codes");
var i18n = require('i18n-2');
var lcid = require('lcid');

var apiMobileUserManagementRouter = require('./mobile/routes/user-management');
var apiMobileCarManagementRouter = require('./mobile/routes/car-management');
var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

i18n.expressBind(app, {
    locales: ['en-us', 'sv-se','da-dk'],
    extension: ".json",
    defaultLocale: 'en-us'
});

app.use(function(req, res, next) {
    var lang = 1053;
    var file = '';
    if (req.headers['accept-language'] == 1033) {
        lang = 1033;
    }else if (req.headers['accept-language'] == 1030) {
        lang = 1030;
    }
    file = lcid.from(lang);
    file = file.replace('_', '-').toLowerCase();
    req.i18n.setLocale(file);
    next();
});

app.use('/users', apiMobileUserManagementRouter);
app.use('/cars', apiMobileCarManagementRouter)
app.use(function(req, res, next) {
  next(createError(HttpStatusCode.StatusCodes.NOT_FOUND));
});

app.use(function(err, req, res, next) {
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};
  const status = err.status || HttpStatusCode.StatusCodes.INTERNAL_SERVER_ERROR;
  res.status(status);
  res.render('error');
});

module.exports = app;