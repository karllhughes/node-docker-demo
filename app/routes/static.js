const express = require('express');
const router = express.Router();

router.get('/', function(req, res, next) {
  var port = req.app.settings.port;
  res.render('static/home', { title: 'Home', port: port });
});

module.exports = router;
