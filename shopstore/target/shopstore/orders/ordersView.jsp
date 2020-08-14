<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/1/6
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/js/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
</head>
<body>
<div style="width:1200px;height:30px;border:1px solid #ffffff;background-color: #ffffff;margin:5px 5px;font-size: 18px;padding-top:10px;padding-left:20px">
    订单详细
</div>
<div style="width:1200px;height:auto;border:1px solid #ffffff;margin:5px 5px;background-color: #ffffff;">
    <div style="width:1050px;height:20px;margin:10px 0px 0px 10px;">
        <span>订单编号:<span style="color:red">${map.o_id}</span></span>
            <span style="float:right;">下单时间:${map.o_date}</span>
    </div>
    <div style="width:1050px;height:150px;border: 1px solid #dddddd;margin:0px 0px 0px 10px;font-size:15px;">
        <div style="padding: 10px 10px;background-color:#efeef0;width:1030px;height:20px;font-size: 18px">收件人信息</div>
        <div style="border:1px solid #ffffff;margin:20px 0px 0px 95px;float:left">
            收件人姓名:&nbsp;&nbsp;&nbsp;&nbsp;${map.o_name}
        </div>
        <div style="border:1px solid #ffffff;margin:20px 0px 0px 120px;float:left">
            收件人电话:&nbsp;&nbsp;&nbsp;&nbsp;${map.o_phone}
        </div>
        <div style="border:1px solid #ffffff;margin:20px 0px 0px 120px;float:left">
            收件地邮编:&nbsp;&nbsp;&nbsp;&nbsp;${map.o_number}
        </div>
        <div style="clear: both"></div>
        <div style="margin:20px 0px 0px 113px;">收货地址:&nbsp;&nbsp;&nbsp;&nbsp;${map.o_aname}
        </div>
    </div>
    <div style="width:1050px;height:auto;border: 1px solid #dddddd;margin:10px 0px 0px 10px;font-size:15px;">
        <div style="padding: 10px 10px;background-color:#efeef0;width:1030px;height:20px;font-size: 18px">产品信息</div>
        <c:forEach var="maps" items="${lists}">
            <div style="width:1050px;height:150px;border: 1px solid #dddddd;">
                <div style="margin:20px 0px 0px 60px;float:left;">
                    <img src="${maps.img_url}" style="width:80px;height:100px;"/>
                </div>
                <div style="border:1px solid #ffffff;margin:20px 0px 0px 120px;">
                    <li>
                        <span style="width:100px;height:50px;margin:10px 0px 0px 20px;">${maps.m_name}</span>
                    </li>
                    <li style="color:#999999;margin:30px 0px 0px 40px ">
                        <span >规格:${maps.t_name}${maps.t_type} &nbsp;&nbsp;&nbsp;&nbsp;数量:${maps.buy_number}</span>
                    </li>
                    <li style="margin:5px 0px 0px 40px ;font-size:15px;">
                        价格:<span style="font-size: 20px;color:red;margin:0px 0px 0px 10px">￥${maps.m_price}</span>
                    </li>
                </div>
            </div>
        </c:forEach>
    </div>
    <div style="width:1050px;height:130px;border: 1px solid #dddddd;margin:10px 0px 0px 10px;">
        <div style="width:1050px;height:95px;border-bottom: 1px solid #dddddd">
            <span style="float:left;margin:20px 0px 0px 40px">支付方式:&nbsp;在线支付</span>
            <span style="float:left;margin:20px  0px 0px 168px">订单状态:
                  <c:if test = "${map.o_flag == 0}">待支付</c:if>
                  <c:if test = "${map.o_flag == 1}">已取消</c:if>
                  <%--<c:if test = "${map.o_flag != 1&&map.o_flag != 0}">已支付</c:if>--%>
                  <c:if test = "${map.o_flag == 2}">未发货</c:if>
                  <c:if test = "${map.o_flag == 3}">已发货</c:if>
                  <c:if test = "${map.o_flag == 4}">已完成</c:if>
            </span>
            <span style="float:left;margin:20px 0px 0px 80px">订单支付时间:
                 ${map.pay_orders == null ? '无':map.pay_orders}
            </span>
            <span style="float:left;margin:20px 0px 0px 40px">发货时间:${map.send_thing == null ? '无':map.send_thing}</span>
            <div style="clear:both"></div>
            <span style="float:left;margin:20px 0px 0px 40px">快递单号:&nbsp;${map.pa_id == null ? '没有发货':map.pa_id}</span>
            <span style="float:left;margin:20px  0px 0px 170px">快递名称:&nbsp;${map.pa_number == null ? '无':map.pa_number}</span>
        </div>
        <div style="width:1050px;height:45px;font-size: 16px;">
            <span style="float:right;margin:5px 0px">总价: <span style="color:red;margin:0px 0px 0px 5px"> ${map.o_price}</span>元</span>
            <span style="float:right;margin:5px 0px">总数: <span style="color:red;margin:0px 0px 0px 5px">${buyCount}</span></span>
        </div>
    </div>
    <div style="width:1050px;height:100px;border: 1px solid #dddddd;margin:10px 0px 0px 10px;">
        <div style="padding: 5px 10px;background-color:#efeef0;width:1030px;height:30px;font-size: 18px">备注信息</div>
        <div style="margin:15px 0px 0px 20px">${map.o_memo}</div>
    </div>
    <c:if test="${map.pa_id != null }">
        <div style="width:1050px;height:500px;border: 1px solid #dddddd;margin:10px 0px 0px 10px;">
            <div style="padding: 5px 10px;background-color:#efeef0;width:1030px;height:30px;font-size: 18px">物流信息</div>
            <img src="/pictures/物流信息.png"/>
        </div>
    </c:if>


</div>
<script>
    layui.use(['form', 'layer'],
    function() {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;
    });
</script>
<script>
    var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();
</script>

</body>
</html>
