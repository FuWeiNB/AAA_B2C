<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/13
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link href="/ass/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/ass/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="/ass/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/ass/css/stepstyle.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="/ass/js/jquery-1.8.3.min.js"></script>
    <script src="/ass/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
</head>
<body>

<!--头 -->
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!--顶部导航条 -->
            <div class="am-container header" style="background-color: #5e0000;color:white;width:1500px">
                <ul class="message-l" style="color:white">
                    <div class="topMessage">
                        <div class="menu-hd">
                            <c:if test="${$MAP.phone == null && $MAP.email == null }">
                                <a href="/login/beforeLogin.jsp" target="_top" class="h" style="color:white">
                                    亲,登录
                                </a>
                            </c:if>
                            <c:if test="${$MAP.phone != null || $MAP.email != null }">
                                欢迎您${admin_name }登录
                            </c:if>
                            <a href="/toclear" target="_top" style="color:white">退出</a>
                            <a href="/login/beforeRegister.jsp" target="_top" style="color:white">免费注册</a>
                        </div>
                    </div>
                </ul>
                <ul class="message-r" style="color:white">
                    <div class="topMessage home">
                        <div class="menu-hd"><a href="/index.jsp" target="_top" class="h" style="color:white">商城首页</a></div>
                    </div>
                    <div class="topMessage my-shangcheng">
                        <div class="menu-hd MyShangcheng">
                            <a href="javascript:void(0)" onclick="toperson()" target="_top" style="color:white"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
                        </div>
                    </div>

                    <div class="topMessage mini-cart">
                        <div class="menu-hd"><a id="mc-menu-hd" href="/joinroom.jsp" target="_top" style="color:white">
                            <i class="am-icon-shopping-cart  am-icon-fw"></i>
                            <span>客服</span></a></div>
                    </div>
                    <%--<div class="topMessage favorite">
                        <div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>

                    </div>--%>
                </ul>
            </div>
            <!--悬浮搜索框-->

            <div class="nav white">
                <div class="logoBig">
                    <li><img src="/ass/img/LOGO.png" /></li>
                </div>

                <div class="search-bar pr">
                    <a name="index_none_header_sysc" href="#"></a>
                    <form>
                        <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
                        <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
                    </form>
                </div>
            </div>

            <div class="clear"></div>
        </div>
        </div>
    </article>
</header>
<div class="nav-table">
    <div class="long-title"><span class="all-goods">全部分类</span></div>
    <div class="nav-cont">
        <ul>
            <li class="index"><a href="#">首页</a></li>
            <li class="qc"><a href="#">闪购</a></li>
            <li class="qc"><a href="#">限时抢</a></li>
            <li class="qc"><a href="#">团购</a></li>
            <li class="qc last"><a href="#">大包装</a></li>
        </ul>
        <div class="nav-extra">
            <i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
            <i class="am-icon-angle-right" style="padding-left: 10px;"></i>
        </div>
    </div>
