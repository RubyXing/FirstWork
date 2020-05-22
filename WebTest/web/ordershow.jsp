<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%String title = "课程列表页"; %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="staticfront/css/carts.css">
<link rel="stylesheet" type="text/css" href="staticfront/css/reset.css">

<section class="cartMain">
    <div class="cartMain_hd">
        <ul class="order_lists cartTop">
            <li class="list_con">商品信息</li>
            <li class="list_info"></li>
            <li class="list_price"></li>
            <li class="list_amount">数量</li>
            <li class="list_sum">金额</li>
        </ul>
    </div>
    <%int i = 0;%>
    <c:forEach items="${orderlist}" var="listo">
        <div class="cartBox">
            <div class="shop_info">
                <div class="shop_name">
                    订单号：${listo.lid}&nbsp;&nbsp;&nbsp;&nbsp;
                    时间：${listo.ldate}
                </div>
            </div>
            <c:forEach items="${orderdetail}" var="detail">
                <c:if test="${detail.oid==listo.lid}">
                    <%i++;%>
                    <div class="order_content">
                        <ul class="order_lists">
                            <li class="list_chk" style="display: none">
                                <input type="checkbox" id="checkbox_<%=i%>" class="son_check">
                                <label for="checkbox_<%=i%>"></label>
                            </li>
                            <li class="list_con">
                                <div class="list_img"><a href="javascript:;"><img src="${detail.cimg}" alt=""></a></div>
                                <div class="list_text"><a href="javascript:;">${detail.cname}</a></div>
                            </li>
                            <li class="list_info">
                            </li>
                            <li class="list_price">
                            </li>
                            <li class="list_amount">
                                <div class="amount_box">
                                    <input type="text" value="${detail.lnum}" class="sum">
                                </div>
                            </li>
                            <li class="list_sum">
                                <p class="sum_price">￥${detail.lprice}</p>
                            </li>
                            <li class="list_op">
                            </li>
                        </ul>
                    </div>
                </c:if>
            </c:forEach>
            <div class="bar-wrapper">
                <div class="bar-right">
                    <div class="totalMoney">共计: <strong class="total_text">1</strong></div>
                    <div class="calBtn"><a href="javascript:;">
                        <c:choose>
                            <c:when test="${listo.lstate==0}">
                                待支付
                            </c:when>
                            <c:otherwise>
                                已支付
                            </c:otherwise>
                        </c:choose>
                    </a></div>
                </div>
            </div>
        </div>
    </c:forEach>
</section>
<section class="model_bg"></section>


<jsp:include page="footer.jsp"/>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        var total_money = 0;
        $(".sum_price").each(function () {
            var goods = parseFloat($(this).parents('.order_lists').find('.sum_price').html().substring(1));
            total_money += goods;
        });
        $('.total_text').html('￥' + total_money);
    });
</script>
</body>
</html>
