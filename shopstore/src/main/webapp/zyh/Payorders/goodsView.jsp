<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/3/10
  Time: 15:46:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../Deploy.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width: 50%;margin: auto;">
    <form action="/zyh/Payorders/trolley?m_id=${one.m_id}" method="post">
        <table border="1" style="width:80%; margin: 0 auto;" class="table table-bordered table-hover table-striped">
            <tr>
                <td>商品名称</td>
                <td><input type="text" name="m_name" value="${one.m_name }" readonly="readonly" /></td>
            </tr>
            <tr>
                <td>商品进价</td>
                <td><input type="text" name="m_oldprice" value="${one.m_oldprice }" readonly="readonly" /></td>
            </tr>
            <tr>
                <td>购买数量</td>
                <td><input type="number" name="number" placeholder="1~100" value="1" oninput="if(value > 100 || value < 1 ){alert('最大购买量为100,最小购买量为1'); value=''}" /></td>
            </tr>
            <tr>
                <td>选择商家</td>
                <td>
                    <select class="select" name="s_id">
                        <c:forEach var="map" items="${supplier }">
                            <option value="${map.s_id }">${map.s_name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="加入采购单" class="btn btn-success" />
                    <a href="/zyh/Payorders/goodsfindAll" class="btn btn-info" >返回</a>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
