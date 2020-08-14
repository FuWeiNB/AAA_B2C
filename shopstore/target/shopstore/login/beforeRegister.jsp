<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/4
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="/ass/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
    <link href="/ass/css/dlstyle.css" rel="stylesheet" type="text/css">
    <script src="/ass/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="/ass/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
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
        <a href="/login/beforeLogin.jsp" style="color:#0066cc;font-size: 15px;">登录</a>
    </div>
</div>

<div class="res-banner" style="background-image: url(/ass/img/广告.jpg);" >
    <div class="res-main">
        <div class="login-banner-bg"><span></span></div>
        <div class="login-box">

            <div class="am-tabs" id="doc-my-tabs">
                <ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
                    <li class="am-active"><a href="">邮箱注册</a></li>
                    <li><a href="">手机号注册</a></li>
                </ul>

                <div class="am-tabs-bd">
                    <div class="am-tab-panel am-active">
                        <form method="post" οnsubmit="return false"   id="loginForms">
                            <div class="user-email">
                                <label for="email" style="margin-top:10px;height:30px"><i class="am-icon-envelope-o"></i></label>
                                <input type="email" name="email" id="email" placeholder="邮箱账号">
                            </div>
                            <div class="verification" style="width:400px;">
                                <label for="code" style="margin-top:10px;height:30px"><i class="am-icon-code-fork"></i></label>
                                <input type="tel" style="width: 250px;" name="yzm" id="codes" placeholder="验证码"  onchange="toyans()">
                                <button type="button" id="sendMobileCodes">获取</button>
                            </div>
                            <div class="user-pass">
                                <label for="password" style="margin-top:10px;height:30px"><i class="am-icon-lock"></i></label>
                                <input type="password" name="pass" id="passwords" placeholder="密码">
                            </div>
                            <div class="user-pass">
                                <label for="passwordRepeat" style="margin-top:10px;height:30px"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" id="passwordRepeats" placeholder="确认密码">
                            </div>
                        </form>
                            <div class="am-cf">
                                <input type="submit" name="" id="resbtn" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
                            </div>



                    </div>

                    <div class="am-tab-panel">
                        <form method="post"  id="loginForm" οnsubmit="return false">
                            <div class="user-phone">
                                <label for="phone" style="margin-top:10px;height:30px"><i class="am-icon-mobile-phone am-icon-md"></i></label>
                                <input type="tel" name="phone" id="phone" placeholder="手机号">
                            </div>
                            <div class="verification" style="width:400px;">
                                <label for="code" style="margin-top:10px;height:30px"><i class="am-icon-code-fork"></i></label>
                                <input type="tel" name="" style="width: 250px;" id="code" placeholder="验证码" onchange="toyan()">
                                <button type="button" id="sendMobileCode">获取</button>
                            </div>
                            <div class="user-pass">
                                <label for="password" style="margin-top:10px;height:30px"><i class="am-icon-lock"></i></label>
                                <input type="password" name="pass" id="password" placeholder="密码">
                            </div>
                            <div class="user-pass">
                                <label for="passwordRepeat" style="margin-top:10px;height:30px"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" id="passwordRepeat" placeholder="确认密码">
                            </div>
                        </form>
                            <div class="am-cf">
                                <input type="submit" name="" id="res-btn"  value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
                            </div>
                        <hr>
                    </div>

                    <script>
                        $(function() {
                            $('#doc-my-tabs').tabs();
                        })
                    </script>

                </div>
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
</div>
    <script type="text/javascript">
        // //checkbox复选框选中与未选中时触发的事件
        // function checkboxOnclick(checkbox)
        // {
        //     if(checkbox.checked == false)
        //     {
        //         $('#reader-me').focus();
        //         alert("请勾选《服务协议》！");
        //     }
        // }

