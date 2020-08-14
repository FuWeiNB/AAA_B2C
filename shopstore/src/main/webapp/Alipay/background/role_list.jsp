<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>tit</title>
    <link type="text/css" rel="stylesheet" media="all" href="../../../../../target/Hotel/WEB-INF/classes/META-INF/resources/background/styles/global.css" />
    <link type="text/css" rel="stylesheet" media="all" href="../../../../../target/Hotel/background/styles/global_color.css" />
    <script language="javascript" type="text/javascript">
        function deleteRole() {
            var r = window.confirm("确定要删除此角色吗？");
            document.getElementById("operate_result_info").style.display = "block";
        }
    </script>
</head>
<body>
<!--Logo区域开始-->
<div id="header">
    <img src="../../../../../target/Hotel/WEB-INF/classes/META-INF/resources/background/images/logo.png" alt="logo" class="left"/>
    <a href="#">[退出]</a>
</div>
<!--Logo区域结束-->
<!--导航区域开始-->
<div id="navi">
    <ul id="menu">
        <li><a href="../../../../../target/Hotel/background/index.jsp" class="index_on"></a></li>
        <li><a href="../../../../../target/Hotel/background/role_list.jsp" class="role_off"></a></li>
        <li><a href="../../../../../target/classes/META-INF/resources/background/admin_list.jsp" class="admin_off"></a></li>
        <li><a href="../../../../../target/classes/META-INF/resources/background/fee_list.jsp" class="fee_off"></a></li>
        <li><a href="../../../../../target/Hotel/WEB-INF/classes/META-INF/resources/background/account_list.jsp" class="account_off"></a></li>
        <li><a href="../../../../../target/Hotel/background/service_list.jsp" class="service_off"></a></li>
        <li><a href="bill_list.jsp" class="bill_off"></a></li>
        <li><a href="report_list.jsp" class="report_off"></a></li>
        <li><a href="../../../../../target/Hotel/WEB-INF/classes/META-INF/resources/background/user_info.jsp" class="information_off"></a></li>
        <li><a href="../../../../../target/Hotel/background/user_modi_pwd.jsp" class="password_off"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <form action="" method="">
        <!--查询-->
        <div class="search_add">
            <input type="button" value="增加" class="btn_add" onclick="location.href='role_add.jsp';" />
        </div>
        <!--删除的操作提示-->
        <div id="operate_result_info" class="operate_success">
            <img src="images/close.png" onclick="this.parentNode.style.display='none';" />
            删除成功！
        </div> <!--删除错误！该角色被使用，不能删除。-->
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th>角色 ID</th>
                    <th>角色名称</th>
                    <th class="width600">拥有的权限</th>
                    <th class="td_modi"></th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>贾强</td>
                    <td>角色管理、管理员管理、资费管理、账务账号、业务账号、账单、报表</td>
                    <td>
                        <input type="button" value="修改" class="btn_modify" onclick="location.href='role_modi.jsp';"/>
                        <input type="button" value="删除" class="btn_delete" onclick="deleteRole();" />
                    </td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>贾强</td>
                    <td>超级管理员、账单管理员</td>
                    <td>
                        <input type="button" value="修改" class="btn_modify" />
                        <input type="button" value="删除" class="btn_delete" />
                    </td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>贾强</td>
                    <td>超级管理员、账单管理员</td>
                    <td>
                        <input type="button" value="修改" class="btn_modify" />
                        <input type="button" value="删除" class="btn_delete" />
                    </td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>贾强</td>
                    <td>超级管理员、账单管理员</td>
                    <td>
                        <input type="button" value="修改" class="btn_modify" />
                        <input type="button" value="删除" class="btn_delete" />
                    </td>
                </tr>
            </table>
        </div>
        <!--分页-->
        <div id="pages">
            <a href="#">上一页</a>
            <a href="#" class="current_page">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">下一页</a>
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">
    <p>xxxxxxxxxxxxx </p>
</div>
</body>
</html>
