var HttpStatusCode = require("http-status-codes");
var dbConnection = require('../../../utilities/postgresql-connection.js');

exports.getAllCars = function (req, res) {
    var entityData = {};

    function validateFields(req, res) {
        return new Promise(function (resolve, reject) {
            
            return resolve({
                status: HttpStatusCode.StatusCodes.OK,
                data: entityData
            });
        });
    }
    function getAllCars(req, entityData) {
        return new Promise(function (resolve, reject) {
            const sqlQuery = `SELECT c.id as "Car Id", c."carName" as "Car Name", m."makeName" as "Make Name", m2."modelName" as "Model Name", array_agg(ci.imagename) as "Image Name" FROM "Assignment2".car c 
            JOIN "Assignment2".make m  ON c.makeid = m.makeid
            JOIN "Assignment2".model m2 ON c.modelid = m2.modelid 
            left join "Assignment2".carimage ci on c.id = ci.carid 
            group by c.id, m."makeName", m2."modelName";`;
            dbConnection.getResult(sqlQuery).then(function (response) {
                if (response.data.length > 0) {
                    for (let i = 0; i < response.data.length ; i++) {
                        if(response.data[i]['Image Name'][0] != null){
                            for (let index = 0; index < response.data[i]['Image Name'].length; index++) {
                                response.data[i]['Image Name'][index] = 'https://localhost:3000/Images' + response.data[i]['Image Name'][index]                              
                            }
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
                        message: 'No record found.'
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
            getAllCars(req, response.data).then(function (response) {
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