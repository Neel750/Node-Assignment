var express = require("express");
var router = express.Router({
  caseSensitive: true,
});
var auth = require('../../utilities/auth');



//  User Login
var userLoginCtrl = require('../controllers/user-management/login');
router.post("/login", function (req, res) {
  return userLoginCtrl.userLogin(req, res);
});

//Get All Users
var getAllUsersCtrl = require('../controllers/user-management/get-all-users');
router.get("/", auth.ensureToken, function (req, res) {
  return getAllUsersCtrl.getAllUsers(req, res);
});

//Get User By Id
var getUserByIdCtrl = require("../controllers/user-management/get-user-by-id");
router.get("/:id", auth.ensureToken, function (req, res) {
  return getUserByIdCtrl.getUserById(req, res);
});

module.exports = router;