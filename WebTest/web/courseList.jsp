<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%String title = "课程列表页"; %>
<%@ include file="header.jsp" %>
<!--导航栏-->
<div class="course-banner">
    <div class="container course-filter-container">
        <div class="course-tab-top">
            <a href="courseList/list.do" class="course-tab-title active">课程</a>
        </div>
        <!-- 课程筛选列表 -->
        <div class="course-nav-box">
            <div class="course-nav-row">
                <span class="course-nav-title">方向：</span>
                <div class="course-nav-sort">
                    <ul class="course-nav-list">
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/courseList/list.do">全部</a>
                        </li>
                        <c:forEach items="${direction}" var="tagsa">
                            <li class="list-inline-item">
                                <a href="${pageContext.request.contextPath}/courseList/getTop.do?topid=${tagsa.tid}">${tagsa.tname}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="course-nav-row">
                <span class="course-nav-title">标签：</span>
                <div class="course-nav-sort">
                    <ul class="course-nav-list course-all-tags">
                        <li class="active">
                            <a href="">全部</a>
                        </li>
                        <c:forEach items="${type}" var="tagsa">
                            <li class="list-inline-item">
                                <a href="${pageContext.request.contextPath}/courseList/getType.do?typeId=${tagsa.tid}">${tagsa.tname}</a>
                            </li>
                        </c:forEach>
                    </ul>
                    <div class="show-more-box" style="display: none;">
                        <a href="javascript:;" id="show-more-btn" data-type="open">更多 »</a>
                    </div>
                </div>
            </div>
            <div class="course-nav-row">
                <span class="course-nav-title">类型：</span>
                <div class="course-nav-sort">
                    <ul class="course-nav-list">
                        <li class="active">
                            <a href="">全部</a>
                        </li>
                        <c:forEach items="${label}" var="tagsa">
                            <li class="list-inline-item">
                                <a href="${pageContext.request.contextPath}/courseList/checkLabel.do?labelId=${tagsa.tid}">${tagsa.tname}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="course-nav-row">
                <span class="course-nav-title">条件：</span>
                <div class="course-nav-sort">
                    <ul class="course-nav-list">
                        <li class="active">
                            <a href="">全部</a>
                        </li>
                        <c:forEach items="${condition}" var="tagsa">
                            <li class="list-inline-item">
                                <a href="${pageContext.request.contextPath}/courseList/checkLabel.do?labelId=${tagsa.tid}">${tagsa.tname}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<!--课程展示栏-->
<div class="course-content">
    <div class="container">
        <div class="course-menu">
            <div class="course-menu-l">
                <ul>
                    <li class="active"> <a href="courseList/list.do">综合</a>
                    </li>
                    <li> <a href="courseList/list.do">最热</a>
                    </li>
                    <li> <a href="courseList/list.do">最新</a>
                    </li>
                </ul>
            </div>
            <div class="course-menu-r">
                <a href="http://yqv6aiyepi2ily4g.mikecrm.com/cLFEDKH" class="course-sug" target="_blank">
                    <i class="add-icon"></i>添加课程需求
                </a>
            </div>
        </div>



        <!--课程列表-->
        <div class="course-list">
            <ul class="clearfix course-item">
                <c:forEach items="${courseList}" var="cou">
                    <li class="fl">
                        <a href="${pageContext.request.contextPath}/detail/course.do?courseId=${cou.cid}" target="_blank" class="course-box">
                            <div class="course-img">
                                <img src="${cou.cimgaddress}"
                                     alt="${cou.cname}">
                                <span class="course-view-number">
                                <i class="course-view-ico"></i>
                                    <c:if test="${cou.cparticipate>1}">
                                        ${cou.cparticipate}k
                                    </c:if>
                                    <c:if test="${cou.cparticipate<=1}">
                                        <fmt:formatNumber type="number" value="${cou.cparticipate*1000}" pattern="0.00"
                                                          maxFractionDigits="0"/>
                                    </c:if>
                            </span>
                            </div>
                            <div class="course-body">
                                <div class="course-name">${cou.cname}</div>
                                <div class="course-des">${cou.cdescription}</div>
                                <div class="course-price">
                                    <!--是否免费-->
                                    <c:choose>
                                        <c:when test="${cou.ccondition!=401}">
                                            <span class="cur-price ">
                                            ¥<fmt:formatNumber type="number" value="${cou.cprice*cou.crebate}"
                                                              pattern="0.00"
                                                              maxFractionDigits="2"/>
                                            </span>
                                            <c:if test="${cou.crebate!=1}">
                                                <del class="pre-price">¥${cou.cprice}</del>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="cur-price">免费</span>
                                        </c:otherwise>
                                    </c:choose>
                                    <!--VIP判断-->
                                    <c:choose>
                                        <c:when test="${cou.ccondition==402}">
                                            <!--VIP免费-->
                                            <div class="vipinfo-box pull-right">
                                                <span class="vipinfo-meta svip-course-tag">VIP免费</span>
                                            </div>
                                        </c:when>
                                        <c:when test="${cou.ccondition==403}">
                                            <!-- VIP专享价 -->
                                            <div class="vipinfo-box pull-right">
                                                <div class="vipinfo-show">
                                                    <span class="vipinfo-meta vipprice-tag">VIP</span>
                                                    <span class="vipprice-price">
                                                        ¥<fmt:formatNumber type="number"
                                                                          value="${cou.cprice*cou.crebate*0.8}"
                                                                          pattern="0.00"
                                                                          maxFractionDigits="2"/>
                                                    </span>
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                    <!-- 限时折扣 -->
                                    <c:if test="${cou.crebate!=1}">
                                        <div class="course-discount">
                                            <span class="discount-tag">限时${cou.crebate*100}%折扣</span>
                                            <span class="discount-time">仅剩14小时</span>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

<br>

<jsp:include page="footer.jsp"/>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
