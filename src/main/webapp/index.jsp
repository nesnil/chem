<%@ page import="com.pojo.Dict" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    pageContext.setAttribute("path", request.getContextPath());
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    pageContext.setAttribute("basePath", basePath);
    ServletContext sc = request.getServletContext();
    List<Dict> crTypes = (List<Dict>)sc.getAttribute("crTypes");

    String username = "";
    User user = (User) session.getAttribute("UserInfo");
    if(user!=null){
        username = user.getUsername();
        pageContext.setAttribute("username",username);
    }

    String loginInfo = (String) session.getAttribute("LoginInfo");
    if(loginInfo!=null){
        pageContext.setAttribute("loginInfo", loginInfo);
    }
    session.removeAttribute("LoginInfo");
//    if(crTypes!=null) {
//        crTypes.forEach(type -> {
//            System.out.println(type.getDicValue());
//        });
//    }
%>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="utf-8">
  	<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimum-scale=1,maximum-scale=1">
    <title>化学救援助理</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="${basePath}images/favicon.ico">
    <link rel="stylesheet" href="${basePath}css/bootstrap.min.css">
    <link rel="stylesheet" href="${basePath}css/index.css">
    <script src="${basePath}js/jquery.min.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}js/svg-inject.min.js"></script>
    <script>
        SVGInject(document.querySelectorAll("img.injectable"));
    </script>
</head>
<body onload="wonload()">
<section class="header">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-xs-8 col-sm-8">
                <img alt="" src="${basePath}images/2.png" class="img-responsive img-title">
            </div>
            <div class="col-lg-4 col-md-4 col-xs-4  col-sm-4 right-login">
                <div class="register-font sn-login-info">
                    <c:choose>
                        <c:when test="${empty username}">
                            <a href="" class="sn-login" data-toggle="modal" data-target="#myModal"><img alt="" src="${basePath}images/3.png" >登录 /</a>
                            <!--<a href="" class="sn-register" data-toggle="modal" data-target="#register-k">注册</a>-->
                            <a href="" class="sn-register" onclick="javascript:alert('目前暂未开放在线注册功能，请联系客服！')">注册</a>
                        </c:when>
                        <c:otherwise>
                            <a href="" class="sn-login" title="修改密码"  data-toggle="modal" data-target="#change-pw"><img alt="" src="${basePath}images/3.png" >${username} / </a>
                            <a href="${basePath}user/logout" class="sn-register" >退出</a>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="register-back">
                    <a href="" class="sn-login sn-login-back" data-toggle="modal" data-target="#myModal"><img alt="" src="${basePath}images/3.png" >123</a>
                    <a href="">设置</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="${basePath}">退出</a>
                </div>
            </div>

            <div class="clearfix"></div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 form-search">
                    <form id="searchForm" method="post" action="${basePath}chem/qryChem">
                        <fieldset class="row">
                            <div id="searchInContainer">
                                <div class="col-sm-3 col-xs-4">
                                <input type="radio" name="type" value="" id="iptTypeAll" checked />
                                <label for="iptTypeAll" id="lbTypeAll">全部</label>
                                </div>
                                <c:forEach var="types" items="${crTypes}" varStatus="status">
                                    <div class="col-sm-3 col-xs-4">
                                        <input type="radio" name="type" value="${types.dicCode}" id="iptType${types.dicCode}" />
                                        <label for="iptType${types.dicCode}">${types.dicValue}</label>
                                    </div>
                                </c:forEach>
                            </div>
                          <div class="clearfix"></div>
                            <div class="submit-search">
                                <input id="s" name="keywords" type="text" placeholder="CAS号 或 关键词"/>
                                <span  class="glyphicon glyphicon-search"></span><input type="submit" value="搜    索" id="submitButton" />
                            </div>
                        </fieldset>
                        <input type="hidden" name="pageNum" value="1" />
                    </form>
                </div>
            </div>
        </div>
    </div>