//手机号验证码倒计时
        var time = 60;
        function roof()
        {

            if(time == 0)
            {
                $('#sendMobileCode').text('('+time+'s)');
                $('#sendMobileCode').prop('disabled',false);
                $('#sendMobileCode').text('获取');
                time = 60;
                return
            }
            $('#sendMobileCode').text('('+time+'s)');
            time--;

            setTimeout(roof,1000);
        }

        //手机号验证码按钮点击事件
        $('#sendMobileCode').on('click',function()
        {
            var shouji = $("input[id=phone]").val();
            if(!shouji)
            {
                $('#phone').focus();
                document.querySelector('#phone').placeholder = '请填写手机号码';
            }
            else
            {
                $(this).prop('disabled',true);
                roof();
                var phone = $("input[id='phone']").val();
                <%--            <%--%>
                <%--                 Test1.main();--%>
                <%--            %>--%>
                $.ajax({
                    type:"get",
                    url:"${pageContext.servletContext.contextPath }/SendMessage/sendM",
                    data:{"phone":phone},
                    dataType:"json",
                    success:function(data){

                    }

                });
            }

        });

//手机号验证码文本框校验
        function toyan()
        {
            var yan = $("input[id='code']").val();
            $.ajax({
                type:"post",
                url:"${pageContext.servletContext.contextPath }/SendMessage/toequals",
                data:{"yan":yan},
                dataType:"json",
                success:function(data){
                    if(data === 1)
                    {
                        alert("验证码有误！");
                        $("#code").val("");
                        document.querySelector('#code').placeholder = '请输入正确的验证码！';
                    }
                }

                })
        }

//邮箱验证码倒计时
        var times = 60;
        function roofs()
        {

            if(times == 0){
                $('#sendMobileCodes').text('('+times+'s)');
                $('#sendMobileCodes').prop('disabled',false);
                $('#sendMobileCodes').text('获取');
                times = 60;
                return
            }
            $('#sendMobileCodes').text('('+times+'s)');
            times--;

            setTimeout(roofs,1000);
        }

//邮箱发送验证码按钮点击事件
        $('#sendMobileCodes').on('click',function()
        {
            var email = $("input[id='email']").val();
            //先判断是email否为空，如果为空，则选中填写，否则去发送邮件
            if(!email)
            {
                $("input[id='email']").focus();
                document.querySelector("input[id='email']").placeholder = '请填写邮箱地址!';
            }
            else
            {
                $(this).prop('disabled',true);
                roofs();
                var email = $("input[id='email']").val();
                <%--            <%--%>
                <%--                 Test1.main();--%>
                <%--            %>--%>
                $.ajax({
                    type:"post",
                    url:"${pageContext.servletContext.contextPath }/MailUtils/sendEmail",
                    data:{"email":email},
                    dataType:"json",
                    success:function(data){

                    }

                });
            }

        });
//邮箱验证码文本框校验
        function toyans()
        {
            var ma = $("input[id='codes']").val();
            $.ajax({
                type:"post",
                url:"${pageContext.servletContext.contextPath }/MailUtils/Toe",
                data:{"ma":ma},
                dataType:"json",
                success:function(data){
                    if(data == 1)
                    {
                        alert("验证码有误！");
                        $("#codes").val("");
                        document.querySelector('#codes').placeholder = '请输入正确的验证码！';
                    }
                }

            })
        }
        //手机号格式
        var phones = /^1[345789]\d{9}$/;
        //密码安全性
        var passinfo = /^[A-Za-z0-9]+$/;
        //验证码格式
        var yanzhengmas = /^\d{6}$/;

