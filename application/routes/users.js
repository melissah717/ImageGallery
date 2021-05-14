var express = require('express');
var router = express.Router();
const UserModel = require('../models/Users');
const { successPrint, errorPrint } = require('../helpers/debug/debugprinters');
const { check, validationResult } = require('express-validator');
const UserError = require("../helpers/error/UserError");

router.post('/register', [
  check('username').custom(async (username) => {
    const usernameRegex = new RegExp("^[a-zA-z]");
    if (!(usernameRegex.test(username))) {
      throw new Error('Username must begin with a letter of the alphabet');
    }
  }),
  check('username').isLength({ min: 3 }),
  check('email').isEmail(),
  check('password').custom(async (password) => {
    const passRegex = new RegExp("^(?=.*[A-Z])(?=.*[0-9])(?=.*[/*\-+!@#$^&()])");
    if (!(passRegex.test(password))) {
      throw new Error('Password is too weak');
    }
  }),
  check('cpassword').custom(async (cpassword, { req }) => {
    const password = req.body.password

    if (password != cpassword) {
      throw new Error('Passwords must match')
    }
  })
], (req, res, next) => {
  let username = req.body.username;
  let email = req.body.email;
  let password = req.body.password;

  var errors = validationResult(req);

  if (!errors.isEmpty()) {
    console.log({ errors: errors.array() });
    res.redirect('/registration');
    req.flash('error', 'Registration failed!');
  } else {

    UserModel.usernameExists(username)
      .then((userDoesNameExist) => {
        if (userDoesNameExist) {
          throw new UserError(
            "Registration Failed: Username already exists",
            "/registration",
            200
          );
        } else {
          return UserModel.emailExists(email);
        }
      })
      .then((emailDoesExist) => {
        if (emailDoesExist) {
          throw new UserError(
            "Registration Failed: Email already exists",
            "/registration",
            200
          );
        } else {
          return UserModel.create(username, password, email);
        }
      })
      .then((createdUserId) => {
        if (createdUserId < 0) {
          throw new UserError(
            "Server Error, user could not be created",
            "/registration",
            500
          );
        } else {
          successPrint("User was created");
          res.redirect('/login');
          req.flash('success', 'User account has been made!');
        }
      })
      .catch((err) => {
        errorPrint("User not created");
        if (err instanceof UserError) {
          errorPrint(err.getMessage());
          res.redirect(err.getRedirectURL());
          req.flash('error', err.getMessage());
          res.status(err.getStatus());
        } else {
          next(err);
        }
      });
  }
});

router.post('/login', [
  check('username').notEmpty(),
  check('password').notEmpty()
], (req, res, next) => {
  let username = req.body.username;
  let password = req.body.password;

  var errors = validationResult(req);

  if (!errors.isEmpty()) {
    console.log({ errors: errors.array() });
    res.redirect('/login');
    req.flash('error', 'login failed');
  } else {
    UserModel.authenticate(username, password)
      .then((loggedUserId) => {
        if (loggedUserId > 0) {
          successPrint(`User ${username} is logged in`);
          req.session.username = username;
          req.session.userId = loggedUserId;
          console.log("this is the id "  + req.session.userId);
          res.locals.logged = true;
          req.flash('success', 'You have successfully logged in');
          res.render("home");
        } else {
          throw new UserError("Invalid username and/or password", "/login", 200);
        }
      })
      .catch((err) => {
        errorPrint("user login failed");
        if (err instanceof UserError) {
          errorPrint(err.getMessage());
          req.flash('error', err.getMessage());
          res.redirect('/login');
          res.status(err.getStatus());
        } else {
          next(err);
        }
      })
 }
});

router.post('/logout', (req, res, next) => {
  req.session.destroy((err) => {
    if (err) {
      errorPrint('session could not be destroyed');
      next(err);
    } else {
      successPrint('session destroyed');
      res.clearCookie('csid');
      res.json({ status: "OK", message: "User is logged out" });
    }
  })
});

module.exports = router;