</section>
<footer>
    <div class="container footer" >
        <div class="row">
            <div class="col-lg-8 col-md-8 col-xs-12  col-sm-6 contact">
                <h2>安职健(上海)科技有限公司</h2>
                <p><span class="glyphicon glyphicon-map-marker"></span>上海市黄浦区北京东路668号科技京城西楼12C</p>
                <p><span class="glyphicon glyphicon-earphone"></span>王老师-13801845679</p>
                <p><span class="glyphicon glyphicon-envelope"></span>13801845679@139.com</p>
            </div>
            <div class="col-lg-4 col-md-4 col-xs-12   col-sm-6 contact-right">
                <div class="ico-footer">
                    <img alt="" src="${basePath}images/QQ.svg" class="img-circle qq" >
                    <img alt="" src="${basePath}images/emial.svg" class="img-circle qq">
                </div>
                <!--<p>Copyright 2020 XXXXXXXXXX   All Right Reserved</p>
                <p><a href="http://beian.miit.gov.cn/" title="">沪ICP 备 0000000号</a></p>
                -->
                <p><span style="color:grey;">中国职业安全健康协会化工职业安全健康专业委员会监制</span></p>
            </div>
        </div>
    </div>
</footer>
<!--登入框-->
<div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content login">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">用户登录</h4>
            </div>
            <div class="modal-body login-form">
                <form name="formLogin" action="${basePath}user/login" method="post" onsubmit="">
                    <div class="form">
                        <div class="item item-name">
                            <input type="text" id="username" name="username" class="text" tabindex="1"  required="required" placeholder="用户名">
                        </div>
                        <div class="item item-password">
                            <input type="password" id="password" name="password"  required="required" class="text" tabindex="2" placeholder="密码">
                            <span class="password-show">
                                       <img id="showText" onclick="hideShowPsw()" src="${basePath}images/hidePasswd.png">
                                   </span>
                            <a href="" title="">忘记密码？</a>
                        </div>

                        <div class="login-btn">
                            <input type="submit" name="submit" class="btn-img btn-entry" id="loginsubmit" value="登    录">
                        </div>

                        <div class="register-border text-center">还没有账号</div>
                        <div class="login-btn register-btn">
                            <input type="button" class="btn-img register-entry" id="registersubmit" value="注    册" data-toggle="modal" data-target="#register-k">
                        </div>
                    </div>
                </form>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!--end-->

<div class="modal fade" id="register-k" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content login">
            <div class="modal-header">
                <h4 class="modal-title" id="register-title">注册 <span>已有账号？</span><a href="" data-toggle="modal" data-target="#myModal" id="form-login">登录</a></h4>
            </div>
            <div class="modal-body login-form">
                <form name="formLogin" action="${basePath}user/addUser" method="post" onsubmit="">
                    <div class="form">
                        <div class="msg-wrap">
                            <div class="msg-error">
                                <i class="msg-icon"></i><span id="msg-error-text" class="msg-error-text"></span>
                            </div>
                        </div>
                        <div class="item item-name">
                            <input type="text" id="uptUsername" name="username" class="text" tabindex="1"  required="required" placeholder="用户名" autocomplete="new-password">
                        </div>
                        <div class="item item-name">
                            <input type="text" id="iptCpName" name="cpName" class="text" tabindex="1"  required="required" placeholder="联系人姓名" autocomplete="new-password">
                        </div>
                        <div class="item item-name">
                            <input type="text" id="iptCpPhone" name="cpPhone" class="text" tabindex="1"  required="required" placeholder="联系人手机号" autocomplete="new-password">
                        </div>
                        <!--
                        <div class="item item-name tel-code">
                            <input type="text" id="tel-yz" name="tel" class="text" tabindex="1"  required="required" placeholder="请输入手机验证码">
                            <a href="javascript:" class="code-btn fl codeObtain" id="mblLink" onclick="">获取验证码</a>
                        </div>
                        -->
                        <div class="item item-password">
                            <input type="password" id="loginPassword" name="password" required="required" class="text" tabindex="2" placeholder="密码" autocomplete="new-password">
                            <span class="password-show login-show">
                                       <img id="loginShowText" onclick="loginShowPsw()" src="${basePath}images/loginhide.jpg">
                                   </span>
                        </div>
                        <div class="login-btn register-btn">
                            <input type="submit" name="submit" class="btn-img register-entry" id="registersubmit2" value="注    册">
                        </div>
                    </div>
                </form>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
    <!--end-->
