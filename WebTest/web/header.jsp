<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<base href="<%=baseUrl%>">
<meta charset="utf-8">
<head>
    <title><%=title%>
    </title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="staticfront/css/course.css">
    <link rel="stylesheet" type="text/css" href="staticfront/css/minicourse.css">
    <link rel="stylesheet" type="text/css" href="staticfront/css/w3.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <style>
        li {
            display: list-item;
            text-align: -webkit-match-parent;
            list-style: none;
        }

        /*详情图片展示*/
        .content-intro img {
            border: 0;
            max-width: 100%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-md bg-light border-bottom">
    <a class="navbar-brand" href="#">
        <img src="https://7n.w3cschool.cn/statics/images/logonew2.png" width="120"/>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="header-menu">
            <li><a href="courseList/list.do" title="编程入门教程">首页</a></li>
            <li><a href="courseList/list.do" title="编程课程">编程课程</a></li>
            <li><a href="" title="VIP会员" class="header-menu-vip ">VIP会员<i class="hot-icon">HOT</i></a></li>
        </ul>
        <div class="course-menu-r">
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form></div>
    </div>
</nav>
