<%@ page import="com.pojo.Dict" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        function prevPage(){
            var pageNum = eval(document.getElementById("iptPageNum").value)-1;
            if(pageNum<1){pageNum=1;}
            document.getElementById("iptPageNum").value = pageNum;
            document.getElementById("searchForm").submit();

        }
        function nextPage(){
            var pageNum = eval(document.getElementById("iptPageNum").value)+1;
            document.getElementById("iptPageNum").value = pageNum;
            document.getElementById("searchForm").submit();
        }
        function toPage(pn){
            var pageNum = eval(pn);
            document.getElementById("iptPageNum").value = pageNum;
            document.getElementById("searchForm").submit();
        }
        function showContent(id,type){
            document.getElementById("iptCtntId").value = id;
            document.getElementById("iptCtntType").value = type;
            document.getElementById("showCtntForm").submit();
        }
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
            <div class="col-lg-12 col-md-12 col-xs-12  sn-login-info-use">
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
                                <input type="radio" name="type" value="" id="iptTypeAll" <c:if test="${empty requestScope.get('searchType')}" > checked </c:if> />
                                <label for="iptTypeAll" id="siteNameLabel">全部</label>
                                </div>
                                <c:forEach var="types" items="${crTypes}" varStatus="status">
                                    <div class="col-sm-3 col-xs-4">
                                        <input type="radio" name="type" value="${types.dicCode}" id="iptType${types.dicCode}" <c:if test="${requestScope.get('searchType')==types.dicCode}" > checked </c:if>/>
                                        <label for="iptType${types.dicCode}">${types.dicValue}</label>
                                    </div>
                                </c:forEach>
                            </div>
                          <div class="clearfix"></div>
                            <div class="submit-search">
                                <input id="s" type="text" name="keywords" value="${requestScope.get('keywords')}" placeholder="CAS号 或 关键词"/>
                                <span  class="glyphicon glyphicon-search"></span><input type="submit" value="搜    索" id="submitButton" />
                            </div>
                        </fieldset>
                    <input id="iptPageNum" type="hidden" name="pageNum" value="${requestScope.get('pageNum')}" />
                </form>
            </div>
        </div>
    </div>
</section>

<section class="new">
    <div class="container">
        <c:forEach var="chem" items="${requestScope.get('list')}" varStatus="status">
            <div class="row new-bg bg-hover" >
                <div class="col-lg-1 col-md-1 col-xs-4 col-sm-2 new-title">
                    <img alt="" src="${basePath}images/${chem.imagename}">
                </div>
                <div class="col-lg-11 col-md-11 col-xs-8 col-sm-10  new-content">
                    <c:set value="${ fn:split(requestScope.get('keywords'), ' ') }" var="searchkws" />
                    <c:set value="${ chem.title }" var="chemtitle" />
                    <c:forEach items="${ searchkws }" var="searchkw">
                        <c:set value="${ fn:replace(chemtitle,searchkw,'<span style=\"background-color: yellow;padding: 0;margin: 0;\">'.concat(searchkw).concat('</span>'))}" var="chemtitle" />
                    </c:forEach>
                    <a href="javascript:void(0);" onclick="showContent('${chem.id}','${chem.htmlCode}')" title="">${chemtitle}</a>
                    <c:set value="${ fn:split(chem.keyword, '|') }" var="kws" />
                    <p>关键字：
                    <c:forEach items="${ kws }" var="kw">
                        <c:set value="${ fn:split(requestScope.get('keywords'), ' ') }" var="searchkws" />
                        <c:set value="${ kw }" var="kw2" />
                        <c:forEach items="${ searchkws }" var="searchkw">
                            <c:set value="${ fn:replace(kw2,searchkw,'<span style=\"background-color: yellow;padding: 0;margin: 0;\">'.concat(searchkw).concat('</span>'))}" var="kw2" />
                        </c:forEach>
                        <span onclick="keywordSearch('${kw}')" style="cursor:pointer;">${kw2}</span>
                    </c:forEach> </p>
                </div>
            </div>
            <div class="clearfix"></div>
        </c:forEach>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-xs-12">
                <div class="pagination-wrapper">
                    <div class="pagination">
                        <li><a href="javascript:void(0);" onclick="prevPage();">上一页</a></li>
                        <c:forEach var="pn" begin="1" end="${requestScope.get('pages')}">
                            <c:if test="${requestScope.get('pageNum') == pn}">
                                <li class="thisclass"><a href='javascript:void(0)'>${pn}</a></li>
                            </c:if>
                            <c:if test="${requestScope.get('pageNum') != pn}">
                                <li><a href='javascript:toPage(${pn})' >${pn}</a></li>
                            </c:if>
                        </c:forEach>
                        <li><a href="javascript:void(0);" onclick="nextPage();">下一页</a></li>
                    </div>
                </div>
            </div>
        </div>
        <!--
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12">
                    <div class="pagination-wrapper">
                        <div class="pagination"> <li><a>首页</a></li>
                            <li class="thisclass"><a>1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li ><a href='javascript:void(0)' style='border:0;background: none'>...</a></li>

                            <li><a href="#">下一页</a></li>
                            <li><a href="#">末页</a></li>
                        </div>
                    </div>
                </div>
            </div>-->
    </div>
    <form id="showCtntForm" method="post" action="${basePath}chem/content">
        <input type="hidden" id="iptCtntId" name="ctntId"/>
        <input type="hidden" id="iptCtntType" name="ctntType"/>
        <input type="hidden" id="iptCtntKeywords" name="ctntKeywords" value="${requestScope.get('keywords')}"/>
    </form>
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