var express = require("express");
var router = express.Router({
  caseSensitive: true,
});
var auth = require('../../utilities/auth');
const upload = require('../../middleware/uploadfile')

//Get All Cars
var getAllCarsCtrl = require('../controllers/car-management/get-all-cars');
router.get("/", auth.ensureToken, function (req, res) {
  return getAllCarsCtrl.getAllCars(req, res);
});

//Get User By Id
var getCarByIdCtrl = require("../controllers/car-management/get-car-by-id");
router.get("/:id", auth.ensureToken, function (req, res) {
  return getCarByIdCtrl.getCarById(req, res);
});

//Create New Car
var createCarCtrl = require('../controllers/car-management/create-car')
router.post("/", auth.ensureToken, function(req,res){
  return createCarCtrl.createCar(req,res);
});

//Update Car
var updateCarCtrl = require('../controllers/car-management/update-car')
router.put("/:id", auth.ensureToken, function(req,res){
  return updateCarCtrl.updateCar(req,res);
});

//Delete Car
var deleteCarCtrl = require('../controllers/car-management/delete-car')
router.delete("/:id", auth.ensureToken, function(req,res){
  return deleteCarCtrl.deleteCar(req,res);
});

//Upload New Car Image
var uploadCarImageCtrl = require('../controllers/car-management/uploadcar-image')
router.post("/:id", upload.single('carimage'), function(req,res,next){
  return uploadCarImageCtrl.uploadCarImage(req,res,next);
});

module.exports = router;