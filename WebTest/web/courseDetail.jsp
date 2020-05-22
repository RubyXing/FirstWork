<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%String title = "课程详情页"; %>
<%@ include file="header.jsp" %>

<!--顶部概述-->
<div class="container-fluid">
    <div class="courselist-banner">
        <div class="index-wrapper">
            <div class="bread-nav bread-nav-banner">
                <div class="current-position">
                    <a href="courseList/list.do">编程课程列表</a>&nbsp;&gt;&nbsp;<span>${course.cname}</span>
                </div>
            </div>
            <div class="courselist-banner-content">
                <div class="courselist-banner-l">
                    <img src="${course.cimgaddress}"
                         alt="${course.cname}">
                    <ul class="courselist-tips-box">
                        <li><i class="tips-ico credit-card-ico"></i><span class="tips-tag">信用卡&nbsp;•&nbsp;花呗</span>
                        </li>
                        <li><i class="tips-ico refund-ico"></i><span class="tips-tag">放心购，7天内不满意可退款</span></li>
                    </ul>
                </div>
                <div class="courselist-banner-r">
                    <h2 class="courselist-course-name">${course.cname}</h2>
                    <div class="courselist-banner-meta">
                        <div class="get-banner-meta">
                            <span><i class="icon w3c-icon w3c-icon-content"></i>图文课程</span>
                            <i class="c-line"></i>
                            <!-- 微课含有的视频总时长 -->
                            <span>${courseDetail.dlessons} 节</span>
                            <i class="c-line"></i>
                            <span>${courseDetail.dsmaller} 个小点</span>
                            <i class="c-line"></i>
                            <span>
                                <c:choose>
                                    <c:when test="${course.cparticipate<1}">
                                        <fmt:formatNumber type="number" value="${course.cparticipate*1000}" pattern="0.00"
                                                          maxFractionDigits="0"/>
                                    </c:when>
                                    <c:otherwise>
                                        ${course.cparticipate}K
                                    </c:otherwise>
                                </c:choose>人参与</span>
                            <i class="c-line"></i>
                            <span>综合评分 ${courseDetail.dscore}</span>
                        </div>
                    </div>
                    <div class="get-cert-box">
                        <span>该课程可获得课程证书，快去登录学习领取吧！</span>
                    </div>
                    <div class="courselist-banner-info">
                        <div class="get-courseprice-box">
                            <c:choose>
                                <c:when test="${course.crebate<1}">
                                    <span class="cur-price ">
                                        ¥<fmt:formatNumber type="number"
                                                           value="${course.cprice*course.crebate}"
                                                           pattern="0.00"
                                                           maxFractionDigits="2"/>
                                    </span>
                                    <del class="pre-price">¥${course.cprice}</del>
                                </c:when>
                                <c:otherwise>
                                    <span class="cur-price ">¥${course.cprice}</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <c:choose>
                            <c:when test="${course.ccondition==402}">
                                <div class="get-vipprice-box">
                                    <span class="vipprice-tips">开通VIP会员，本门课程<em>免费学</em></span>
                                    <a href=""
                                       target="_blank" class="vipprice-btn">立即开通&nbsp;</a>
                                </div>
                            </c:when>
                            <c:when test="${course.ccondition==403}">
                                <div class="get-vipprice-box">
                                    <span class="vipprice-tips">开通VIP会员，购买仅需&nbsp;<em>
                                        <b>¥<fmt:formatNumber type="number" value="${course.cprice*course.crebate*0.8}"
                                                              pattern="0.00"
                                                              maxFractionDigits="2"/>
                                        </b></em></span>
                                    <a href="" target="_blank" class="vipprice-btn">立即开通&nbsp;&gt;</a>
                                </div>
                            </c:when>
                        </c:choose>
                    </div>

                    <div class="courselist-banner-footer">
                        <a href="<%=baseUrl%>login.jsp" class="go-btn login-btn tologin">登录学习</a>
                        <a href="shop/addCourse.do?courseId=${course.cid}&userid=${sessionScope.userid}"
                           class="go-btn try-btn">加入购物车</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--展示详情-->

