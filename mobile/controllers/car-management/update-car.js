var HttpStatusCode = require("http-status-codes");
var dbConnection = require('../../../utilities/postgresql-connection.js');

exports.updateCar = async function (req, res) {
    var entityData = {
        carId : req.params.id,
        carName: req.body.carname,
        makeName: req.body.makename,
        modelName: req.body.modelname        
    };

    async function checkCar(req,res){
        const sqlQuery = `SELECT c.id FROM "Assignment2".car c
        WHERE c."carName" = '` + entityData.carName + `';`
        await dbConnection.getResult(sqlQuery).then(function(response){
            if(response.data.length > 0){
                entityData['carAlreadyAdded'] = true
            }else{
                entityData['carAlreadyAdded'] = false
            }
        })
    }

    function createModel(req, res) {
        return new Promise(async function (resolve, reject) {
            const sqlQuery = `INSERT INTO "Assignment2".model ("modelName") 
            VALUES('`+ entityData.modelName +`');`
            await dbConnection.getResult(sqlQuery).then(async function (response) {
                if (response.status == HttpStatusCode.StatusCodes.OK) {
                    return resolve({
                        status: HttpStatusCode.StatusCodes.OK,
                        message: 'Record Inserted.'
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

    function createMake(req, res) {
        return new Promise(async function (resolve, reject) {
            const sqlQuery = `INSERT INTO "Assignment2".make ("makeName") 
            VALUES('`+ entityData.makeName +`');`
            await dbConnection.getResult(sqlQuery).then(async function (response) {
                if (response.status == HttpStatusCode.StatusCodes.OK) {
                    return resolve({
                        status: HttpStatusCode.StatusCodes.OK,
                        message: 'Record Inserted.'
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

    async function getMakeId(req,res){
        const sqlQuery = `SELECT m.makeid FROM "Assignment2".make m
        WHERE m."makeName" = '` + entityData.makeName + `';`
        await dbConnection.getResult(sqlQuery).then(function(response){
            if(response.data.length > 0){
                entityData['makeAlready'] = true
                entityData['makeId'] = response.data[0].makeid
                console.log("Make Id: "+ response.data[0].makeid)
            }else{
                entityData['makeAlready'] = false
            }
        })
    }

    async function getModelId(req,res){
        const sqlQuery = `SELECT m.modelid FROM "Assignment2".model m
        WHERE m."modelName" = '` + entityData.modelName + `';`
        await dbConnection.getResult(sqlQuery).then(function(response){
            if(response.data.length > 0){
                entityData['modelAlready'] = true
                entityData['modelId'] = response.data[0].modelid
                console.log("Model Id: "+ response.data[0].modelid)
            }else{
                entityData['modelAlready'] = false
            }
        })
    }
    function validateFields(req, res) {
        return new Promise(async function (resolve, reject) {
            await checkCar(req,res)
            if(entityData.carAlreadyAdded){
                return reject({
                    status: HttpStatusCode.StatusCodes.CONFLICT,
                    data: 'Car Already Added!'
                });    
            }else{
                await getMakeId(req,res)
                await getModelId(req,res)
                if(!entityData.makeAlready){
                    createMake(req,res)
                    await getMakeId(req,res)
                } 
                if(!entityData.modelAlready){
                    createModel(req,res)
                    await getModelId(req,res)
                }
                return resolve({
                    status: HttpStatusCode.StatusCodes.OK,
                    data: entityData
                });
            }
        });
    }
    function updateCar(req, entityData) {
        return new Promise(async function (resolve, reject) {
            const sqlQuery = `UPDATE "Assignment2".car SET "carName" = '`+entityData.carName+`',`+
            `makeid=`+entityData.makeId+`,modelid=`+entityData.modelId + `WHERE id =`+entityData.carId
            await dbConnection.getResult(sqlQuery).then(function (response) {
                if (response.status == HttpStatusCode.StatusCodes.OK) {
                    return resolve({
                        status: HttpStatusCode.StatusCodes.OK,
                        message: 'Record Updated.'
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
            updateCar(req, response.data).then(function (response) {
                res.status(response.status).json({
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