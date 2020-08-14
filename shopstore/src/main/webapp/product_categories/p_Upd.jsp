<%--

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../css/font.css">
<link rel="stylesheet" href="../css/xadmin.css">
<script src="../lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/xadmin.js"></script>
<script src="../js/jquery-1.8.3.min.js"></script>

<html>
<head>
    <title></title>

</head>
<body>
<form action="p_Update" method="post" >
    <table class="layui-table layui-form">
        <tbody class="x-cate">
        <tr>
            <td>栏目名称：</td>
            <td><input type="text" name="c_Name" value="${c_Name }" class="layui-input"></td>
        </tr>
        <tr>
            <td colspan="2">
                <center><input type="submit" class="layui-btn" value="修改"></center>
                <input type="hidden" name="c_Id" value="${c_Id }">
            </td>
        </tr>
        </tbody>
    </table>
</form>
<script>


        $("input[type='submit']").click(function () {
            alert('修改成功!');
            xadmin.close();
            xadmin.father_reload();
        })
</script>
</body>
</html>