<div class="courselist-content">
    <div class="index-wrapper">
        <!--主要介绍-->
        <div class="courselist-list">
            <div class="courselist-nav">
                <ul class="courselist-nav-tabs">
                    <li id="courselist-morecontent" class="courselist-nav-li active">
                        <a href="#morecontent" title="课程介绍" data-toggle="tab"
                           class="courselist-nav-name active">课程介绍</a>
                    </li>
                    <li id="courselist-menulist" class="courselist-nav-li">
                        <a href="#menulist" title="课程目录" data-toggle="tab" class="courselist-nav-name">课程目录
                            <span class="preview-icon">试学</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="courselist-body">
                <!-- 课程介绍 -->
                <div id="morecontent" class="courselist-item courselist-d active">
                    <div class="courseinfo-intro content-intro"><p>
                        <img src="${courseDetail.dimgaddress}"
                             alt="${course.cname}">
                        <br>
                    </p>

                        <h2>购买须知</h2>

                        <p>1.本课程为图文内容+闯关形式，共60节。</p>
                        <p>2.在课程学习中，如有任何使用上的问题，请联系客服微信号：<b>xingqilin</b></p>
                        <p>（加微信可进相关交流群，与更多小伙伴讨论问题）。&nbsp;</p>
                        <p><br></p></div>
                </div>
                <!-- 课程目录 -->
                <jsp:include page="courselist/${courseDetail.lessonpage}"/>

            </div>
        </div>
        <!--推荐课程侧边栏-->
        <div class="courselist-sidebar">
            <div class="sidebar-box">
                <h2 class="sidebar-title">推荐课程</h2>
                <div class="recom-list">
                    <ul class="recom-item">
                        <li>
                            <a href="/minicourse/play/htmlcourse" class="recom-course-img">
                                <img src="//atts.w3cschool.cn/attachments/cover/cover_htmlcourse.png?t=1583917447"
                                     alt="">
                            </a>
                            <div class="recom-course-content">
                                <a href="/minicourse/play/htmlcourse" class="recom-course-name" target="_blank">HTML微课(含HTML5)</a>
                                <div class="recom-course-meta">
                                    <span class="recom-course-people">96531人参与</span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="/minicourse/play/html_txy" class="recom-course-img">
                                <img src="//atts.w3cschool.cn/attachments/cover/cover_html_txy.png?t=1583809422" alt="">
                            </a>
                            <div class="recom-course-content">
                                <a href="/minicourse/play/html_txy" class="recom-course-name" target="_blank">小白学前端：HTML零基础入门</a>
                                <div class="recom-course-meta">
                                    <span class="recom-course-people">10033人参与</span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="/minicourse/play/qianduan_rygh" class="recom-course-img">
                                <img src="//atts.w3cschool.cn/attachments/cover/cover_qianduan_rygh.png?t=1571217212"
                                     alt="">
                            </a>
                            <div class="recom-course-content">
                                <a href="/minicourse/play/qianduan_rygh" class="recom-course-name" target="_blank">前端精品课：HTML+CSS入门</a>
                                <div class="recom-course-meta">
                                    <span class="recom-course-people">673人参与</span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="/minicourse/play/html5_job_my" class="recom-course-img">
                                <img src="//atts.w3cschool.cn/attachments/cover/cover_html5_job_my.png?t=1583809672"
                                     alt="">
                            </a>
                            <div class="recom-course-content">
                                <a href="/minicourse/play/html5_job_my" class="recom-course-name" target="_blank">HTML5高薪就业班教程</a>
                                <div class="recom-course-meta">
                                    <span class="recom-course-people">1653人参与</span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="/minicourse/play/my_qianduan" class="recom-course-img">
                                <img src="//atts.w3cschool.cn/attachments/cover/cover_my_qianduan.jpeg?t=1583917483"
                                     alt="">
                            </a>
                            <div class="recom-course-content">
                                <a href="/minicourse/play/my_qianduan" class="recom-course-name" target="_blank">HTML5+CSS3零基础快速入门</a>
                                <div class="recom-course-meta">
                                    <span class="recom-course-people">4415人参与</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!--广告放置-->
            <div class="abox-item">
                <div class="sidebar-box">
                    <div class="abox"><a href="https://www.w3cschool.cn/minicourse/play/python_office"
                                         target="_blank"><img
                            src="https://atts.w3cschool.cn/attachments/image/20200302/1583146659834591.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    $(function(){
        $(".chapter-item h3").click(function () {
            if ($(this).next('ul').is(":hidden")) {
                $(this).next('ul').slideDown();
                $(this).children("i").addClass("i-icon-down").removeClass("i-icon-up");
            } else {
                $(this).next('ul').slideUp();
                $(this).children('i').addClass("i-icon-up").removeClass("i-icon-down");
            }
        });
    });
</script>
</body>
</html>
