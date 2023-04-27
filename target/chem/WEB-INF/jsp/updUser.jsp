<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>修改User</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    基于SSM框架的管理系统：简单实现增、删、改、查。
                </h1>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改User</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="" name="userForm">
        <input type="hidden" name="id" value="${user.id}"/>
        用户名：<input type="text" name="username" value="${user.username}"/>
        密码：<input type="text" name="password" value="${user.password}"/>
        状态：<input type="text" name="status" value="${user.status}"/>
        联系人：<input type="text" name="cpName" value="${user.cpName}"/>
        联系人电话：<input type="text" name="cpPhone" value="${user.cpPhone}"/>
        公司：<input type="text" name="companyName" value="${user.companyName}"/>
        公司地址：<input type="text" name="companyAddr" value="${user.companyAddr}"/>
        版本：<input type="text" name="userVer" value="${user.userVer}"/>

        <input type="button" value="提交" onclick="updUser()"/>
    </form>
    <script type="text/javascript">
        function updUser() {
            var form = document.forms[0];
            form.action = "<%=basePath %>user/updUser";
            form.method = "post";
            form.submit();
        }
    </script>
</div>