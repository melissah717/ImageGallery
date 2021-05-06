var express = require('express');
var router = express.Router();
var isLoggedIn = require('../middleware/routeprotectors.js').userIsLoggedIn;

/* GET home page. */

router.get('/',(req, res, next) => {
  res.render('index', {title:"Desserts Gallery"});
});

router.get('/login',(req, res, next) => {
  res.render("login", {title:"Log In"});
});

router.get('/registration',(req, res, next) => {
  res.render("registration", {title:"Register"});
});


router.use('/postimage', isLoggedIn);
router.get('/postimage',(req, res, next) => {
  res.render("postimage", {title:"Post an Image"});
});

// router.get('/imagepost',(req, res, next) => {
//   res.render("imagepost");
// });

module.exports = router;