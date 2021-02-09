var StatusCode = require('http-status-codes');
var dbConnection = require('../../../utilities/postgresql-connection.js');
var settings = require('../../../config.js');
var validate = require('validator');
var HttpStatusCode = require("http-status-codes");
const e = require('express');

exports.deleteCar = function (req, res) {
    var entityData = {
        Id: req.params.id
    };

    function validateFields(req, res) {
        return new Promise(function (resolve, reject) {
            var isIdEmpty = validate.isEmpty(entityData.Id);
            if (isIdEmpty) {
                return resolve({
                    status: HttpStatusCode.StatusCodes.BAD_REQUEST,
                    result: req.i18n.__('CarIdRequired')
                });
            }
            
            return resolve({
                status: HttpStatusCode.StatusCodes.OK,
                data: entityData
            });
        });
    }

    function deleteCar(req, entityData) {
        return new Promise(function (resolve, reject) {
            const sqlQuery = `delete from "Assignment2".car where id = `+ entityData.Id 
            dbConnection.getResult(sqlQuery).then(function (response) {
                if (response.status == HttpStatusCode.StatusCodes.OK) {
                    return resolve({
                        status: HttpStatusCode.StatusCodes.OK,
                        message: 'Record Deleted.'
                    });
                }                
            })
            .catch(function (error) {
                res.status(error.status).json({
                    data: error.data
                });
            });
        });
    }

    validateFields(req, res).then(function (response) {
        deleteCar(req, response.data).then(function (response) {
            res.status(response.status).json({
                data: response.data,
                message: response.message
            });
        })
        .catch(function (error) {
            res.status(error.status).json({
                data: error.data
            });
        });
    })
    .catch(function (error) {
        res.status(error.status).json({
            data: error.data
        });
    });
    
}