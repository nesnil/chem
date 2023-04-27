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
<c:set var="dtl" scope="page" value="${requestScope.get('dtl')}"/>
<section class="new">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-xs-12 table-title">
                <h3>化学品库</h3>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12 col-md-12 col-xs-12">
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active col-sm-2">
                        <a href="#home" data-toggle="tab">
                            概要应急
                        </a>
                    </li>
                    <c:if test="${!empty dtl.tsxbqgxtdxYcjc || !empty dtl.tsxbqgxtdxFfjc || !empty dtl.qt }">
                    <li class="col-sm-2"><a href="#tulixinxi" data-toggle="tab">毒理信息</a></li>
                    </c:if>
                    <li class="col-sm-2"><a href="#wuhaxinxi" data-toggle="tab">物化信息</a></li>
                    <c:if test="${!empty dtl.jcjh || !empty dtl.bltj || !empty dtl.dddlx || !empty dtl.zdjl || !empty dtl.lcbx || !empty dtl.xcjj || !empty dtl.zd || !empty dtl.zl || !empty dtl.jej || !empty dtl.yh }">
                    <li class="col-sm-2"><a href="#jkyl" data-toggle="tab">健康医疗</a></li>
                    </c:if>
                    <c:if test="${!empty dtl.xlyjcl || !empty dtl.gzaq || !empty dtl.xfcs || !empty dtl.blkzhgrfh || !empty dtl.czczycc || !empty dtl.fqcz || !empty dtl.ysxx }">
                    <li class="col-sm-2"><a href="#aqxf" data-toggle="tab">安全消防 </a></li>
                    </c:if>
                    <c:if test="${!empty dtl.fg || !empty dtl.zyjcxz || !empty dtl.xgbz || !empty dtl.swxz || !empty dtl.fgqt }">
                    <li class="col-sm-2"><a href="#fgbx" data-toggle="tab">法规标准</a></li>
                    </c:if>

                </ul>
                <div id="myTabContent" class="tab-content">
                    <!--概要应急-->
                    <div class="tab-pane fade in active" id="home">
                        <table class="table">
                            <tr >
                                <td class="bg-two">索引号</td>
                                <td>${dtl.idx}</td>
                                <td class="bg-two">化学文摘号</td>
                                <td>${dtl.casno}</td>
                            </tr>
                            <tr>
                                <td class="bg-two">职业危害程度</td>
                                <td>${dtl.zywhcdfj}</td>
                                <td class="bg-two">毒物危害指数</td>
                                <td>${dtl.dwwhzs}</td>
                            </tr>
                            <tr>
                                <td class="bg-two">化学品名称</td>
                                <td colspan="3" >${dtl.title}</td>
                            </tr>
                            <tr>
                                <td class="bg-two">关键字</td>
                                <td colspan="3" >${dtl.content}</td>
                            </tr>

                            <tr>
                                <th colspan="4">基本信息</th>
                            </tr>
                            <tr>
                                <td  class="bg-two">中文名称</td>
                                <td  colspan="3">${dtl.gyJbZwmc}</td>
                            </tr>
                            <tr>
                                <td  class="bg-two">英文名称</td>
                                <td  colspan="3">${dtl.gyJbYwmc}</td>
                            </tr>
                            <tr>
                                <td class="bg-two">CAS号</td>
                                <td  colspan="3">${dtl.gyJbCas}</td>
                            </tr>
                            <tr>
                                <th colspan="4">危险性</th>
                            </tr>
                            <tr>
                                <td class="bg-two">危险分类</td>
                                <td  colspan="3">${dtl.gyWxWxfl}</td>
                            </tr>
                            <tr>
                                <td class="bg-two">溶解性</td>
                                <td  colspan="3">${dtl.gyWxRjx}</td>
                            </tr>
                            <tr>
                                <td class="bg-two">腐蚀性</td>
                                <td  colspan="3">${dtl.gyWxFsx}</td>
                            </tr>
                            <tr>
                                <td  class="bg-two">燃烧性</td>
                                <td  colspan="3">${dtl.gyWxRsx}</td>
                            </tr>
                            <tr>
                                <td class="bg-two">分解产物</td>
                                <td  colspan="3">${dtl.gyWxFjcw}</td>
                            </tr>
                            <tr>
                                <th colspan="4">急救措施</th>
                            </tr>
                            <tr>
                                <td  class="bg-two">泄露应急处理</td>
                                <td  colspan="3">${dtl.gyJjXlyjcl}</td>
                            </tr>
                            <tr>
                                <td  class="bg-two">现场急救</td>
                                <td  colspan="3">${dtl.gyJjXcjj}</td>
                            </tr>
                            <tr>
                                <th colspan="4">安全消防</th>
                            </tr>
                            <tr>
                                <td class="bg-two">公众安全</td>
                                <td colspan="3">${dtl.gyAqGzaq}</td>
                            </tr>
                            <tr>
                                <td class="bg-two">消防措施</td>
                                <td colspan="3">${dtl.gyAqXfcs}</td>
                            </tr>
                            <tr>
                                <td class="bg-two">暴露控制<br/>个人防护</td>
                                <td colspan="3">${dtl.gyAqBlkzhgrfh}</td>
                            </tr>
                        </table>
                    </div>

                    <!--毒理信息-->