//手机号注册按钮点击事件加校验
        $('#res-btn').on('click',function()
        {
            var phone = $("input[id='phone']").val();
            var code = $('#code').val();
            var password = $('#password').val();
            var passwordRepeat = $('#passwordRepeat').val();
            if(!phone){
                $("input[id='phone']").focus();
                document.querySelector("input[id='phone']").placeholder = '请填写手机号码';
                $("input[id='phone']").css("color","red");
                return
            }
            else if(!phones.test($("input[id='phone']").val()))
            {
                $("input[id='phone']").val("");
                $("input[id='phone']").focus();
                document.querySelector("input[id='phone']").placeholder = '请输入正确格式！';
                return
            }

            if(!code){
                $('#code').focus();
                document.querySelector('#code').placeholder = '请填写验证码';
                return
            }
            else if(!yanzhengmas.test($('#code').val()))
            {
                $('#code').val("");
                $("#code").focus();
                document.querySelector('#code').placeholder = '验证码为6位数字！';
                return
            }
            if(!password){
                $('#password').focus();
                document.querySelector('#password').placeholder = '请填写密码';

                return
            }
            //密码格式
            else if(!passinfo.test($('#password').val()))
            {
                $('#password').val("");
                $("#password").focus();
                document.querySelector('#password').placeholder = '密码只能是数字和字母';
                return
            }
            //密码长度6~18
            else if($('#password').val().length<6||$('#password').val().length>18)
            {
                $('#password').val("");
                $('#password').focus();
                $('#password').text("密码长度只能为6~18位");
                return
            }
            if(!passwordRepeat){
                $('#passwordRepeat').focus();
                document.querySelector('#passwordRepeat').placeholder = '请填写重复密码';
                return
            }
            //判断密码是否相等
            else if(passwordRepeat !== password){
                $('#passwordRepeat').focus();
                document.querySelector('#passwordRepeat').value = '';
                document.querySelector('#passwordRepeat').placeholder = '两次密码不一致';
                return
            }
            $(this).prop('disabled',true);
            $.ajax({
                type:"post",
                url:"/formController/toform",
                data:$("#loginForm").serialize(),
                dataType:"json",
                success:function (result) {
                    if(result==1){
                        //alert("成功");
                        alert('注册成功,请进行登录');
                       location.href="/login/beforeLogin.jsp";
                    }
                    else if(result == 0){
                        var con = confirm("该账户已被注册！是否去登录");
                        if(con)
                        {
                            location.href="/login/beforeLogin.jsp";
                        }
                    }
                }
            })
        })


//邮箱注册按钮点击事件加校验
        //邮箱格式
        var emailgs = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        //密码安全性
        var passinfos = /^[A-Za-z0-9]+$/;
        //验证码格式
        var yanzhengmass = /^\d{6}$/;

        $('#resbtn').on('click',function()
        {
            var email = $('#email').val();
            var codes = $('#codes').val();
            var passwords = $('#passwords').val();
            var passwordRepeats = $('#passwordRepeats').val();

            if(!email)
            {
                $('#email').focus();
                document.querySelector('#email').placeholder = '请填写邮箱地址';
                return
            }
            else if(!emailgs.test($('#email').val()))
            {
                $('#email').val("");
                $("#email").focus();
                document.querySelector('#email').placeholder = '请输入正确格式！';
                return
            }
            if(!codes){
                $('#codes').focus();
                document.querySelector('#codes').placeholder = '请填写验证码';
                return
            }
            else if(!yanzhengmass.test($('#codes').val()))
            {
                $('#codes').val("");
                $("#codes").focus();
                document.querySelector('#codes').placeholder = '验证码为6位数字！';
                return
            }
            if(!passwords){
                $('#passwords').focus();
                document.querySelector('#passwords').placeholder = '请填写密码';
                return
            }
            //密码格式
            else if(!passinfos.test($('#passwords').val()))
            {
                $('#passwords').val("");
                $("#passwords").focus();
                document.querySelector('#passwords').placeholder = '密码只能是数字和字母';
                return
            }
            //密码长度6~18
            else if($('#passwords').val().length<6||$('#passwords').val().length>18)
            {
                $('#passwords').val("");
                $('#passwords').focus();
                $('#passwords').text("密码长度只能为6~18位");
                return
            }
            if(!passwordRepeats)
            {
                $('#passwordRepeats').focus();
                document.querySelector('#passwordRepeats').placeholder = '请填写重复密码';
                return
            }
            //判断密码是否相等
            else if(passwordRepeats !== passwords)
            {
                $('#passwordRepeats').focus();
                document.querySelector('#passwordRepeats').value = '';
                document.querySelector('#passwordRepeats').placeholder = '两次密码不一致';
                return
            }

            $('#resbtn').prop('disabled');

            $.ajax({

                type:"post",
                url:"/formController/toform",
                data:$("#loginForms").serialize(),
                dataType:"json",
                success:function (result) {
                    //alert(result);
                    if(result==1){
                        //alert("成功");
                        alert('注册成功,请进行登录');
                        location.href="/login/beforeLogin.jsp"
                    }
                    else if(result == 0){
                        var con = confirm("该账户已被注册！是否去登录");
                        if(con)
                        {
                            location.href="/login/beforeLogin.jsp";
                        }
                    }
                }
            })
        })


    </script>
</body>
</html>
