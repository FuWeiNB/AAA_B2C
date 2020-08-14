<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/1/7
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/js/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <link  src="js/css/modules/layer/default" />
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="o_id" class="layui-form-label">
                    <span class="x-red">*</span>订单编号
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="o_id" name="o_id" required="" lay-verify="o_id" style="width:275px;"
                           autocomplete="off" disabled=""  class="layui-input" value="${map.o_id }">

                </div>
            </div>
            <div class="layui-form-item">
                <label for="flag" class="layui-form-label">
                    <span class="x-red">*</span>支付状态:
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="flag" name="flag" required="" lay-verify="flag" value="${map.o_flag == 0 ? '未支付':'已支付' }"
                           autocomplete="off" class="layui-input" disabled="">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="o_flag" class="layui-form-label">
                    <span class="x-red">*</span>货物状态:
                </label>
                <div class="layui-input-inline">
                    <select  name="o_flag" id="o_flag" required="" disabled="" lay-verify="o_flag" autocomplete="off" >
                        <option value="0" ${map.o_flag == 0 ? 'selected':''}>无法发货</option>
                        <option value="1" ${map.o_flag == 1 ? 'selected':''}>待发货</option>
                        <option value="2" ${map.o_flag == 2 ? 'selected':''}>已发货</option>
                        <option value="3" ${map.o_flag == 3 || map.o_flag == 4 ? 'selected':''}>已收货</option>
                    </select>
                    <%--<input type="text" id="L_email" name="email" required="" lay-verify="email"
                           autocomplete="off" class="layui-input">--%>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="o_name" class="layui-form-label">
                    <span class="x-red">*</span>收货人
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="o_name" name="o_name" required="" lay-verify="o_name"
                           autocomplete="off" class="layui-input"   value="${map.o_name }">
                </div>

            </div>
            <div class="layui-form-item">
                <label for="o_aname" class="layui-form-label">
                    <span class="x-red">*</span>收货地址:
                </label>
                <div class="layui-input-inline">
                   <input type="text" id="o_aname" style="width:275px;" name="o_aname" required="" lay-verify="o_aname"
                           autocomplete="off" class="layui-input" value="${map.o_aname}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="o_phone" class="layui-form-label">
                    <span class="x-red">*</span>收货电话:
                </label>
                <div class="layui-input-inline">
                   <input type="text" id="o_phone" name="o_phone" required="" lay-verify="o_phone"
                           autocomplete="off" class="layui-input" value="${map.o_phone }">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="o_memo" class="layui-form-label">
                    <span class="x-red">*</span>订单备注:
                </label>
                <div class="layui-input-inline">
                    <textarea name="o_memo" id="o_memo" required lay-verify="required" style="width:275px;"
                              placeholder="请输入内容" class="layui-textarea">${map.o_memo}</textarea>
                </div>
            </div>

            <div class="layui-form-item" style="float:right;margin-right:50px;" >
                <button  class="layui-btn" lay-filter="upd" lay-submit="">
                    提交
                </button>
            </div>
        </form>
    </div>
</div>
<script>layui.use(['form', 'layer'],
    function() {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        //自定义验证规则
        form.verify({
            o_aname: function(value) {
                if (value.length < 12 ) {
                    return '收货地址至少要12个字符呢';
                }
            },
            o_phone: [ /^[1][3,4,5,6,7,8,9][0-9]{9}$/, '请输入正确的手机号码'],
            name:function(value)
            {
                if(value=="")
                {
                    return "收货人名称不能为空";
                }
            }

        });

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
                    url:'/orders/upd',
                    type:'post',
                    data:{"o_aname":o_aname,"o_phone":o_phone,"o_id":o_id,"o_name":o_name,"o_memo":o_memo},
                    dateType:"json",
                    success:function(data)
                    {
                         if(data == 1)
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