</div>

<div class="modal fade" id="change-pw" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content login">
            <div class="modal-header">
                <h4 class="modal-title" id="change-pw-title">修改密码</h4>
            </div>
            <div class="modal-body login-form">
                <form name="formLogin" action="${basePath}user/changepw" method="post" onsubmit="">
                    <div class="form">
                        <div class="msg-wrap">
                            <div class="msg-error">
                                <i class="msg-icon"></i><span id="change-pw-msg-error-text" class="msg-error-text"></span>
                            </div>
                        </div>
                        <div class="item item-password">
                            <input type="password" id="iptOPassword" name="opassword" class="text" tabindex="1"  required="required" placeholder="原密码" autocomplete="new-password">
                        </div>
                        <div class="item item-password">
                            <input type="password" id="iptNPassword1" name="npassword1" class="text" tabindex="1"  required="required" placeholder="新密码" >
                        </div>
                        <div class="item item-password">
                            <input type="password" id="iptNPassword2" name="npassword2" class="text" tabindex="1"  required="required" placeholder="再次输入新密码" >
                        </div>
                        <div class="login-btn register-btn">
                            <input type="submit" name="submit" class="btn-img register-entry" id="changepwsubmit" value="修改密码">
                        </div>
                    </div>
                </form>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
    <!--end-->
</div>

<script src="${basePath}js/bootstrap.min.js"></script>
<script src="${basePath}js/index.js"></script>

<script>
    function wonload() {
    <c:choose>
        <c:when test="${loginInfo == 'PasswordOrUsernameError'}">
        alert("用户名或密码错误！");
        </c:when>
        <c:when test="${loginInfo == 'UserStatusError'}">
        alert("此用户尚未开通或状态异常，请联系客服！");
        </c:when>
        <c:when test="${loginInfo == 'UsernameExist'}">
        alert("用户名已存在！");
        </c:when>
        <c:when test="${loginInfo == 'UserRegError'}">
        alert("用户注册异常，请联系客服！");
        </c:when>
        <c:when test="${loginInfo == 'UserRegSuccess'}">
        alert("用户注册成功，但您的用户尚处于不可用状态，请联系客服开通服务！");
        </c:when>
        <c:when test="${loginInfo == 'PasswordIsEmpty'}">
        alert("请完整输入密码！");
        </c:when>
        <c:when test="${loginInfo == 'NPasswordIsWrong'}">
        alert("两次输入的新密码不一致！");
        </c:when>
        <c:when test="${loginInfo == 'OPasswordWrong'}">
        alert("原密码错误！");
        </c:when>
        <c:when test="${loginInfo == 'PasswordChangeSuccess'}">
        alert("修改密码成功！");
        </c:when>
        <c:when test="${loginInfo == 'OPasswordEqualNPassword'}">
        alert("新老密码一致，请重新输入新密码！");
        </c:when>
        <c:when test="${loginInfo == 'UserCanNotUseMobile'}">
        alert("此用户尚未开通移动设备使用权限，请联系客服！");
        </c:when>
        <c:when test="${loginInfo == 'UserKickedOut'}">
        alert("此用户登录超出登录数限制，当前用户被踢出！");
        </c:when>

    </c:choose>
    }
</script>
</body>
</html>