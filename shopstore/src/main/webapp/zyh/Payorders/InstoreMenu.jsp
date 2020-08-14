<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/3/11
  Time: 16:33:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../Deploy.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    ${payorders.pay_id }&nbsp;&nbsp;&nbsp;
    ${payorders.pay_date }&nbsp;&nbsp;&nbsp;
    ${payorders.pay_price }&nbsp;&nbsp;&nbsp;
    <input type="button" onclick="back(${now})" class="btn btn-info" value="返回">
    <hr />
    <div style="width: 50%;margin: auto;">
    <table border="1" style="width: 100%; margin: 0 auto;" class="table table-hover table-bordered table-striped">
        <caption><h1>商品信息</h1></caption>
        <tr>
            <th>商品名称</th>
            <th>商品进价</th>
            <th>购买数量</th>
            <th>小计</th>
        </tr>
        <c:forEach items="${detils }" var="m">
            <tr>
                <td>${m.m_name }</td>
                <td>${m.m_oldprice }</td>
                <td>${m.in_num2 }</td>
                <td>${m.in_price2}</td>
            </tr>
        </c:forEach>
    </table>
    </div>
<script type="text/javascript">
    function back(now) {
        location.href = "/zyh/Payorders/OrdersFind?nowpage="+now;
    }
</script>
</body>
</html>
