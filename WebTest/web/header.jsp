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
<div id="header_item" class="header-with-search">
    <div id="header_index">
        <div id="header-l">
            <a href="courseList/list.do" title="w3cschool" class="logo"><img
                    src="//7n.w3cschool.cn/statics/images/logonew2.png" alt="w3cschool"></a>
            <ul class="header-menu">
                <li><a href="courseList/list.do" title="编程入门教程">首页</a></li>
                <li><a href="courseList/list.do" title="编程课程" class="active">编程课程</a></li>
                <li><a href="" title="VIP会员" class="header-menu-vip ">VIP会员<i
                        class="hot-icon">HOT</i></a></li>
            </ul>
        </div>

        <div class="fr h-right">
            <div class="fl sig-box">
                <div><a class="link" href="account/login.do">注册</a><span
                        class="sep">|</span><a class="link" href="account/login.do">登录</a></div>
            </div>
        </div>

        <div class="fr searchbox">
            <form action="courseList/search.do" target="_self">
                <input type="text" name="w" class="box" id="searched_content" placeholder="输入关键字搜索...">
                <button type="submit" class="button"></button>
            </form>
        </div>

    </div>
</div>
