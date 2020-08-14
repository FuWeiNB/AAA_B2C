<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/13
  Time: 0:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <link href="/ass/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/ass/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="/ass/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/ass/css/orstyle.css" rel="stylesheet" type="text/css">
    <link rel="icon" href="http://59f2dea8d2c25.t73.qifeiye.com/qfy-content/uploads/2017/11/aa9891e0a41a8c53b41cdac4fe8d3526.png" type="image/png"/>

    <script src="/ass/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="/ass/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
</head>
<body style="background-color: white">
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!--顶部导航条 -->
            <div class="am-container header" style="background-color: #5e0000;color:white;width:1500px;height:35px;">
                <ul class="message-l">
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
                <ul class="message-r">
                    <div class="topMessage home">
                        <div class="menu-hd"><a href="/index.jsp" target="_top" class="h" style="color:white">商城首页</a></div>
                    </div>
                    <div class="topMessage my-shangcheng">
                        <div class="menu-hd MyShangcheng">
                            <a href="javascript:void(0)" onclick="toperson()" target="_top" style="color:white"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
                        </div>
                    </div>
                    <div class="topMessage mini-cart">
                        <div class="menu-hd"><a id="mc-menu-hd" href="/joinroom.jsp" target="_bank" style="color:white">
                            <span>客服</span></a></div>
                    </div>

                </ul>

            </div>
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

