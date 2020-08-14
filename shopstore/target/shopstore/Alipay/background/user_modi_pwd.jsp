<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>tit</title>
    <link type="text/css" rel="stylesheet" media="all" href="../../../../../target/Hotel/WEB-INF/classes/META-INF/resources/background/styles/global.css" />
    <link type="text/css" rel="stylesheet" media="all" href="../../../../../target/Hotel/background/styles/global_color.css" />
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
<div id="main">
    <!--保存操作后的提示信息：成功或者失败-->
    <div id="save_result_info" class="save_success">保存成功！</div><!--保存失败，旧密码错误！-->
    <form action="" method="" class="main_form">
        <div class="text_info clearfix"><span>旧密码：</span></div>
        <div class="input_info">
            <input type="password" class="width200"  /><span class="required">*</span>
            <div class="validate_msg_medium">30长度以内的字母、数字和下划线的组合</div>
        </div>
        <div class="text_info clearfix"><span>新密码：</span></div>
        <div class="input_info">
            <input type="password"  class="width200" /><span class="required">*</span>
            <div class="validate_msg_medium">30长度以内的字母、数字和下划线的组合</div>
        </div>
        <div class="text_info clearfix"><span>重复新密码：</span></div>
        <div class="input_info">
            <input type="password" class="width200"  /><span class="required">*</span>
            <div class="validate_msg_medium">两次新密码必须相同</div>
        </div>
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save" onclick="showResult();" />
            <input type="button" value="取消" class="btn_save" />
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">
    xxxxxxxx
</div>
</body>
</html>
