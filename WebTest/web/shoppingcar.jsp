<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String title = "购物车"; %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="staticfront/css/carts.css">
<link rel="stylesheet" type="text/css" href="staticfront/css/reset.css">

<section class="cartMain">
    <div class="cartMain_hd">
        <ul class="order_lists cartTop">
            <li class="list_chk">
                <!--所有商品全选-->
                <input type="checkbox" id="all" class="whole_check">
                <label for="all"></label>
                全选
            </li>
            <li class="list_con">商品信息</li>
            <li class="list_price">单价</li>
            <li class="list_amount">数量</li>
            <li class="list_sum">金额</li>
            <li class="list_op">操作</li>
        </ul>
    </div>


    <div class="cartBox">
        <% int i = 0; %>
        <c:forEach items="${course}" var="cou">
            <%i++;%>
            <ul class="order_lists">
                <li class="list_chk">
                    <input type="checkbox" id="checkbox_<%=i%>" class="son_check">
                    <label for="checkbox_<%=i%>"></label>
                </li>
                <li class="list_con">
                    <div class="list_img"><a
                            href="${pageContext.request.contextPath}/detail/course.do?courseId=${cou.cid}"><img
                            src="${cou.cimgaddress}" alt=""></a></div>
                    <div class="list_text"><a
                            href="${pageContext.request.contextPath}/detail/course.do?courseId=${cou.cid}">${cou.cname}</a>
                    </div>
                </li>
                <li class="list_price">
                    <c:choose>
                        <c:when test="${sessionScope.vip==1 && cou.ccondition==403}">
                            <p class="price">¥<fmt:formatNumber type="number"
                                                                value="${cou.cprice*cou.crebate*0.8}"
                                                                pattern="0.00"
                                                                maxFractionDigits="2"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                            <del class="pre-price">¥<fmt:formatNumber type="number"
                                                                      value="${cou.cprice*cou.crebate}"
                                                                      pattern="0.00"
                                                                      maxFractionDigits="2"/></del>
                        </c:when>
                        <c:when test="${sessionScope.vip==1 && cou.ccondition==402}">
                            <p class="price"> ¥0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                            <del class="pre-price">¥${cou.cprice}</del>
                        </c:when>
                        <c:otherwise>
                            <p class="price">¥${cou.cprice}</p>
                        </c:otherwise>
                    </c:choose>

                </li>
                <li class="list_amount">
                    <div class="amount_box">
                        <a href="javascript:;" class="reduce reSty">-</a>
                        <input type="text" value="1" class="sum">
                        <a href="javascript:;" class="plus">+</a>
                    </div>
                </li>
                <li class="list_sum">
                    <c:choose>
                        <c:when test="${sessionScope.vip==1 && cou.ccondition==403}">
                            <p class="sum_price">¥<fmt:formatNumber type="number"
                                                                    value="${cou.cprice*cou.crebate*0.8}"
                                                                    pattern="0.00"
                                                                    maxFractionDigits="2"/></p>
                        </c:when>
                        <c:when test="${sessionScope.vip==1 && cou.ccondition==402}">
                            <p class="sum_price">¥0</p>
                        </c:when>
                        <c:otherwise>
                            <p class="sum_price">¥${cou.cprice}</p>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li class="list_op">
                    <p class="del"><a href="${pageContext.request.contextPath}/shop/delete.do?courseId=${cou.cid}"
                                      class="delBtn">移除商品</a></p>
                </li>
            </ul>
        </c:forEach>
    </div>


    <!--底部-->
    <div class="bar-wrapper">
        <div class="bar-right">
            <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
            <div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
            <div class="calBtn"><a
                    href="${pageContext.request.contextPath}/order/addorder.do?userId=${sessionScope.userid}">结算</a>
            </div>
        </div>
    </div>
</section>
<section class="model_bg"></section>
<section class="my_model">
    <p class="title">删除宝贝<span class="closeModel">X</span></p>
    <p>您确认要删除该宝贝吗？</p>
    <div class="opBtn">
        <a href="javascript:;" class="dialog-sure">确定</a>
        <a href="javascript:;" class="dialog-close">关闭</a>
    </div>
</section>


<jsp:include page="footer.jsp"/>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="staticfront/js/carts.js"></script>
</body>
</html>
