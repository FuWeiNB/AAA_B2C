<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/3/16
  Time: 15:41:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../Deploy.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/zyh/Payorders/PayordersTotro" method="get">
    <table border="1" style="width: 80%; margin: 0 auto;"
           class="table table-hover table-bordered table-striped">
        <caption>
            <h1>采购单</h1>
        </caption>
        <tr>
            <th>商家</th>
            <th>商品名称</th>
            <th>商品进价</th>
            <th>购买数量</th>
            <th>小计</th>
        </tr>
        <c:set var="Stotal" value="0"></c:set>
        <c:forEach var="map" items="${trolley }">
            <tr>
                <td>${map.value.s_name }
                    <input type="hidden" value="${map.value.m_id}" name="m_id">
                    <input type="hidden" name="s_id" value="${map.value.s_id }">
                </td>
                <td>${map.value.m_name }
                    <input type="hidden" name="m_name" readonly="readonly" value="${map.value.m_name }" />
                </td>
                <td>${map.value.m_oldprice }
                    <input type="hidden" name="m_oldprice" readonly="readonly" value="${map.value.m_oldprice }" />
                </td>
                <td>${map.value.number }
                    <input type="hidden" name="oldnumber" readonly="readonly" value="${map.value.number }" />
                </td>
                <td>${map.value.m_oldprice*map.value.number}
                    <input type="hidden" readonly="readonly" name="ctotal" value="${map.value.m_oldprice*map.value.number}" ${Stotal = map.value.m_oldprice*map.value.number + Stotal}></td>
            </tr>
        </c:forEach>
        <tr>
            <td>总计:<input type="hidden" readonly="readonly" value="${Stotal}" id="total" name="Stotal">${Stotal}</td>
            <td colspan="5" align="right"><input class="btn btn-info"type="submit" value="生成" /></td>
        </tr>
    </table>
</form>
</body>
</html>
