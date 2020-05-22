<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<base href="<%=baseUrl%>">
<head>
    <meta charset="utf-8">
    <title>注册</title>

    <link rel="stylesheet" type="text/css" href="staticfront/css/common.css">
    <link rel="stylesheet" type="text/css" href="staticfront/css/view.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>


    <style>
        html, body {
            height: 100%;
        }

        body {
            overflow: hidden;
            background-color: #fff;
        }

        .lrf-main {
            padding-top: 24px;
        }

        .lrf-main .site-logo {
            display: block;
            width: 214px;
            margin: 0 auto;
        }

        .lrf-main .lrf-panel {
            margin-top: 24px;
            padding: 0 24px;
        }

        .s-footer {
            display: none;
            margin-top: 96px;
            padding: 20px 0;
            font-size: 14px;
            text-align: center;
            color: #666;
        }

        .s-footer a:hover {
            color: #fe6a00;
        }

        @media (min-width: 576px) {
            body {
                background-color: #fafafa;
            }

            .lrf-main {
                width: 420px;
                padding-top: 96px;
                margin: 0 auto;
            }

            .lrf-main .lrf-panel {
                margin-top: 48px;
                padding: 12px 40px 6px;
                border: 1px solid #e9e9e9;
                border-radius: 8px;
                background-color: #fff;
                box-shadow: 0 2px 3px 0 rgba(213, 213, 213, .7);
            }

            .s-footer {
                display: block;
            }
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#login").click(function () {
                $("#registdiv").hide();
                $("#register").removeClass("lm-tabs-tab-active");
                $("#logindiv").show();
                $("#login").addClass("lm-tabs-tab-active");
                $("#colorbar").css("left", "65px");
            });
            $("#register").click(function () {
                $("#logindiv").hide();
                $("#login").removeClass("lm-tabs-tab-active");
                $("#registdiv").show();
                $("#register").addClass("lm-tabs-tab-active");
                $("#colorbar").css("left", "193px");
            });
        });
    </script>
