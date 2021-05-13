var express = require('express');
var router = express.Router();
var isLoggedIn = require('../middleware/routeprotectors').userIsLoggedIn;
var { getRecentPosts, getPostById, getCommentsByPostId } = require('../middleware/postsmiddleware');
var db = require('../config/database');

/* GET home page. */
router.get('/', getRecentPosts, function (req, res, next) {
  res.render('home');
});

router.get('/login', (req, res, next) => {
  res.render("login");
})

router.get('/registration', (req, res, next) => {
  res.render("registration");
})

router.use("/postimage", isLoggedIn);
router.get('/postimage', (req, res, next) => {
  res.render("postimage", { title: "Post an Image" });
})

router.get('/posts/:id(\\d+)', getPostById, getCommentsByPostId, (req, res, next) => {
  res.render('imagepost', { title: `Post ${req.params.id}` });
});

module.exports = router;
