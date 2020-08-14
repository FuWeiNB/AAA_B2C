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
    <table class="layui-table layui-form">
        <tbody class="x-cate">
        <tr>
            <td>子栏目名称：</td>
            <td><input type="text" name="c_Name" id="c_Name" class="layui-input"></td>
        </tr>
        <tr>
            <td colspan="2">
                <center><button class="layui-btn" lay-filter="add" lay-submit="">上传</button></center>
                <input type="hidden" name="c_Flag" id="c_Flag" value="${c_Flag }">
            </td>
        </tr>
        </tbody>
    </table>
<script>
    layui.use(['form', 'layer'], function() {
            $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;

         form.on('submit(add)',
             function(data) {
            var c_Name = data.field.c_Name;
            var c_Flag = data.field.c_Flag;
            $.ajax({
                url:"/p_Insert",
                type:"post",
                data:{"c_Name":c_Name,"c_Flag":c_Flag},
                dataType:"JSON",
                success:function (data)
                {
                    layer.alert("增加成功", {
                    icon: 6
                    },
                    function() {
                        //关闭当前frame
                        xadmin.close();
                        // 可以对父窗口进行刷新
                        xadmin.father_reload();

                    });
                }
            });
            return false;
        });
        })
</script>
</body>
</html>