</head>
<body>
<div class="lrf-main">
    <a class="site-logo" href="/">
        <img src="//7n.w3cschool.cn/statics/img/logo/indexlogo@2x.png" alt="编程狮-logo"
             width="214" height="50"></a>
    <div class="lrf-panel">
        <div class="lm-tabs">
            <div class="lm-tabs-nav" style="border-bottom: 2px solid rgb(232, 234, 236);">
                <div id="login" class="lm-tabs-tab lm-tabs-tab-active" data-key="0">登录</div>
                <div id="register" class="lm-tabs-tab  " data-key="1">注册</div>

                <div id="colorbar" class="lm-tabs-ink" style="left: 65px; width: 80px;"></div>
            </div>
            <div class="lm-tabs-content">
                <!--登录-->
                <div id="logindiv" class="lm-tabpanel lm-tabpanel-login">
                    <form class="lm-form login-form" method="post"
                          action="<%=baseUrl%>account/login.do?courseId=${param.courseId}">
                        <div class="lm-form-item">
                            <div class="lm-input-wrapper">
                                <input type="text" placeholder="学号/手机号/邮箱"
                                       class="lm-input lm-input-lg lm-input-lg-with-prefix"
                                       name="usermessage">
                                <span class="lm-input-prefix lm-input-lg-prefix">
                                    <i class="i-icon i-icon-user"></i></span>
                            </div>
                            <div class="lm-form-item-error-tip"></div>
                        </div>
                        <div class="lm-form-item">
                            <div class="lm-input-wrapper">
                                <input type="password" placeholder="登录密码"
                                       class="lm-input lm-input-lg lm-input-lg-with-prefix lm-input-lg-with-suffix"
                                       name="userpwd">
                                <span class="lm-input-prefix lm-input-lg-prefix">
                                    <i class="i-icon i-icon-lock-outline"></i></span>
                                <span class="lm-input-suffix lm-input-lg-suffix">
                                    <i class="i-icon i-icon-eye-close hover-icon"></i></span>
                            </div>
                            <div class="lm-form-item-error-tip"></div>
                        </div>

                        <div class="clearfix lm-form-item">
                            <label class="lm-checkbox-wrapper">
                                <span class="lm-checkbox">
                                    <input type="checkbox" checked="" class="lm-checkbox-input">
                                    <span class="lm-checkbox-inner"></span></span>
                                <span class="lm-checkbox-word">7天内自动登录</span>
                            </label><a class="fr findpwd" href="/checkmphone?type=findpwd" target="_blank">找回密码</a>
                        </div>
                        <div class="lm-form-item">
                            <button type="submit" class="lm-btn lm-btn-lg lm-btn-block lm-btn-primary">登录</button>
                            <div class="lm-form-item-error-tip"></div>
                        </div>
                    </form>
                </div>
                <!--注册-->
                <div id="registdiv" class="lm-tabpanel lm-tabpanel-regist" style="display: none;">
                    <form class="lm-form regist-form" autocomplete="off"><input type="text"
                                                                                style="display: none;"><input
                            type="password" style="display: none;">
                        <div>
                            <div class="lm-form-item">
                                <div class="lm-input-wrapper">
                                    <input type="text" placeholder="请输入用户名"
                                           class="lm-input lm-input-lg lm-input-lg-with-prefix"><span
                                        class="lm-input-prefix lm-input-lg-prefix">
                                    <i class="i-icon i-icon-mobile"></i></span>
                                </div>
                                <div class="lm-form-item-error-tip"></div>
                            </div>
                            <div class="lm-form-item">
                                <div class="lm-input-wrapper">
                                    <input type="text" placeholder="请输入注册手机号"
                                           class="lm-input lm-input-lg lm-input-lg-with-prefix"><span
                                        class="lm-input-prefix lm-input-lg-prefix">
                                    <i class="i-icon i-icon-mobile"></i></span>
                                </div>
                                <div class="lm-form-item-error-tip"></div>
                            </div>
                            <div class="lm-form-item">
                                <div class="lm-input-wrapper">
                                    <input type="text" placeholder="请输入邮箱"
                                           class="lm-input lm-input-lg lm-input-lg-with-prefix"><span
                                        class="lm-input-prefix lm-input-lg-prefix">
                                    <i class="i-icon i-icon-mobile"></i></span>
                                </div>
                                <div class="lm-form-item-error-tip"></div>
                            </div>
                            <div class="lm-form-item">
                                <div class="lm-input-wrapper">
                                    <input type="password" placeholder="请输入密码"
                                           class="lm-input lm-input-lg lm-input-lg-with-prefix"><span
                                        class="lm-input-prefix lm-input-lg-prefix">
                                    <i class="i-icon i-icon-mobile"></i></span>
                                </div>
                                <div class="lm-form-item-error-tip"></div>
                            </div>

                            <div class="lm-form-item auth">
                                <button type="button" class="lm-btn lm-btn-lg lm-btn-block lm-btn-primary"
                                        onselectstart="return false">注册
                                </button>
                                <div class="popup">
                                    <div class="popup-close"><i class="i-icon i-icon-close"></i></div>
                                    <div class="slideImgAuthcode" style="width: 260px;">
                                        <div class="slide-img" style="height: 116px;"></div>
                                        <div class="slide-bar">
                                            <div class="slide-bar-text" onselectstart="return false">向右滑动完成拼图</div>
                                            <div class="slide-bar-bg" onselectstart="return false"></div>
                                            <div class="slide-bar-btn"><i class="i-icon i-icon-arrow-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="lm-form-item-error-tip"></div>
                            </div>
                            <div class="lm-form-item"><label class="lm-checkbox-wrapper"><span
                                    class="lm-checkbox"><input type="checkbox" checked=""
                                                               class="lm-checkbox-input"><span
                                    class="lm-checkbox-inner"></span></span><span class="lm-checkbox-word">我已阅读并同意<a
                                    class="regist-agreement" href="https://www.w3cschool.cn/webagreement"
                                    target="_blank">《用户注册协议》</a></span></label>
                                <div class="lm-form-item-error-tip"></div>
                            </div>
                        </div>
                        <div style="display: none;">
                            <div class="text-center lm-form-item">
                                <div>填写短信验证码、密码完成注册</div>
                                <div>短信验证码已发送至&nbsp;+86&nbsp;<span class="tel"></span></div>
                            </div>
                            <div class="lm-form-item mcode">
                                <div class="lm-input-wrapper"><input type="text" placeholder="请输入短信验证码" maxlength="4"
                                                                     autocomplete="off" class="lm-input lm-input-lg">
                                    <button type="button" class="lm-btn lm-btn-lg lm-btn-text">获取验证码</button>
                                </div>
                                <div class="lm-form-item-error-tip"></div>
                            </div>
                            <div class="lm-form-item">
                                <div class="lm-input-wrapper"><input type="password" placeholder="设置密码，下次可使用此密码登录"
                                                                     autocomplete="off"
                                                                     class="lm-input lm-input-lg lm-input-lg-with-prefix lm-input-lg-with-suffix"><span
                                        class="lm-input-prefix lm-input-lg-prefix"><i
                                        class="i-icon i-icon-lock-outline"></i></span><span
                                        class="lm-input-suffix lm-input-lg-suffix"><i
                                        class="i-icon i-icon-eye-close hover-icon"></i></span></div>
                                <div class="lm-form-item-error-tip"></div>
                            </div>
                            <div class="lm-form-item">
                                <button type="submit" class="lm-btn lm-btn-lg lm-btn-block lm-btn-primary">注册</button>
                                <div class="lm-form-item-error-tip"></div>
                            </div>
                            <div class="text-center lm-form-item">
                                <button type="button" class="lm-btn lm-btn-text">返回修改手机号</button>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <!--footer start-->
    <div class="s-footer">
        <div class="s-footer-bottom">
            <p>Copyright © 2019 <a href="courseList/list.do">幸琦林&nbsp;</a> All Rights Reserved.
            </p>
        </div>
    </div>
    <!--footer end-->
</div>

<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
