<%@ page import="com.pojo.Dict" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ServletContext sc = request.getServletContext();
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    pageContext.setAttribute("basePath", basePath);
    List<Dict> crTypes = (List<Dict>)sc.getAttribute("crTypes");
    String username = "";
    User user = (User) session.getAttribute("UserInfo");
    if(user!=null){
        username = user.getUsername();
        pageContext.setAttribute("username",username);
    }
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
    <script>
        function keywordSearch(keywrod) {
            document.getElementById("iptPageNum").value = 1;
            document.getElementById("s").value = keywrod;
            document.getElementById("searchForm").submit();
        }
    </script>
</head>
<body>
<section class="users">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-xs-12 sn-login-info-use">
                <span><img alt="" src="${basePath}images/5.png">${username}</span>
                <!--<span>|</span>
                <a href="" class="sn-login">设置</a>-->
                <span>|</span>
                <a href="${basePath}user/logout" class="sn-register">退出</a>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</section>
<section class="use-search">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-xs-12 ">
                <form id="searchForm" method="post" action="${basePath}chem/qryChem">
                    <fieldset class="row">
                        <div id="searchInContainer">
                            <div class="col-sm-3 col-xs-4">
                                <input type="radio" name="type" value="" id="iptTypeAll" checked />
                                <label for="iptTypeAll" id="siteNameLabel">全部</label>
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
                            <input id="s" type="text" name="keywords" placeholder="CAS号 或 关键词"/>
                            <span  class="glyphicon glyphicon-search"></span><input type="submit" value="搜    索" id="submitButton" />
                        </div>
                    </fieldset>
                    <input id="iptPageNum" type="hidden" name="pageNum" value="1" />
                </form>
            </div>
        </div>
    </div>
</section>
<c:set var="ctnt" scope="page" value="${requestScope.get('ctnt')}"/>
<c:set var="ctntKeywords" scope="page" value="${requestScope.get('ctntKeywords')}"/>
<section class="new-show">
    <div class="col-lg-2 col-md-2 col-xs-12 left-nav">
        <h2 class="left-title-bg">关键词</h2>
        <ul class="left-title-nav">
            <c:set value="${ fn:split(ctnt.keyword, '|') }" var="kws" />
            <c:forEach items="${ kws }" var="kw">
                <li><a href="javascript:void(0)" onclick="keywordSearch('${kw}')">${kw}</a></li>
            </c:forEach>
        </ul>
    </div>
    <div class="col-lg-8 col-md-8 col-xs-12 right-show-content">

        <c:set value="${ fn:split(ctntKeywords, ' ') }" var="searchkws" />
        <c:set value="${ ctnt.title }" var="ctnttitle" />
        <c:set value="${ ctnt.content }" var="ctntcontent" />
        <c:forEach items="${ searchkws }" var="searchkw">
            <c:set value="${ fn:replace(ctnttitle,searchkw,'<span style=\"background-color: yellow;padding: 0;margin: 0;\">'.concat(searchkw).concat('</span>'))}" var="ctnttitle" />
            <c:set value="${ fn:replace(ctntcontent,searchkw,'<span style=\"background-color: yellow;padding: 0;margin: 0;\">'.concat(searchkw).concat('</span>'))}" var="ctntcontent" />
        </c:forEach>
        <h2 class="right-show-title">${ctnttitle}</h2>
        <div class="content-show">
            ${ctntcontent}
        </div>
    </div>
</section>
<div class="clearfix"></div>
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
                <!--
                <p>Copyright 2020 XXXXXXXXXX   All Right Reserved</p>
                <p><a href="http://beian.miit.gov.cn/" title="">沪ICP 备 0000000号</a></p>
                -->
                <p><span style="color:grey;">中国职业安全健康协会化工职业安全健康专业委员会监制</span></p>
            </div>
        </div>
    </div>
</footer>
<script src="${basePath}js/bootstrap.min.js"></script>
</body>
</html>