</div>
<b class="line"></b>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">

            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
            </div>
            <hr/>
            <!--进度条-->
            <div class="m-progress">
                <div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">重置密码</p>
                            </span>
                    <span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
                    <span class="u-progress-placeholder"></span>
                </div>
                <div class="u-progress-bar total-steps-2">
                    <div class="u-progress-bar-inner"></div>
                </div>
            </div>
            <form class="am-form am-form-horizontal" action="/person/submit" method="post" onsubmit="return checkAll()">
                <div class="am-form-group">
                    <label for="user-old-password" class="am-form-label">原密码</label>
                    <div class="am-form-content">
                        <input type="password" id="user-old-password" name="oldpass" placeholder="请输入原登录密码" onblur="tosubmit()" >
                        <span style="width:20px;color:red;display:none" id="oldpass">您输入的密码不正确</span>
                    </div>
                </div>
                <input type="hidden" name="user" value="${$MAP.user}"/>
                <div class="am-form-group">
                    <label for="user-new-password" class="am-form-label">新密码</label>
                    <div class="am-form-content">
                        <input type="password" id="user-new-password" name="newpass" placeholder="由数字、字母组合并且长度为6-18位" onblur="topass()">
                        <span style="width:20px;color:red;display:none" id="newpass">您输入的密码不正确</span>
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="user-confirm-password" class="am-form-label">确认密码</label>
                    <div class="am-form-content">
                        <input type="password" id="user-confirm-password" name="repass" placeholder="请再次输入上面的密码" onblur="torepass()">
                        <span style="width:20px;color:red;display:none" id="repass">您输入的密码不正确</span>
                    </div>
                </div>
                <div class="info-btn">
                    <div>
                     <input type="submit" class="am-btn am-btn-danger" value="保存修改"  />
                    </div>
                </div>

            </form>

        </div>
        <!--底部-->
        <div style="width:100%;height:300px;background: #333333;">
            <div style="width:1100px;height:80px;margin:0px auto;border-bottom: 1px solid #474747;">

                <img src="/ass/img/图标6.png" style="width:68px;height:58px;margin:10px 0px 0px 0px;float:left "  />
                <div>
				<span style="color:#cc0000;font-size:30px;float:left;margin-top:25px;">
					400-125-6512&nbsp;&nbsp;&nbsp;</span>
                    <span style="color:white;margin-top:32px;float:left">客服热线&nbsp;&nbsp;&nbsp;9:00-23:00&nbsp;&nbsp;&nbsp;贴心服务</span>
                </div>
            </div>

            <div style="width:1100px;height:80px;margin:0px auto;">
                <div style="width:150px;height:100px;color:white;float:left;">
                    <img src="../ass/img/图标7.png" style="width:42px;height:46px;"/>
                    <span style="font-size:18px;">新手入门</span>
                    <div style="width:80px;height:20px;margin-left:45px;margin-top:10px;">
                        <a href="#" style="color:#cccccc" >购物保障</a>
                    </div>
                    <div style="width:80px;height:20px;margin:10px 0px 0px 45px;">
                        <a href="#" style="color:#cccccc" >服务协议</a>
                    </div>
                    <div style="width:80px;height:20px;margin:10px 0px 0px 45px;">
                        <a href="#" style="color:#cccccc" >发票说明</a>
                    </div>
                </div>
                <div style="width:150px;height:100px;color:white;float:left;margin-left:40px">
                    <img src="../ass/img/图标8.png" style="width:42px;height:46px;"/>
                    <span style="font-size:18px;">常见问题</span>
                    <div style="width:80px;height:20px;margin-left:45px;margin-top:10px;">
                        <a href="#" style="color:#cccccc" >红包使用</a>
                    </div>
                    <div style="width:80px;height:20px;margin:10px 0px 0px 45px;">
                        <a href="#" style="color:#cccccc" >返现使用</a>
                    </div>
                    <div style="width:80px;height:20px;margin:10px 0px 0px 45px;">
                        <a href="#" style="color:#cccccc" >兑换码</a>
                    </div>
                </div>
                <div style="width:150px;height:100px;color:white;float:left;margin-left:40px">
                    <img src="../ass/img/图标9.png" style="width:42px;height:40px;"/>
                    <span style="font-size:18px;">配送说明</span>
                    <div style="width:80px;height:20px;margin-left:45px;margin-top:10px;">
                        <a href="#" style="color:#cccccc" >配送时间</a>
                    </div>
                    <div style="width:80px;height:20px;margin:10px 0px 0px 45px;">
                        <a href="#" style="color:#cccccc" >配送费用</a>
                    </div>
                    <div style="width:80px;height:20px;margin:10px 0px 0px 45px;">
                        <a href="#" style="color:#cccccc" >配送范围</a>
                    </div>
                </div>
                <div style="width:150px;height:100px;color:white;float:left;margin-left:40px">
                    <img src="../ass/img/图标10.png" style="width:40px;height:39px;"/>
                    <span style="font-size:18px;">支付方式</span>
                    <div style="width:80px;height:20px;margin-left:45px;margin-top:10px;">
                        <a href="#" style="color:#cccccc" >货到付款</a>
                    </div>
                    <div style="width:80px;height:20px;margin:10px 0px 0px 45px;">
                        <a href="#" style="color:#cccccc" >在线支付</a>
                    </div>
                    <div style="width:80px;height:20px;margin:10px 0px 0px 45px;">
                        <a href="#" style="color:#cccccc" >线下支付</a>
                    </div>
                </div>
                <div style="width:150px;height:100px;color:white;float:left;margin-left:40px">
                    <img src="../ass/img/图标11.png" style="width:35px;height:38px;"/>
                    <span style="font-size:18px;">售后服务</span>
                    <div style="width:80px;height:20px;margin-left:45px;margin-top:10px;">
                        <a href="#" style="color:#cccccc" >品质保证</a>
                    </div>
                    <div style="width:80px;height:20px;margin:10px 0px 0px 45px;">
                        <a href="#" style="color:#cccccc" >退换货政策</a>
                    </div>
                    <div style="width:80px;height:20px;margin:10px 0px 0px 45px;">
                        <a href="#" style="color:#cccccc" >退换货流程</a>
                    </div>
                </div>
                <div style="width:150px;height:100px;color:white;float:left;margin-left:40px">
                    <img src="../ass/img/图标12.png" style="width:37px;height:36px;"/>
                    <span style="font-size:18px;">特色服务</span>
                    <div style="width:80px;height:20px;margin-left:45px;margin-top:10px;">
                        <a href="#" style="color:#cccccc" >企业俱乐部</a>
                    </div>
                    <div style="width:80px;height:20px;margin:10px 0px 0px 45px;">
                        <a href="#" style="color:#cccccc" >企业客户</a>
                    </div>
                    <div style="width:80px;height:20px;margin:10px 0px 0px 45px;">
                        <a href="#" style="color:#cccccc" >GFZ社区</a>
                    </div>
                </div>
            </div>

        </div>
        <div class="footer ">
            <div class="footer-hd ">
                <p>
                    <a href="# ">关于我们</a>
                    <b>|</b>
                    <a href="# ">商城首页</a>
                    <b>|</b>
                    <a href="# ">友情提示</a>
                    <b>|</b>
                    <a href="# ">物流</a>
                </p>
            </div>
            <div class="footer-bd ">
                <p>
                    <em style="color:#999999">Copyright © 2016 GFZ一醉坊  版权所有   京ICP备12022216号-2 | 京公网安备 11010502026701
                        <br />
                        公司名称：GFZ一醉坊有限公司 公司地址：北京市朝阳区京顺东街6号院8号楼3层301室2号  联系人：小于  联系方式：400-125-6512
                        <br />社会信用代码证：911101055938071245 食品经营许可证 </em>
                    <br />
                    <img src="/ass/img/商标1.png" style="width:125px;height:45px;" /> <img src="/ass/img/商标2.png" style="width:133px;height:51px;" />
                    <br />
                    <span style="color:red"> 购买前请确认达到法定饮酒年龄！中酒网不销售任何含酒精产品给18岁以下人士！</span>
                </p>
            </div>
        </div>
    </div>

    <aside class="menu">
        <ul>
            <li class="person active">
                <a href="index.html"><i class="am-icon-user"></i>个人中心</a>
            </li>
            <li class="person">
                <p><i class="am-icon-newspaper-o"></i>个人</p>
                <ul>
                    <li><a href="/person/toshowOrders">订单管理</a></li>
                    <li> <a href="/person/updPass.jsp">安全设置</a></li>
                    <li> <a href="/person/ByUserFind">地址设置</a></li>
                </ul>
            </li>
        </ul>

    </aside>
