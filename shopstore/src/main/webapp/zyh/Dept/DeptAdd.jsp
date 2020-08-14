<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/1/4
  Time: 11:00:39
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
        <form action="/zyh//Dept/add" method="post">
            <table style="width: 100%;" class="table-bordered table-condensed table-hover table-striped">
                <caption><h3>添加部门</h3></caption>
                <tr>
                    <td>部门名称：</td>
                    <td><input type="text" name="d_name"></td>
                </tr>
                <tr>
                    <td>部门地址：</td>
                    <td><input type="text" name="d_loc"></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="添加" class="btn btn-info">
                        <input type="reset" value="重置" class="btn btn-info">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
