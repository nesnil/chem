//获取input框内的切换图片id和input文本框的id
var demoImg = document.getElementById("showText");
var demoInput = document.getElementById("password");
function hideShowPsw() {
    if (demoInput.type == "password") {
        demoInput.type = "text";
        demoImg.src ="images/showPasswd.png";
    } else {
        demoInput.type = "password";
        demoImg.src = "images/hidePasswd.png";
    }
}


//获取input框内的切换图片id和input文本框的id注册
//获取input框内的切换图片id和input文本框的id注册
var loginImg = document.getElementById("loginShowText");
var loginInput = document.getElementById("loginPassword");
function loginShowPsw() {
    if (loginInput.type == "password") {
        loginInput.type = "text";
        loginImg.src ="images/loginshow.jpg";
    } else {
        loginInput.type = "password";
        loginImg.src = "images/loginhide.jpg";
    }
}

$("#form-login").click(function(){
    $("#register-k").hide().removeClass("in");
    $(".modal-backdrop.fade.in").css('opacity','0');
});
$("#registersubmit").click(function(){
    $("#myModal").hide().removeClass("in");
    $(".modal-backdrop.fade.in").css('opacity','0');
});
