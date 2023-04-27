<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String appPath = request.getContextPath(); %>
<html>
<head>
    <title>User列表</title>
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
                    <small>User列表 —— 显示所有User</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${path}/user/toAddUser">新增</a>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>用户名</th>
                    <th>状态</th>
                    <th>联系人</th>
                    <th>联系人电话</th>
                    <th>公司</th>
                    <th>公司地址</th>
                    <th>版本</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${requestScope.get('list')}" varStatus="status">
                    <tr>
                        <td>${user.username}</td>
                        <td>${user.status}</td>
                        <td>${user.cpName}</td>
                        <td>${user.cpPhone}</td>
                        <td>${user.companyName}</td>
                        <td>${user.companyAddr}</td>
                        <td>${user.userVer}</td>
                        <td>
                            <a href="${path}/user/toUpdUser?id=${user.id}">更改</a> |
                            <a href="<%=appPath%>/user/del/${user.id}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>