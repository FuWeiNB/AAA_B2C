<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/1/7
  Time: 15:17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../Deploy.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width: 50%; margin: auto;">
    <form action="/zyh/Power/upd?p_id=${one.p_id}" method="post">
        <table style="width: 100%;" class="table-bordered table-condensed table-hover table-striped">
            <caption><h3>修改权力</h3></caption>
            <tr>
                <td>权力名称：</td>
                <td><input type="text" name="p_name" value="${one.p_name}"></td>
            </tr>
            <tr>
                <td>所属权力：</td>
                <td>
                    <select class="select" name="mgr">
                        <c:forEach var="rank" items="${mgr }">
                            <c:forEach var="pw" items="${all }">
                                <c:if test="${rank.mgr == pw.p_id}">
                                    <option value="${rank.mgr}" ${one.mgr == pw.p_id ? 'selected' : ''}>${pw.p_name}</option>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" class="btn btn-info" value="修改">
                    <input type="reset" class="btn btn-info" value="重置">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
