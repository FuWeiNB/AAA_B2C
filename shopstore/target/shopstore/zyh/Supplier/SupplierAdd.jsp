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
        <form action="/zyh/Supplier/add" method="post">
            <table style="width: 100%;" class="table-bordered table-condensed table-hover table-striped">
                <caption><h3>添加供应商</h3></caption>
                <tr>
                    <td>供应商名称：</td>
                    <td><input type="text" name="s_name"></td>
                </tr>
                <tr>
                    <td>供应商类别：</td>
                    <td>
                        <select class="select" name="c_id">
                            <c:forEach var="pro" items="${Product_ca }">
                                <option value="${pro.c_Id }">${pro.c_Name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                </tr>
                <tr>
                    <td>
                        <input type="submit" class="btn btn-info" value="添加">
                        <input type="reset" class="btn btn-info" value="重置">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
