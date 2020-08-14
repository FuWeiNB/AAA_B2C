<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/3/8
  Time: 16:19:20
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
        <form action="/zyh/Supplier/upd?s_id=${one.s_id}" method="post">
            <table style="width: 100%;" class="table-bordered table-condensed table-hover table-striped">
                <caption><h3>修改信息</h3></caption>
                <tr>
                    <td>供应商名称：</td>
                    <td><input type="text" name="s_name" value="${one.s_name }"></td>
                </tr>
                <tr>
                    <td>供应商类别：</td>
                    <td>
                        <select class="select" name="c_id">
                            <c:forEach var="pro" items="${Product_ca }">
                                <option value="${pro.c_Id }" ${pro.c_Id == one.c_id ? 'selected' : '' }>${pro.c_Name}</option>
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