<c:if test="${!empty dtl.tsxbqgxtdxYcjc || !empty dtl.tsxbqgxtdxFfjc || !empty dtl.qt }">
                    <div class="tab-pane fade" id="tulixinxi">
                        <table class="table">
                            <c:if test="${!empty dtl.tsxbqgxtdxYcjc}">
                            <tr>
                                <th>特异性靶器官系统毒性——一次接触</th>
                            </tr>
                            <tr>
                                <td>${dtl.tsxbqgxtdxYcjc}</td>
                            </tr>
                            </c:if>
                            <c:if test="${!empty dtl.tsxbqgxtdxFfjc}">
                            <tr>
                                <th>特异性靶器官系统毒性——反复接触</th>
                            </tr>
                            <tr>
                                <td>${dtl.tsxbqgxtdxFfjc}</td>
                            </tr>
                            </c:if>
                            <c:if test="${!empty dtl.qt}">
                            <tr>
                                <th>其他</th>
                            </tr>
                            <tr>
                                <td>${dtl.qt}</td>
                            </tr>
                            </c:if>
                        </table>
                    </div>
</c:if>
                    <!--物化信息-->
                    <div class="tab-pane fade" id="wuhaxinxi">

                        <table class="table">
                            <tr>
                                <th colspan="4">物化参数</th>
                            </tr>
                            <tr >
                                <td class="bg-two">外观与性质</td>
                                <td>${dtl.whCsWgyxz}</td>
                                <td class="bg-two">密度/比重</td>
                                <td>${dtl.whCsMdbz}</td>
                            </tr>
                            <tr>
                                <td class="bg-two">熔点/凝固点</td>
                                <td>${dtl.whCsRdngd}</td>
                                <td class="bg-two">沸点</td>
                                <td>${dtl.whCsFd}</td>
                            </tr>
                            <tr>
                                <td class="bg-two">蒸汽密度</td>
                                <td>${dtl.whCsZqmd}</td>
                                <td class="bg-two">闪点</td>
                                <td>${dtl.whCsSd}</td>
                            </tr>
                        </table>
                        <table class="table" id="wuhaxinxi-two">
                            <c:if test="${!empty dtl.whLhtx}">
                            <tr>
                                <th colspan="4">理化特征</th>
                            </tr>
                            <tr>
                                <td colspan="4">${dtl.whLhtx}</td>
                            </tr>
                            </c:if>
                            <c:if test="${!empty dtl.whRsx}">
                            <tr>
                                <th colspan="4">燃烧性</th>
                            </tr>
                            <tr>
                                <td colspan="4">${dtl.whRsx}</td>
                            </tr>
                            </c:if>
                            <c:if test="${!empty dtl.whRjx}">
                            <tr>
                                <th colspan="4">溶解性</th>
                            </tr>
                            <tr>
                                <td colspan="4">${dtl.whRjx}</td>
                            </tr>
                            </c:if>
                            <c:if test="${!empty dtl.whFjcw}">
                            <tr>
                                <th colspan="4">分解产物</th>
                            </tr>
                            <tr>
                                <td colspan="4">${dtl.whFjcw}</td>
                            </tr>
                            </c:if>
                            <c:if test="${!empty dtl.whWdxjfyx}">
                            <tr>
                                <th colspan="4">稳定性及反应性	</th>
                            </tr>
                            <tr>
                                <td colspan="4">${dtl.whWdxjfyx}</td>
                            </tr>
                            </c:if>
                        </table>
                    </div>
