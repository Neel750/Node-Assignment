const multer  = require('multer');
const config = require('../config')
var storage = multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, config.file.path);
    },
    filename: (req, file, cb) => {
      //console.log(file);
      var filetype = '';
      if(file.mimetype === 'image/gif') {
        filetype = 'gif';
      }
      if(file.mimetype === 'image/png') {
        filetype = 'png';
      }
      if(file.mimetype === 'image/jpeg') {
        filetype = 'jpg';
      }
      cb(null, 'image-' + Date.now() + '.' + filetype);
    }
});
const upload = multer({ storage: storage });

module.exports = upload