</div>
<script type="text/javascript">
    var flag1=true;
    var flag2=true;
    var flag3=true;


    function topass()
    {
        var newpass=$("input[name='newpass']").val();
        var reg= /^[A-Za-z0-9]+$/;
        if(newpass=="")
        {
            $("span[id='newpass']").show();
            $("span[id='newpass']").text("新密码不能为空");
            flag2=false;
        }
        else
        {
            $.ajax({
                url: '/person/torepass',
                type: "post",
                data:{"oldpass":newpass},
                dataType: "json",
                success: function(data) {
                    if(data == 1)
                    {
                        $("span[id='newpass']").show();
                        $("span[id='newpass']").text("新的密码不能和原来的密码一样");
                        $("span[id='newpass']").css("color","red");
                        $("input[id='user-new-password']").focus();
                        flag2=false;
                    }
                    else
                    {
                        alert(newpass)
                        if (reg.test(newpass) && newpass.length>6 &&newpass.length < 18) {
                                $("span[id='newpass']").show();
                                $("span[id='newpass']").text("输入正确");
                                $("span[id='newpass']").css("color", "green");
                                flag2 = true;

                        }
                        else
                        {
                            $("span[id='newpass']").show();
                            $("span[id='newpass']").text("请输入长度在6-18的字母和数字的组合");
                            $("span[id='newpass']").css("color","red");
                            $("input[id='user-new-password']").focus();
                            flag2=false;
                        }
                    }
                }
            });
        }
    }


    function torepass()
    {
        var newpass=$("input[name='newpass']").val();
        var  repass = $("input[name='repass']").val();
        var reg= /^[A-Za-z0-9]+$/;
        if(repass == "")
        {
            $("span[id='repass']").show();
            $("span[id='repass']").text("确认密码不能为空");
            $("span[id='repass']").css("color","red");
            $("input[id='user-confirm-password']").focus();
            flag3=false;
        }
        else
        {
            if(newpass==repass)
            {
                $("span[id='repass']").show();
                $("span[id='repass']").text("两次密码一致");
                $("span[id='repass']").css("color","green");
                flag3=true;
            }
            else
            {
                $("span[id='repass']").show();
                $("span[id='repass']").text("两次密码不一致请修改");
                $("span[id='repass']").css("color","red");
                $("input[id='user-confirm-password']").focus();
                flag3=false;
            }
        }
    }







    function checkAll()
    {
        var oldpass = $("input[id='user-old-password']").val();
        var newpass=$("input[name='newpass']").val();
        var  repass = $("input[name='repass']").val();
         if(oldpass== "")
         {
             $("span[id='oldpass']").show();
             $("span[id='oldpass']").text("原密码不能为空");
             flag1=false;
         }
         else
         {
             $.ajax({
                 url: '/person/torepass',
                 type: "post",
                 data:{"oldpass":oldpass},
                 dataType: "json",
                 success: function(data) {
                     if(data == 0)
                     {
                         $("span[id='oldpass']").show();
                         $("span[id='oldpass']").text("原始密码不正确");
                         $("span[id='oldpass']").css("color","red");
                         $("input[id='user-old-password']").focus();
                     }
                     else
                     {
                         $("span[id='oldpass']").show();
                         $("span[id='oldpass']").text("输入正确");
                         $("span[id='oldpass']").css("color","green");
                     }
                 }
             });
         }
         if(newpass=="")
         {
             $("span[id='newpass']").show();
             $("span[id='newpass']").text("新密码不能为空");
             flag2=false;
         }
         else
         {
             $.ajax({
                 url: '/person/torepass',
                 type: "post",
                 data:{"oldpass":newpass},
                 dataType: "json",
                 success: function(data) {
                     if(data == 1)
                     {
                         $("span[id='newpass']").show();
                         $("span[id='newpass']").text("新的密码不能和原来的密码一样");
                         $("span[id='newpass']").css("color","red");
                         $("input[id='user-new-password']").focus();
                         flag2=false;
                     }
                     else
                     {
                         if(reg.test(newpass)&&newpass.length>6&&newpass.length<18)
                         {
                             $("span[id='newpass']").show();
                             $("span[id='newpass']").text("输入正确");
                             $("span[id='newpass']").css("color","green");
                             flag2=true;
                         }
                         else
                         {
                             $("span[id='newpass']").show();
                             $("span[id='newpass']").text("请输入长度在6-18的字母和数字的组合");
                             $("span[id='newpass']").css("color","red");
                             $("input[id='user-new-password']").focus();
                             flag2=false;
                         }
                     }
                 }
             });
         }
         if(repass == "")
         {
             $("span[id='repass']").show();
             $("span[id='repass']").text("确认密码不能为空");
             $("span[id='repass']").css("color","red");
             flag3=false;
         }
         else
         {
             if(newpass==repass)
             {
                 $("span[id='repass']").show();
                 $("span[id='repass']").text("两次密码一致");
                 $("span[id='repass']").css("color","green");
                 flag3=true;
             }
             else
             {
                 $("span[id='repass']").show();
                 $("span[id='repass']").text("两次密码不一致请修改");
                 $("span[id='repass']").css("color","red");
                 flag3=false;
             }
         }
         if(flag1&&flag2&&flag3)
         {
             alert("修改成功,您需要重新登录")
         }
         return flag1&&flag2&&flag3;
    }


    function tosubmit()
    {

        var oldpass = $("input[id='user-old-password']").val();
        if(oldpass=="")
        {
            $("span[id='oldpass']").text("原始密码不能为空");
            flag1=false;
        }
        $.ajax({
            url: '/person/torepass',
            type: "post",
            data:{"oldpass":oldpass},
            dataType: "json",
            success: function(data) {
                if(data == 0)
                {
                    $("span[id='oldpass']").show();
                    $("span[id='oldpass']").text("原始密码不正确");
                    $("span[id='oldpass']").css("color","red");
                    $("input[id='user-old-password']").focus();
                }
                else
                {
                    $("span[id='oldpass']").show();
                    $("span[id='oldpass']").text("输入正确");
                    $("span[id='oldpass']").css("color","green");
                    flag1=true;
                }
            }
        });
    }

    function sp() {
        var user = <%= session.getAttribute("user")%>;
        if(user == null)
        {
            var con = confirm("亲爱的顾客您好,您还未登录,是否进行登录")
            if(con)
            {
                location.href = "/login/beforeLogin.jsp";
            }
        }
        else
        {
            location.href="bw_view?b_user="+user;
        }
    }
    function toperson() {
        var user = <%= session.getAttribute("user")%>;
        if (user == null) {
            var con = confirm("亲爱的顾客您好,您还未登录,是否进行登录进行查看呢")
            if(con)
            {
                location.href = "/login/beforeLogin.jsp";
            }
        }
        else {
            location.href = "/person/toshowOrders";
        }
    }
</script>


</body>
</html>
