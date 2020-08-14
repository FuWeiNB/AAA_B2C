<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/4
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="/ass/css/amazeui.css" />
    <script type="text/javascript" src="/ass/js/jquery-1.8.3.min.js"></script>
    <link href="/ass/css/dlstyle.css" rel="stylesheet" type="text/css">
    <link rel="icon" href="http://59f2dea8d2c25.t73.qifeiye.com/qfy-content/uploads/2017/11/aa9891e0a41a8c53b41cdac4fe8d3526.png" type="image/png"/>
</head>
<body>
<div style="width:100%;height:100px;background: white;">
    <div style="width:200px;height:80px;margin:0px 0px 0px 175px;float:left">
        <img src="/ass/img/LOGO.png" />
    </div>
    <div style="float: left;margin-left:480px;padding-top:50px ;color:#999999;font-size:15px; width:150px;height:100px;text-align: center;">
        <span>欢迎来到一醉坊！</span>
    </div>
    <div style="float: left;color:#0066cc;padding-top:50px;">
        <a href="/login/beforeRegister.jsp" style="color:#0066cc;font-size: 15px;">免费注册</a>
    </div>
</div>
<div class="login-banner" id="head">
    <div class="login-main">
        <div class="login-banner-bg"><span></span>

            <div class="login-box">

                <h3 class="title">登录商城</h3>

                <div class="clear"></div>
                <form action="${pageContext.servletContext.contextPath }/loginServlet" method="post">
                    <div class="user-name">
                        <label for="user"><i class="am-icon-user" style="margin-top:10px"></i></label>
                        <input type="text" name="name" id="user" placeholder="邮箱/手机/用户名">
                    </div>
                    <div id="name" style="width:150px;height:20px;border:0px solid red;font-size:12px;float:right;color: red;">

                    </div>
                    <div style="margin-top:30px;" class="user-pass">
                        <label for="password"><i class="am-icon-lock" style="margin-top:15px"></i></label>
                        <input type="password" name="pass" id="password" placeholder="请输入密码">
                    </div>
                    <div id="pass" style="width:75px;height:20px;border:0px solid red;font-size:12px;float:right;color: red;">

                    </div>
                    <div style="margin-top:50px;" class="am-cf">
                        <input type="submit" name="" style="width:319px;" value="登 录" class="am-btn am-btn-primary am-btn-sm">
                    </div>
                    <span id="shows" style="color:red">${msg }</span>
                </form>

            </div>

        </div>
    </div>



    <div class="footer" style="margin-left:350px;">
        <div class="footer-hd" style="margin-left:200px;">
            <p>
                <a href="# ">关于我们</a>
                <b>|</b>
                <a href="/index.jsp">商城首页</a>
                <b>|</b>
                <a href="# ">友情提示</a>
                <b>|</b>
                <a href="# ">物流</a>
            </p>
        </div>
        <div class="footer-bd ">
            <p>
                <a href="# ">关于一醉坊</a>
                <a href="# ">合作伙伴</a>
                <a href="# ">联系我们</a>
                <a href="# ">网站地图</a>
                <em>Copyright©2009-2020 yzf.com, All Rights Reserved 一醉坊(郑州)供应链管理有限公司 版权所有</em>
            </p>
        </div>
    </div>
</body>
<script type="text/javascript">
    window.onload=function(){
        var imgs =["a1.png", "a2.png", "a3.png","a4.png"];    //（设定想要显示的图片）
        var i = 0;

        var head=document.getElementById("head");//获取DIV对象
        head.style.background="url(/ass/img/a1.png)";//设置图片的初始图片为该路径的图片
        head.style.backgroundSize="100% 100%";//设置图片的初始图片的尺寸大小
        function time(){
            i++;
            if(i==4)
            {
                i=0;
            }
            head.style.background="url(/ass/"+"img/"+imgs[i]+")";
            head.style.backgroundSize="100% 100%";
        }
        //循环调用time1()函数，时间间隔为2000ms
        //setInterval()函数，按照指定的周期（按毫秒计）来调用函数或表达式
        setInterval(time,2000);
    }

    var flag_name = false;
    var flag_pass = false;
    var flag_email = false;
    var flag_phone = false;
    //汉字格式
    var chinese = /^[\u4e00-\u9fa5]+$/;
    //邮箱格式
    var email = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
    //手机号格式
    var phone = /^1[345789]\d{9}$/;
    //密码安全性
    var passinfo = /^[A-Za-z0-9]+$/;

    $("form").submit(function ()
    {
        return flag_pass&&flag_name&&flag_email&&flag_phone;
    })
    $("input[type='text']").blur(function ()
    {
        //清除提示信息
        $("#name").text("");
        $("#shows").text("");
        if($(this).val() == "")
        {
            $("#name").text("请输入用户名/邮箱/手机号");
            flag_name = false;
            flag_email = false;
            flag_phone = false;
        }
        else if(!chinese.test($(this).val())&&!email.test($(this).val())&&!phone.test($(this).val()))
        {
            $(this).val("");
            $("#name").text("请输入正确格式！");
            flag_name = false;
            flag_email = false;
            flag_phone = false;
        }
        else
        {
            flag_name = true;
            flag_email = true;
            flag_phone = true;
        }
    })
    $("input[type='password']").blur(function ()
    {
        //清除提示信息
        $("#pass").text("");
        if($(this).val() == "")
        {
            $("#pass").focus();
            $("#pass").text("请输入密码");
            flag_pass = false;
        }
        //密码长度6~18
        else if($(this).val().length<6||$(this).val().length>18)
        {
            $("#pass").text("密码长度只能为6~18位")
            flag_pass = false;
        }
        else if(!passinfo.test($(this).val()))
        {
            $(this).val("")
            $("#pass").text("密码只能是数字和字母")
            flag_pass = false;
        }
        else
        {
            flag_pass = true;
        }
    })


</script>
</body>
</html>
