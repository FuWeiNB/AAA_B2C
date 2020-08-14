
<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/1/6
  Time: 13:30:56
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
    <form action="/zyh/Emp/add" method="post">
        <table style="width: 100%;" class="table-bordered table-condensed table-hover table-striped">
            <caption><h3>添加员工</h3></caption>
            <tr>
                <td>员工姓名:</td>
                <td><input type="text" name="e_name"></td>
            </tr>
            <tr>
                <td>所属部门:</td>
                <td>
                    <select id="dp" class="select" onchange="Ajax(this.value, 'rl')">
                        <option value="-1">--请选择--</option>
                        <c:forEach var="dept" items="${dept }">
                            <option value="${dept.d_id }">${dept.d_name }</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>选择职位:</td>
                <td>
                    <select id="rl" class="select" name="r_id">
                        <option value="-1">--请选择--</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="添加员工" class="btn btn-info"></td>
            </tr>
        </table>
    </form>
</div>
    <script type="text/javascript">
        function Ajax(i, j){
            $.ajax({
                url:'/zyh/Emp/getRole',
                type:'get',
                data:{"d_id":i},
                dataType:'html',
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                success:function (data) {
                    $("#"+j).html(data);
                }
            })
        }
    </script>
</body>
</html>
