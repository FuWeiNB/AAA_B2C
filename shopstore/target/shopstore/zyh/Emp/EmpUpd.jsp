<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/1/7
  Time: 10:01:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../Deploy.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/zyh/Emp/upd?e_id=${one.e_id}" method="post">
    <table>
        <caption><h3>修改员工信息</h3></caption>
        <tr>
            <td>员工姓名:</td>
            <td><input type="text" name="e_name" value="${one.e_name}"></td>
        </tr>
        <tr>
            <td>登录密码:</td>
            <td><input type="password" name="e_pass" value="${one.e_pass}"></td>
        </tr>
        <tr>
            <td>所属部门:</td>
            <td>
                <select id="dp" class="select" onchange="Ajax(this.value, 'rl')">
                    <option value="-1">--请选择--</option>
                    <c:forEach var="dept" items="${dept }">
                        <option value="${dept.d_id }" ${one.d_id == dept.d_id ? 'selected' : ''}>${dept.d_name }</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>选择职位:</td>
            <td>
                <select id="rl" class="select" name="r_id">
                    <option value="-1">--请选择--</option>
                    <c:forEach var="role" items="${role }">
                        <option value="${role.r_id}" ${role.r_id == one.r_id ? 'selected' : ''}>${role.r_name }</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" class="btn btn-info" value="修改员工"></td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    function Ajax(i, j){
        $.ajax({
            url:'/zyh/Emp/getRole',
            type:'get',
            data:{"d_id":i},
            dataType:'html',
            success:function (data) {
                $("#"+j).html(data);
            }
        })
    }
</script>
</body>
</html>
