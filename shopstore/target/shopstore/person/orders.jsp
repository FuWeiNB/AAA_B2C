<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>订单管理</title>

    <link href="/ass/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/ass/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="/ass/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/ass/css/orstyle.css" rel="stylesheet" type="text/css">
    <link rel="icon" href="http://59f2dea8d2c25.t73.qifeiye.com/qfy-content/uploads/2017/11/aa9891e0a41a8c53b41cdac4fe8d3526.png" type="image/png"/>

    <script src="/ass/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="/ass/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <link href="/assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <style>
        a:link{ color:#a9302a;text-decoration:none;}         /*超链接的普通样式，即正常浏览状态的样式*/
        a:visited{ color:#a9302a;text-decoration:none}      /*被点击过的超链接的样式*/
        a:hover{ color:#a9302a;text-decoration:none}        /*鼠标指针经过超链接上时的样式*/
        a:active{ color:#a9302a;text-decoration:none}       /*在超链接上点击时，即“当前激活”时，超链接的样式*/
    </style>
</head>
<body style="background-color: white">
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
                        <div class="menu-hd"><a id="mc-menu-hd" href="/joinroom.jsp" target="_bank" style="color:white">
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
</div>
<b class="line"></b>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">

            <div class="user-order">

                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>

                </div>
                <hr/>

                <div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

                    <ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
                        <li class="am-active"><a href="#tab1">所有订单</a></li>
                        <li><a href="#tab2">待付款</a></li>
                        <li><a href="#tab3">待发货</a></li>
                        <li><a href="#tab4">待收货</a></li>
                        <li><a href="#tab5">已完成</a></li>
                    </ul>

                    <div class="am-tabs-bd">
                        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">下单日期</td>
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
                                <div class="order-list">

                                    <!--交易成功-->

                                    <div class="order-status5">
                                        <div class="order-title" >
                                        </div>
                                        <div class="order-content">
                                                <table style="border-spacing:10px" border="1" class="table table-hover table-bordered">
                                                  <c:forEach var="map" items="${list }">
                                                    <tr>
                                                        <td style="width:410px;margin:10px 0px 0px 10px;height:120px;">

                                                            <a href="/person/ordersDetials?o_id=${map.o_id}" class="J_MakePoint" style="float:left;margin-left:10px;">
                                                                <img src="${map.img_url }" style="width:78px;height:98px" class="itempic J_ItemImg">
                                                            </a>
                                                            <a href="/person/ordersDetials?o_id=${map.o_id}" class="J_MakePoint" style="float:left;margin-left:10px;">  ${map.o_id}<a/>
                                                            <a href="/person/ordersDetials?o_id=${map.o_id}" style="float:left;margin-left:10px;">
                                                                <p>${map.m_name }</p>
                                                                <p class="info-little">属性${map.t_name }
                                                                    <br/>类型:${map.c_Name } </p>
                                                            </a>

                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                                ${map.m_price }
                                                        </td>
                                                        <td style="width:149.4px;margin:10px 0px 0px 10px;height:120px;">
                                                            <span style="width:149.4px;"> ${map.o_date }</span>
                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                              ${map.o_price}
                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                            <c:if test="${map.o_flag == 0}">
                                                                <p class="Mystatus">
                                                                      代付款
                                                                </p>
                                                            </c:if>
                                                            <c:if test="${map.o_flag == 1}">
                                                                <p class="Mystatus">
                                                                    已取消
                                                                </p>
                                                            </c:if>
                                                            <c:if test="${map.o_flag == 2}">
                                                                <p class="Mystatus">
                                                                    待发货
                                                                </p>
                                                            </c:if>
                                                            <c:if test="${map.o_flag == 3}">
                                                                <p class="Mystatus">
                                                                    待收货
                                                                </p>
                                                            </c:if>
                                                            <c:if test="${map.o_flag == 4}">
                                                                <p class="Mystatus">
                                                                    交易完成
                                                                </p>
                                                            </c:if>
                                                            <p class="order-info"><a href="/person/ordersDetials?o_id=${map.o_id}">订单详情</a></p>
                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                            <c:if test="${map.o_flag == 0|| map.o_flag == 1}">
                                                                <p class="Mystatus">
                                                                <div class="am-btn am-btn-danger anniu">
                                                                    <a href="javascript:void(0)" onclick="todel('${map.o_id}','${map.o_flag}')"> 删除订单</a>
                                                                </div>
                                                                </p>
                                                            </c:if>
                                                            <c:if test="${map.o_flag == 3}">
                                                                <p class="Mystatus">
                                                                <div class="am-btn am-btn-danger anniu">
                                                                    <a href="javascript:void(0)" onclick="tosubmit('${map.o_id}')"> 确认收货</a>
                                                                </div>
                                                                </p>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                  </c:forEach>
                                                </table>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--内容2-->
                        <div class="am-tab-panel am-fade" id="tab2">

                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>

                                <div class="th th-operation">
                                    <td class="td-inner">下单日期</td>
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
                                <div class="order-list">
                                    <div class="order-status1">
                                        <div class="order-title">
                                        </div>
                                        <div class="order-content">

                                                <table style="border-spacing:10px" border="1" class="table table-hover table-bordered">
                                                    <c:forEach var="map1" items="${list1 }">
                                                        <tr>
                                                            <td style="width:410px;margin:10px 0px 0px 10px;height:120px;">

                                                                <a href="/person/ordersDetials?o_id=${map1.o_id}" class="J_MakePoint" style="float:left;margin-left:10px;">
                                                                    <img src="${map1.img_url }" style="width:78px;height:98px" class="itempic J_ItemImg">
                                                                </a>
                                                                <a href="/person/ordersDetials?o_id=${map1.o_id}" class="J_MakePoint" style="float:left;margin-left:10px;">  ${map1.o_id}<a/>
                                                                    <a href="/person/ordersDetials?o_id=${map1.o_id}" style="float:left;margin-left:10px;">
                                                                        <p>${map.m_name }</p>
                                                                        <p class="info-little">属性${map1.t_name }
                                                                            <br/>类型:${map1.c_Name } </p>
                                                                    </a>

                                                            </td>
                                                            <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                                    ${map1.m_price }
                                                            </td>

                                                            <td style="width:149.4px;margin:10px 0px 0px 10px;height:120px;">
                                                                <span style="width:124px;">${map1.o_date }</span>
                                                            </td>
                                                            <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                                    ${map1.o_price}
                                                            </td>
                                                            <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                                <c:if test="${map1.o_flag == 0}">
                                                                    <p class="Mystatus">
                                                                        待付款
                                                                    </p>
                                                                </c:if>
                                                                <c:if test="${map1.o_flag == 1}">
                                                                    <p class="Mystatus">
                                                                        已取消
                                                                    </p>
                                                                </c:if>
                                                                <p class="order-info"><a href="/person/ordersDetials?o_id=${map1.o_id}">订单详情</a></p>
                                                            </td>
                                                            <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                                <c:if test="${map.o_flag == 0|| map.o_flag == 1}">
                                                                    <p class="Mystatus">
                                                                    <div class="am-btn am-btn-danger anniu">
                                                                        <a href="javascript:void(0)" onclick="todel('${map.o_id}','${map.o_flag}')"> 删除订单</a>
                                                                    </div>
                                                                    </p>
                                                                </c:if>
                                                                <c:if test="${map1.o_flag == 3}">
                                                                    <a href="javascript:void(0)" onclick="tosubmit('${map1.o_id }')">确认收货</a>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="am-tab-panel am-fade" id="tab3">
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>

                                <div class="th th-operation">
                                    <td class="td-inner">下单日期</td>
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
                                <div class="order-list">
                                    <div class="order-status2">
                                        <div class="order-title">

                                        </div>
                                        <div class="order-content">
                                            <table style="border-spacing:10px" border="1" class="table table-hover table-bordered">
                                                <c:forEach var="map2" items="${list2 }">
                                                    <tr>
                                                        <td style="width:410px;margin:10px 0px 0px 10px;height:120px;">

                                                            <a href="/person/ordersDetials?o_id=${map2.o_id}" class="J_MakePoint" style="float:left;margin-left:10px;">
                                                                <img src="${map2.img_url }" style="width:78px;height:98px" class="itempic J_ItemImg">
                                                            </a>
                                                            <a href="/person/ordersDetials?o_id=${map2.o_id}" class="J_MakePoint" style="float:left;margin-left:10px;">  ${map2.o_id}<a/>
                                                                <a href="/person/ordersDetials?o_id=${map2.o_id}" style="float:left;margin-left:10px;">
                                                                    <p>${map2.m_name }</p>
                                                                    <p class="info-little">属性${map2.t_name }
                                                                        <br/>类型:${map2.c_Name } </p>
                                                                </a>

                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                                ${map2.m_price }
                                                        </td>
                                                        <td style="width:49.8px;margin:10px 0px 0px 10px;height:120px;">
                                                                ${map2.sums}
                                                        </td>
                                                        <td style="width:149.4px;margin:10px 0px 0px 10px;height:120px;">
                                                                ${map2.o_date }
                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                                ${map2.o_price}
                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                            <c:if test="${map2.o_flag == 2}">
                                                                <p class="Mystatus">
                                                                    待发货
                                                                </p>
                                                            </c:if>
                                                            <p class="order-info"><a href="/person/ordersDetials?o_id=${map2.o_id}">订单详情</a></p>
                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                            <c:if test="${map.o_flag == 0|| map.o_flag == 1}">
                                                                <p class="Mystatus">
                                                                <div class="am-btn am-btn-danger anniu">
                                                                    <a href="javascript:void(0)" onclick="todel('${map.o_id}','${map.o_flag}')"> 删除订单</a>
                                                                </div>
                                                                </p>
                                                            </c:if>
                                                            <c:if test="${map2.o_flag == 3}">
                                                                <a href="javascript:void(0)" onclick="tosubmit('${map2.o_id}')">确认收货</a>
                                                            </c:if>

                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!--待收货-->
                        <div class="am-tab-panel am-fade" id="tab4">
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">下单日期</td>
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
                                <div class="order-list">
                                    <div class="order-status3">
                                        <div class="order-title">

                                        </div>
                                        <div class="order-content">
                                            <table style="border-spacing:10px" border="1" class="table table-hover table-bordered">
                                                <c:forEach var="map3" items="${list3 }">
                                                    <tr>
                                                        <td style="width:410px;margin:10px 0px 0px 10px;height:120px;">

                                                            <a href="/person/ordersDetials?o_id=${map3.o_id}" class="J_MakePoint" style="float:left;margin-left:10px;">
                                                                <img src="${map3.img_url }" style="width:78px;height:98px" class="itempic J_ItemImg">
                                                            </a>
                                                            <a href="/person/ordersDetials?o_id=${map3.o_id}" class="J_MakePoint" style="float:left;margin-left:10px;">  ${map3.o_id}<a/>
                                                                <a href="/person/ordersDetials?o_id=${map3.o_id}" style="float:left;margin-left:10px;">
                                                                    <p>${map3.m_name }</p>
                                                                    <p class="info-little">属性${map3.t_name }
                                                                        <br/>类型:${map3.c_Name } </p>
                                                                </a>

                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                                ${map3.m_price }
                                                        </td>

                                                        <td style="width:149.4px;margin:10px 0px 0px 10px;height:120px;">
                                                                ${map3.o_date }
                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                                ${map3.o_price}
                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">

                                                            <c:if test="${map3.o_flag == 3}">
                                                                <p class="Mystatus">
                                                                    待收货
                                                                </p>
                                                            </c:if>

                                                            <p class="order-info"><a href="/person/ordersDetials?o_id=${map3.o_id}">订单详情</a></p>
                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">

                                                            <c:if test="${map.o_flag == 0|| map.o_flag == 1}">
                                                                <p class="Mystatus">
                                                                <div class="am-btn am-btn-danger anniu">
                                                                    <a href="javascript:void(0)" onclick="todel('${map.o_id}','${map.o_flag}')"> 删除订单</a>
                                                                </div>
                                                                </p>
                                                            </c:if>
                                                               <c:if test="${map3.o_flag == 3}">
                                                                   <a href="javascript:void(0)" onclick="tosubmit('${map3.o_id }')">确认收货</a>
                                                               </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--已完成-->
                        <div class="am-tab-panel am-fade" id="tab5">
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">下单日期</td>
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
                                <div class="order-list">
                                    <!--不同状态的订单	-->
                                    <div class="order-status4">
                                        <div class="order-title">


                                        </div>
                                        <div class="order-content">
                                            <table style="border-spacing:10px" border="1" class="table table-hover table-bordered">
                                                <c:forEach var="map4" items="${list4 }">
                                                    <tr>
                                                        <td style="width:410px;margin:10px 0px 0px 10px;height:120px;">

                                                            <a href="/person/ordersDetials?o_id=${map4.o_id}" class="J_MakePoint" style="float:left;margin-left:10px;">
                                                                <img src="${map4.img_url }" style="width:78px;height:98px" class="itempic J_ItemImg">
                                                            </a>
                                                            <a href="/person/ordersDetials?o_id=${map4.o_id}" class="J_MakePoint" style="float:left;margin-left:10px;">  ${map4.o_id}<a/>
                                                                <a href="/person/ordersDetials?o_id=${map4.o_id}" style="float:left;margin-left:10px;">
                                                                    <p>${map4.m_name }</p>
                                                                    <p class="info-little">属性${map4.t_name }
                                                                        <br/>类型:${map4.c_Name } </p>
                                                                </a>

                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                                ${map4.m_price }
                                                        </td>

                                                        <td style="width:149.4px;margin:10px 0px 0px 10px;height:120px;">
                                                             <span style="width:149.4px;"> ${map4.o_date}</span>
                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                                ${map4.o_price}
                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                            <c:if test="${map4.o_flag == 0}">
                                                                <p class="Mystatus">
                                                                    代付款
                                                                </p>
                                                            </c:if>
                                                            <c:if test="${map4.o_flag == 1}">
                                                                <p class="Mystatus">
                                                                    已取消
                                                                </p>
                                                            </c:if>
                                                            <c:if test="${map4.o_flag == 2}">
                                                                <p class="Mystatus">
                                                                    待发货
                                                                </p>
                                                            </c:if>
                                                            <c:if test="${map4.o_flag == 3}">
                                                                <p class="Mystatus">
                                                                    已发货
                                                                </p>
                                                            </c:if>
                                                            <c:if test="${map4.o_flag == 4}">
                                                                <p class="Mystatus">
                                                                    交易完成
                                                                </p>
                                                            </c:if>
                                                            <p class="order-info"><a href="/person/ordersDetials?o_id=${map4.o_id}">订单详情</a></p>
                                                        </td>
                                                        <td style="width:99.6px;margin:10px 0px 0px 10px;height:120px;">
                                                            <c:if test="${map.o_flag == 0|| map.o_flag == 1}">
                                                                <p class="Mystatus">
                                                                <div class="am-btn am-btn-danger anniu">
                                                                    <a href="javascript:void(0)" onclick="todel('${map.o_id}','${map.o_flag}')"> 删除订单</a>
                                                                </div>
                                                                </p>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </table>

                                        </div>
                                    </div>

                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
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
                    <img src="/ass/img/图标7.png" style="width:42px;height:46px;"/>
                    <span style="font-size:18px">新手入门</span>
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
                    <img src="/ass/img/图标8.png" style="width:42px;height:46px;"/>
                    <span style="font-size: 18px;">常见问题</span>
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
                    <img src="/ass/img/图标9.png" style="width:42px;height:40px;"/>
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
                    <img src="/ass/img/图标10.png" style="width:40px;height:39px;"/>
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
                    <img src="/ass/img/图标11.png" style="width:35px;height:38px;"/>
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
                    <span style="font-size: 18px;">特色服务</span>
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
                <p><i class="am-icon-newspaper-o"></i>个人资料</p>
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
    function todel(value,flag)
    {

        if(flag == 3 || flag == 2)
        {
            alert("该订单已付款而未发货或者该订单未完成")
        }
        else
        {
            var confi=confirm("确定要删除"+value+"这个订单嘛");
            if(confi)
            {
                location.href="/person/todel?o_id="+o_id;
            }
        }
    }
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
