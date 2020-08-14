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
<center><h3 style="margin:10px 0px">订单明细</h3></center>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                   订单编号
                </label>
                <div class="layui-input-inline" >
                    <input type="text" id="username" name="username" required="" lay-verify="required"
                           autocomplete="off" disabled="" class="layui-input" value="${map.o_id }" style="width:275px;">
                </div>

            </div>

            <div class="layui-form-item">
                <label for="user" class="layui-form-label">
                    <span class="x-red">*</span>购买用户:
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="users" name="name" required="" lay-verify="email" style="width:275px"
                           autocomplete="off" class="layui-input" disabled="" value="${map.name }">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">收货地址:</label>
                <div class="layui-input-block">
                        <input type="text" id="user" style="width:275px;" name="name" required="" lay-verify="a_name"
                               autocomplete="off" class="layui-input" disabled="" value="${map.o_aname }">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="send" class="layui-form-label">
                    联系方式:
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" disabled="" name="repass" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input" value="${map.o_phone}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="o_flag" class="layui-form-label">
                    支付状态:
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="o_flag" name="o_flag" required="" lay-verify="email" value="${map.o_flag == 0 ? '未支付':'已支付' }"
                           autocomplete="off" class="layui-input" disabled="">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">发货状态</label>
                <div class="layui-input-inline">
                    <c:if test="${map.o_flag == 0 }">
                        <input type="text" id="oflag" name="o_flag" required="" lay-verify="email"  value="无法发货"
                               autocomplete="off" class="layui-input" disabled="">
                    </c:if>
                    <c:if test="${map.o_flag == 1 }">
                        <input type="text" id="oflag" name="oflag" required="" lay-verify="email"  value="未审核"
                               autocomplete="off" class="layui-input" disabled="">
                    </c:if>
                    <c:if test="${map.o_flag == 2 }">
                        <input type="text" id="oflag" name="oflag" required="" lay-verify="email"  value="已审核/未发货"
                               autocomplete="off" class="layui-input" disabled="">
                    </c:if>
                    <c:if test="${map.o_flag == 3 }">
                        <input type="text" id="oflag" name="oflag" required="" lay-verify="email" value="已发货"
                               autocomplete="off" class="layui-input" disabled="">
                    </c:if>
                    <c:if test="${map.o_flag == 4 }">
                        <input type="text" id="oflag" name="oflag" required="" lay-verify="email"  value="已收货/未评价"
                               autocomplete="off" class="layui-input" disabled="">
                    </c:if>

                  <%--  <select  style="width:300px" disabled>
                        <option value="0" style="width:300px" ${map.o_flag == 0 ? 'selected':''}>无法发货</option>
                        <option value="1" style="width:300px" ${map.o_flag == 1 ? 'selected':''}>未审核</option>
                        <option value="2" style="width:300px" ${map.o_flag == 2 ? 'selected':''}>已审核/未发货</option>
                        <option value="3" style="width:300px" ${map.o_flag == 3 ? 'selected':''}>已发货</option>
                        <option value="4" style="width:300px" ${map.o_flag == 4 ? 'selected':''}>已收货/未评价</option>
                        <option value="5" style="width:300px" ${map.o_flag == 5 ? 'selected':''}>已评价</option>
                    </select>--%>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="shop" class="layui-form-label">
                    <span class="x-red">*</span>所购商品:
                </label>
                <div class="layui-input-inline">
                    <select  name="o_flag" id="shop" required="" lay-verify="shop" autocomplete="off" >
                       <c:forEach var="maps" items="${list }">
                           <option>${maps.m_name}</option>
                       </c:forEach>
                    </select>
                    <%--<input type="text" id="L_email" name="email" required="" lay-verify="email"
                           autocomplete="off" class="layui-input">--%>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="price" class="layui-form-label">
                    下单总金额
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="price" name="price" required="" lay-verify="phone"
                           autocomplete="off" disabled="" class="layui-input" value="${map.o_price }">
                </div>

            </div>
            <div class="layui-form-item">
                <label for="o_date" class="layui-form-label">
                    下单日期:
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="o_date" disabled="" name="repass" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input" value="${map.o_date}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="pay_date" class="layui-form-label">
                    付款日期:
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="pay_date" disabled="" name="repass" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input" value="${map.pay_orders}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="send_date" class="layui-form-label">
                    发货日期:
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="send_date" disabled="" name="repass" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input" value="${map.send_thing}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="submit_date" class="layui-form-label">
                    完成日期:
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="submit_date" disabled="" name="repass" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input" value="${map.submit_thing}">
                </div>
            </div>
            <!--发货人 从session中获取 -->
            <div class="layui-form-item">
                <label for="send" class="layui-form-label">
                    发货人:
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="send_user" disabled="" name="repass" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input" value="GFZ有限公司">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="send" class="layui-form-label">
                    发货地址:
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="send" style="width:300px" disabled="" name="repass" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input" value="上海市阳澄湖镇莲花村西洋村相石路27号">
                </div>
            </div>
            <div class="layui-form-item" style="float:right;margin-right:50px;" >
                <button  class="layui-btn" lay-filter="upd" lay-submit="">
                    确定
                </button>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['form', 'layer'],
    function() {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        //监听提交
        form.on('submit(upd)',
            function(data) {
                //layui接收参数的方式所有的数据都在data中
                var o_aname = data.field.o_aname;
                var o_phone = data.field.o_phone;
                var o_id = data.field.o_id;
                var o_memo = data.field.o_memo;
                var o_name = data.field.o_name;
                $.ajax({
                    url:'/orders/send',
                    type:'post',
                    data:{"o_aname":o_aname,"o_phone":o_phone,"o_id":o_id,"o_name":o_name,"o_memo":o_memo},
                    dateType:"json",
                    success:function(data)
                    {
                        if(data[1] == 1)
                        {
                            //发异步，把数据提交给php
                            layer.alert("编辑成功", {
                                    icon: 6
                                },
                                function() {
                                    //关闭当前frame
                                    xadmin.close();
                                    // 可以对父窗口进行刷新
                                    xadmin.father_reload();
                                });
                        }


                    }
                });

                return false;
            });

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
