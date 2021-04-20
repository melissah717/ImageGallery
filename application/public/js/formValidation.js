var requirements = [false, false, false, false, false, false];

var username = document.getElementById("username");
username.onchange = function () {
    let userReq1 = document.getElementById('user-req1');
    let userReq2 = document.getElementById('user-req2');
    let userInput = username.value;
    const usernameRegex = new RegExp(/^[a-zA-z]/);

    if (usernameRegex.test(userInput)) { 
        userReq1.style = "color: green";
        requirements[0] = true;
    } else {
        userReq1.style = "color: red";
        requirements[0] = false;
    }

    if (userInput.length >= 3) {
        userReq2.style = "color: green";
        requirements[1] = true;
    } else {
        userReq2.style = "color: red";
        requirements[1] = false;
    }
}

let email = document.getElementById("email");
email.onchange = function () {
    let emailInput = email.value;
    let emailReq = document.getElementById('email-req');
    const emailRegex = new RegExp(/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/);

    if (emailRegex.test(emailInput)) {
        emailReq.style = "color: green";
        requirements[2] = true;
    } else {
        emailReq.style = "color: red)";
        requirements[2] = false;
    }
}

let password = document.getElementById("password");
password.onchange = function () {
    let passReq1 = document.getElementById('pass-req1');
    let passReq2 = document.getElementById('pass-req2');
    let passInput = password.value;
    const passRegex = new RegExp(/^(?=.*[A-Z])(?=.*[0-9])(?=.*[/*\-+!@#$^&()])/);
    if (passInput.length >= 8) {
        passReq1.style = "color: green";
        requirements[3] = true;
    } else {
        passReq1.style = "color: red";
        requirements[3] = false;
    }

    if (passRegex.test(passInput)) {
        passReq2.style = "color: green";
        requirements[4] = true;
    } else {
        passReq2.style = "color: red";
        requirements[4] = false;
    }
}

let passwordConfirm = document.getElementById("confirm-pass");
passwordConfirm.onchange = function () {
    let cPassReq = document.getElementById('confirm-pass-req');
    let passInput = password.value;
    let cPassInput = passwordConfirm.value;
    if (passInput == cPassInput) {
        cPassReq.style = "color: green";
        requirements[5] = true;
    } else {
        cPassReq.style = "color: red";
        requirements[5] = false;
    }
}

function isTrue(bool) {
    return bool;
}

let registerButton = document.getElementById('register-button');
registerButton.onclick = function () {
    if (requirements.every(isTrue)) {
        return true;
    } else {
        alert('Please fulfill all requirements.')
        return false;
    }
}
