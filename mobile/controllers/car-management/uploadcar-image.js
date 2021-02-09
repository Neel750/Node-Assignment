var HttpStatusCode = require("http-status-codes");
var dbConnection = require('../../../utilities/postgresql-connection.js');
const upload = require('../../../middleware/uploadfile')

exports.uploadCarImage = async function (req, res, next) {
    var entityData = {
        id: req.params.id
    };

    function uploadCarImage(req, res) {
        console.log("In uploadcarimage")
        return new Promise(async function (resolve, reject) {
            const sqlQuery = `INSERT INTO "Assignment2".carimage (carid,imagename,createddate) 
            VALUES(`+ entityData.id +`,'`+ req.file.filename +`','`+new Date().toISOString()+`')`;
            await dbConnection.getResult(sqlQuery).then(function (response) {
                if (response.status == HttpStatusCode.StatusCodes.OK) {
                    return resolve({
                        status: HttpStatusCode.StatusCodes.OK,
                        message: 'Image uploaded.'
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
    uploadCarImage(req, res).then(function (response) {
        console.log("After DB operations")
        res.status(response.status).json({
            message: response.message
        });
    })
    .catch(function (error) {
        res.status(error.status).json({
            data: error.data
        });
    });
}