var StatusCode = require('http-status-codes');
var dbConnection = require('../../../utilities/postgresql-connection.js');
var settings = require('../../../config.js');
var validate = require('validator');
var HttpStatusCode = require("http-status-codes");
const e = require('express');

exports.getCarById = function (req, res) {
    var entityData = {
        Id: req.params.id
    };

    function validateFields(req, res) {
        return new Promise(function (resolve, reject) {
            var isUserIdEmpty = validate.isEmpty(entityData.Id);
            if (isUserIdEmpty) {
                return resolve({
                    status: HttpStatusCode.StatusCodes.BAD_REQUEST,
                    result: req.i18n.__('CarIdRequired')
                });
                //return res.status(400).send({ result: req.i18n.__('UserIdRequired') });
            }
            
            return resolve({
                status: HttpStatusCode.StatusCodes.OK,
                data: entityData
            });
        });
    }

    function getCarById(req, entityData) {
        return new Promise(function (resolve, reject) {
            const sqlQuery = `SELECT c.id as "Car ID", c."carName" as "Car Name" , m."makeName" as "Make Name", m2."modelName" as "Model Name", array_agg(ci.imagename) as "Image Name" FROM "Assignment2".car c 
            JOIN "Assignment2".make m  ON c.makeid = m.makeid
            JOIN "Assignment2".model m2 ON c.modelid = m2.modelid 
            left join "Assignment2".carimage ci on c.id = ci.carid
            where c.id = `+ entityData.Id +`
            group by c.id, m."makeName", m2."modelName";` ;
            dbConnection.getResult(sqlQuery).then(function (response) {
                if (response.data.length > 0) {
                    if(response.data[0]['Image Name'][0] != null){
                        for (let index = 0; index < response.data[0]['Image Name'].length; index++) {
                            response.data[0]['Image Name'][index] = 'https://localhost:3000/Images' + response.data[0]['Image Name'][index]                              
                        }
                    }
                    return resolve({
                        status: HttpStatusCode.StatusCodes.OK,
                        data: response,
                        message: 'Record found.'
                    });
                } else {
                    return resolve({
                        status: HttpStatusCode.StatusCodes.OK,
                        data: [],
                        message: 'No record found!!!'
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
        getCarById(req, response.data).then(function (response) {
            res.status(response.status).json({
                data: response.data.data,
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