<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/4
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" href="${pageContext.servletContext.contextPath }/assets/css/bootstrap.css" rel="stylesheet" />
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="Update?user=${map.user }" method="post">
    <table class="table table-bordered table-hover" style="width: 80%;margin: auto;">
        <caption><h1>用户修改</h1></caption>
        <tr>
            <td>用户:</td>
            <td>
                <input type="text" name="name" value="${map.email == "" ? map.a_phone:map.email}" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td>用户状态</td>
            <td>
                <input type="radio" name="flag" ${map.flag == 0 ? 'checked' : '' } value="0"/>正常
                <input type="radio" name="flag" ${map.flag == 1 ? 'checked' : '' } value="1"/>禁用
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <input type="submit" value="提交"  class="btn btn-info" />
                <a href="/admin/findAll" class="btn btn-info">取消</a>
            </td>
        </tr>

    </table>

</form>
</body>
</html>
