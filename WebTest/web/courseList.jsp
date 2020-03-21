<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%String title = "课程列表页"; %>
<%@ include file="header.jsp" %>
<!--导航栏-->
<div class="container-fluid">
    <div class="accordion shadow" id="accordionExample">
        <div class="card">
            <div class="card-header" id="headingOne">
                <button class="btn btn-block btn-outline-light text-left" type="button" data-toggle="collapse"
                        data-target="#collapseOne"
                        aria-expanded="true" aria-controls="collapseOne">
                    <ul class="list-inline">
                        方向：
                        <li class="list-inline-item"><a
                                href="${pageContext.request.contextPath}/courseList/list.do">全部</a></li>
                        <c:forEach items="${direction}" var="tagsa">
                            <li class="list-inline-item">
                                <a href="${pageContext.request.contextPath}/courseList/getTop.do?topid=${tagsa.tid}">${tagsa.tname}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </button>
            </div>
            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div class="card-body">
                    <ul class="list-inline">
                        标签：
                        <li class="list-inline-item active">
                            <a href="${pageContext.request.contextPath}">全部</a></li>
                        <c:forEach items="${type}" var="tagsa">
                            <li class="list-inline-item">
                                <a href="${pageContext.request.contextPath}/courseList/getType.do?typeId=${tagsa.tid}">${tagsa.tname}</a>
                            </li>
                        </c:forEach>
                    </ul>
                    <ul class="list-inline">
                        类型：
                        <li class="list-inline-item"><a
                                href="">全部</a></li>
                        <c:forEach items="${label}" var="tagsa">
                            <li class="list-inline-item">
                                <a href="${pageContext.request.contextPath}/courseList/checkLabel.do?labelId=${tagsa.tid}">${tagsa.tname}</a>
                            </li>
                        </c:forEach>
                    </ul>
                    <ul class="list-inline">
                        条件：
                        <li class="list-inline-item"><a href="">全部</a></li>
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
        <!--课程顶部-->
        <div class="course-menu">
            <div class="course-menu-l">
                <ul>
                    <li class="active"><a
                            href="/courses?direction=2120&amp;tag=0&amp;type=0&amp;condition=0&amp;order=0">综合</a>
                    </li>
                    <li><a href="/courses?direction=2120&amp;tag=0&amp;type=0&amp;condition=0&amp;order=1">最热</a>
                    </li>
                    <li><a href="/courses?direction=2120&amp;tag=0&amp;type=0&amp;condition=0&amp;order=2">最新</a>
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
                        <a href="/detail/course.do?courseId=${cou.cid}" target="_blank" class="course-box">
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
                                            <fmt:formatNumber type="number" value="${cou.cprice*cou.crebate}"
                                                              pattern="0.00"
                                                              maxFractionDigits="2"/>
                                            </span>
                                            <c:if test="${cou.crebate!=1}">
                                                <del class="pre-price">${cou.cprice}</del>
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
                                                        <fmt:formatNumber type="number"
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
<script type="text/javascript" src="staticfront/js/jquery.min.js"></script>
<script type="text/javascript" src="staticfront/js/bootstrap.min.js"></script>
</body>
</html>
