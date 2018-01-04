const express = require('express');
const router = express.Router();

router.get('/', function(req, res, next) {
  res.render('static/home', { title: 'Home' });
});

module.exports = router;