</div>
<b class="line"></b>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">

            <div class="user-orderinfo">

                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单详情</strong> / <small>Order&nbsp;details</small></div>
                </div>
                <hr/>
                <!--进度条-->
                <div class="order-infoaside">
                    <div class="order-logistics">
                        <a href="logistics.html">
                            <div class="icon-log">
                                <i><img src="/ass/img/receive.png"></i>
                            </div>
                            <div class="latest-logistics">
                                <c:if test="${address.o_flag == 0}">
                                    <p class="text">订单为代付款,一醉坊GFZ很高兴为您服务,准您生活愉快！</p>
                                </c:if>
                                <c:if test="${address.o_flag == 1}">
                                    <p class="text">订单已取消,一醉坊GFZ很高兴为您服务,准您生活愉快</p>
                                </c:if>
                                <c:if test="${address.o_flag == 2}">
                                    <p class="text">待发货,一醉坊GFZ很高兴为您服务,准您生活愉快！</p>
                                </c:if>
                                <c:if test="${address.o_flag == 3}">
                                    <p class="text">已发货,发货人为一醉坊GFZ,很高兴为您服务,准您生活愉快！</p>
                                    <div class="time-list">
                                        <span class="date">发货时间为:${address.send_thing }</span>
                                    </div>
                                    <div class="inquire">
                                        <span class="package-detail">物流：${address.pa_number}</span>
                                        <span class="package-detail">快递单号: </span>
                                        <span class="package-number">${address.out_number}</span>
                                    </div>
                                </c:if>
                                <c:if test="${address.o_flag == 4}">
                                    <p class="text">已签收，感谢使用${address.pa_number}，期待再次为您服务</p>
                                    <div class="time-list">
                                        <span class="date">签收时间：${address.submit_thing }</span>
                                    </div>
                                    <div class="inquire">
                                        <span class="package-detail">快递名称：${address.pa_number}</span>
                                        <span class="package-detail">快递单号: </span>
                                        <span class="package-number">${address.pa_id }</span>
                                    </div>
                                </c:if>
                            </div>
                            <span class="am-icon-angle-right icon"></span>
                        </a>
                        <div class="clear"></div>
                    </div>
                    <div class="order-addresslist">
                        <div class="order-address">
                            <div class="icon-add">
                            </div>
                            <p class="new-tit new-p-re">
                                <span class="new-txt">${address.a_name}</span>
                                <span class="new-txt-rd2">${address.o_phone}</span>
                            </p>
                            <div class="new-mu_l2a new-p-re">
                                <p class="new-mu_l2cw">
                                    <span class="title">收货地址：</span>
                                    <span>${address.o_aname}</span>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="order-infomain">

                    <div class="order-top">
                        <div class="th th-item">
                            <td class="td-inner">商品</td>
                        </div>
                        <div class="th th-price">
                            <td class="td-inner">单价</td>
                        </div>
                        <div class="th th-number">
                            <td class="td-inner">数量</td>
                        </div>
                        <div class="th th-operation">
                            <td class="td-inner">商品操作</td>
                        </div>
                        <div class="th th-amount">
                            <td class="td-inner">合计</td>
                        </div>
                        <div class="th th-status">
                            <td class="td-inner">交易状态</td>
                        </div>
                        <div class="th th-change">
                            <td class="td-inner">交易操作</td>
                        </div>
                    </div>

                    <div class="order-main">

                        <div class="order-status3">
                            <div class="order-title">
                                <div style="width:400px;height:30px;float:left">订单编号：<a href="javascript:;">${address.o_id }</a></div>
                                <!--    <em>店铺：小桔灯</em>-->
                            </div>
                            <div class="order-content">
                                <div class="order-left">
                                    <c:forEach var="map" items="${list}">
                                    <ul class="item-list">
                                        <li class="td td-item">
                                            <div class="item-pic">
                                                <a href="#" class="J_MakePoint">
                                                    <img src="${map.img_url }" class="itempic J_ItemImg">
                                                </a>
                                            </div>
                                            <div class="item-info">
                                                <div class="item-basic-info">
                                                    <a href="#">
                                                        <p>${map.m_name}</p>
                                                        <p class="info-little">${map.c_Name }
                                                    </a>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="td td-price">
                                            <div class="item-price">
                                                ${map.m_price}
                                            </div>
                                        </li>
                                        <li class="td td-number">
                                            <div class="item-number">
                                                <span>×</span>${map.buy_number}
                                            </div>
                                        </li>
                                        <li class="td td-operation">

                                        </li>
                                    </ul>
                                    </c:forEach>
                                </div>
                                <div class="order-right">
                                    <li class="td td-amount">
                                        <div class="item-amount">
                                            合计：${price }
                                        </div>
                                    </li>
                                    <div class="move-right">
                                        <li class="td td-status">
                                            <div class="item-status">
                                                <c:if test="${address.o_flag == 0}">
                                                    <p class="Mystatus">
                                                        代付款
                                                    </p>
                                                </c:if>
                                                <c:if test="${address.o_flag == 1}">
                                                    <p class="Mystatus">
                                                        已取消
                                                    </p>
                                                </c:if>
                                                <c:if test="${address.o_flag == 2}">
                                                    <p class="Mystatus">
                                                        待发货
                                                    </p>
                                                </c:if>
                                                <c:if test="${address.o_flag == 3}">
                                                    <p class="Mystatus">
                                                        待收货
                                                    </p>
                                                </c:if>
                                                <c:if test="${address.o_flag == 4}">
                                                    <p class="Mystatus">
                                                        交易完成
                                                    </p>
                                                </c:if>
                                            </div>
                                        </li>
                                        <li class="td td-change">
                                            <c:if test="${address.o_flag == 3}">
                                                <p class="Mystatus">
                                                <div class="am-btn am-btn-danger anniu">
                                                <a href="javascript:void(0)" onclick="tosubmit('${address.o_id}')"> 确认收货</a>
                                                </div>
                                                </p>
                                            </c:if>

                                        </li>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--底部-->
        <!--底部-->
        <div style="width:100%;height:300px;background: #333333;">
            <div style="width:1100px;height:80px;margin:0px auto;border-bottom: 1px solid #474747;">

                <img src="../ass/img/图标6.png" style="width:68px;height:58px;margin:10px 0px 0px 0px;float:left "  />
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
                    <img src="../ass/img/商标1.png" style="width:125px;height:45px;" /> <img src="../ass/img/商标2.png" style="width:133px;height:51px;" />
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
                <p><i class="am-icon-newspaper-o"></i>个人设置</p>
                <ul>
                    <li><a href="/person/toshowOrders">订单管理</a></li>
                    <li> <a href="/person/updPass.jsp">安全设置</a></li>
                    <li> <a href="/person/ByUserFind">地址设置</a></li>
                </ul>
            </li>
        </ul>

    </aside>
</div>
<script>
    function tosubmit(value)
    {
        location.href="/person/tosubmit?o_id="+value;
    }

</script>
<script>
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
