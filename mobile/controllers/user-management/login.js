var dbConnection = require('../../../utilities/postgresql-connection');
var auth = require('../../../utilities/auth');
var validate = require('validator');
var HttpStatusCode = require("http-status-codes");

exports.userLogin = function (req, res) {
    
    var entityData = {
        Email: req.body.Email,
        Password : req.body.Password
    };
    
    function validateFields(req, res) {
        return new Promise(function (resolve, reject) {
            var isEmailEmpty = validate.isEmpty(req.body.Email);
            if (isEmailEmpty) {
                return reject({
                    status: HttpStatusCode.StatusCodes.BAD_REQUEST,
                    data: req.i18n.__('EmailRequired')
                });
            }
            var isPasswordEmpty = validate.isEmpty(req.body.Password);
            if (isPasswordEmpty) {
                return reject({
                    status: HttpStatusCode.StatusCodes.BAD_REQUEST,
                    data: req.i18n.__('PasswordRequired')
                });
            }
            
            return resolve({
                status: HttpStatusCode.StatusCodes.OK,
                data: entityData
            });
        });
    }

    function userLogin(req, entityData) {
        return new Promise(function (resolve, reject) {
            const sqlQuery = `SELECT * FROM "Assignment2".users u WHERE u."email" = '` + entityData.Email + `' AND u."password" = '` + entityData.Password + `'`;
            dbConnection.getResult(sqlQuery).then(function (response) {
                if (response.data.length > 0) {
                    var json = auth.generateToken(response.data[0]);
                    return resolve({
                        status: json.status,
                        token: json.data,
                        data: response,
                        message: 'User Login successfully!!!'
                    });                    
                } else {
                    return resolve({
                        status: HttpStatusCode.StatusCodes.OK,
                        data: [],
                        message: 'Invalid credentials!!!'
                    });
                }                
            })
            .catch(function (error) {
                res.status(HttpStatusCode.StatusCodes.BAD_REQUEST).json({
                    data: error.data
                });
            });
        });
    }

    validateFields(req, res).then(function (response) {
        userLogin(req, response.data).then(function (response) {
            res.status(response.status).json({
                data: response.token,
                message: response.message
            });
        })
        .catch(function (error) {
            res.status(HttpStatusCode.StatusCodes.BAD_REQUEST).json({
                data: error.data
            });
        });
    })
    .catch(function (error) {
        res.status(HttpStatusCode.StatusCodes.BAD_REQUEST).json({
            data: error.data
        });
    });
    
}