<c:if test="${!empty dtl.jcjh || !empty dtl.bltj || !empty dtl.dddlx || !empty dtl.zdjl || !empty dtl.lcbx || !empty dtl.xcjj || !empty dtl.zd || !empty dtl.zl || !empty dtl.jej || !empty dtl.yh }">
                    <!--健康医疗-->
                    <div class="tab-pane fade" id="jkyl">
                        <table class="table">
                            <c:if test="${!empty dtl.jcjh}">
                            <tr> <th>接触机会</th> </tr>
                            <tr> <td>${dtl.jcjh}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.bltj}">
                            <tr> <th>暴露途径</th> </tr>
                            <tr> <td>${dtl.bltj}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.dddlx}">
                            <tr> <th>毒代动力学</th> </tr>
                            <tr> <td>${dtl.dddlx}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.zdjl}">
                            <tr> <th>中毒机理</th> </tr>
                            <tr> <td>${dtl.zdjl}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.lcbx}">
                            <tr> <th>临床表现</th>  </tr>
                            <tr> <td>${dtl.lcbx}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.xcjj}">
                            <tr> <th>现场急救</th> </tr>
                            <tr> <td>${dtl.xcjj}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.zd}">
                            <tr> <th>诊断</th> </tr>
                            <tr> <td>${dtl.zd}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.zl}">
                            <tr> <th>治疗</th> </tr>
                            <tr> <td>${dtl.zl}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.jej}">
                            <tr> <th>解毒剂</th> </tr>
                            <tr> <td>${dtl.jej}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.yh}">
                            <tr> <th>预后</th> </tr>
                            <tr> <td>${dtl.yh}</td> </tr>
                            </c:if>
                        </table>
                    </div>
</c:if>
<c:if test="${!empty dtl.xlyjcl || !empty dtl.gzaq || !empty dtl.xfcs || !empty dtl.blkzhgrfh || !empty dtl.czczycc || !empty dtl.fqcz || !empty dtl.ysxx }">
                    <!--安全消防-->
                    <div class="tab-pane fade" id="aqxf">
                        <table class="table">
                            <c:if test="${!empty dtl.xlyjcl}">
                            <tr> <th>泄露应急处理</th> </tr>
                            <tr> <td>${dtl.xlyjcl}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.gzaq}">
                            <tr> <th>公众安全</th> </tr>
                            <tr> <td>${dtl.gzaq}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.xfcs}">
                            <tr> <th>消防措施</th> </tr>
                            <tr> <td>${dtl.xfcs}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.blkzhgrfh}">
                            <tr> <th>暴露控制和个人防护</th> </tr>
                            <tr> <td>${dtl.blkzhgrfh}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.czczycc}">
                            <tr> <th>操作处置与存储</th> </tr>
                            <tr> <td>${dtl.czczycc}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.fqcz}">
                            <tr> <th>废弃处置</th> </tr>
                            <tr> <td>${dtl.fqcz}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.ysxx}">
                            <tr> <th>运输信息</th> </tr>
                            <tr> <td>${dtl.ysxx}</td> </tr>
                            </c:if>
                        </table>
                    </div>
</c:if>
<c:if test="${!empty dtl.fg || !empty dtl.zyjcxz || !empty dtl.xgbz || !empty dtl.swxz || !empty dtl.fgqt }">
                    <!--法规标准-->
                    <div class="tab-pane fade" id="fgbx">
                        <table class="table">
                            <c:if test="${!empty dtl.fg}">
                            <tr> <th>法规</th> </tr>
                            <tr> <td>${dtl.fg}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.zyjcxz}">
                            <tr> <th>职业接触限值</th> </tr>
                            <tr> <td>${dtl.zyjcxz}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.xgbz}">
                            <tr> <th>相关标准</th> </tr>
                            <tr> <td>${dtl.xgbz}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.swxz}">
                            <tr> <th>生物限值</th> </tr>
                            <tr> <td>${dtl.swxz}</td> </tr>
                            </c:if>
                            <c:if test="${!empty dtl.fgqt}">
                            <tr> <th>其他</th> </tr>
                            <tr> <td>${dtl.fgqt}</td> </tr>
                            </c:if>
                        </table>
                    </div>
</c:if>
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