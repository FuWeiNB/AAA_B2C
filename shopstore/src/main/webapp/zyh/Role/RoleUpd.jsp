<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/3/5
  Time: 18:04:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../Deploy.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/zyh/Role/upd?r_id=${c.r_id }" method="post">
        <table>
            <caption>分配权限</caption>
            <tr>
                <td>角色编号:${c.r_id }</td>
                <td>角色名称:${c.r_name }</td>
            </tr>
            <tr>
                <td></td>
                <td>职位名称</td>
            </tr>
            <c:forEach var="map" items="${power }">
                <tr>
                    <td><input type="checkbox" name="p_id" value="${map.p_id }" ${map.checked == "checked" ? 'checked' : '' } /></td>
                    <td>${map.p_name }</td>
                </tr>
            </c:forEach>
            <tr>
                <td><input type="submit" class="btn btn-info" value="分配"></td>
            </tr>
        </table>
    </form>
</body>
</html>
