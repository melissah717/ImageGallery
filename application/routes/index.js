var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', {title:"Cakes Gallery"}); // Don't care about the extension
});

router.get('/login',(req, res, next) => {
  res.render("login", {title:"Log In"});
});

router.get('/registration',(req, res, next) => {
  res.render("registration", {title:"Register"});
});

router.get('/postimage',(req, res, next) => {
  res.render("postimage", {title:"Post an Image"});
});

// router.get('/imagepost',(req, res, next) => {
//   res.render("imagepost");
// });

module.exports = router;