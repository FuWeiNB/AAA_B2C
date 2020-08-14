<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/12
  Time: 5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="/ass/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/ass/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="/ass/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/ass/css/addstyle.css" rel="stylesheet" type="text/css">
    <script src="/ass/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <link rel="icon" href="http://59f2dea8d2c25.t73.qifeiye.com/qfy-content/uploads/2017/11/aa9891e0a41a8c53b41cdac4fe8d3526.png" type="image/png"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/static/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body style="background-color: white">
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

            <div class="user-address">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
                </div>
                <hr/>
                <ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
                    <c:forEach var="map" items="${list}">
                        <c:if test="${map.a_flag == 0}">
                            <li class="user-addresslist defaultAddr" id="todefault">
                            <span class="new-option-r"><i class="am-icon-check-circle"></i>
                                   <a href="javascript:void(0)" onclick="toDefault('${map.a_id}')">设为默认</a>
                            </span>
                                <p class="new-tit new-p-re">
                                    <span class="new-txt">${map.a_name}</span>
                                    <span class="new-txt-rd2">${map.a_phone}</span>
                                </p>
                                <div class="new-mu_l2a new-p-re">
                                    <p class="new-mu_l2cw">
                                        <span class="title">地址:${map.a_namedetials}</span>
                                    </p>
                                </div>
                                <div class="new-addr-btn">
                                    <a href="/person/toupd_address?a_id=${map.a_id }"><i class="am-icon-edit"></i>编辑</a>
                                    <span class="new-addr-bar">|</span>
                                    <a href="javascript:void(0);" onclick="delClick('${map.a_id}');"><i class="am-icon-trash"></i>删除</a>
                                </div>
                            </li>
                        </c:if>
                        <c:if test="${map.a_flag !=0 }">
                        <li class="user-addresslist" id="todefault">
                            <span class="new-option-r"><i class="am-icon-check-circle"></i>
                                   <a href="javascript:void(0)" onclick="toDefault('${map.a_id}')">设为默认</a>
                            </span>
                            <p class="new-tit new-p-re">
                                <span class="new-txt">${map.a_name}</span>
                                <span class="new-txt-rd2">${map.a_phone}</span>
                            </p>
                            <div class="new-mu_l2a new-p-re">
                                <p class="new-mu_l2cw">
                                    <span class="title">地址:${map.a_namedetials}</span>
                                </p>
                            </div>
                            <div class="new-addr-btn">
                                <a href="/person/toupd_address?a_id=${map.a_id }"><i class="am-icon-edit" ></i>编辑</a>
                                <span class="new-addr-bar">|</span>
                                <a href="javascript:void(0);" onclick="delClick('${map.a_id }')"><i class="am-icon-trash"></i>删除</a>
                            </div>
                        </li>
                        </c:if>
                    </c:forEach>
                </ul>
                <div class="clear"></div>
                <a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
                <!--例子-->
                <div class="am-modal am-modal-no-btn" id="doc-modal-1" style="width:800px;">

                    <div class="add-dress">

                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
                        </div>
                        <hr/>

                        <div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
                            <form class="layui-form layui-col-md12  layui-form-pane" style="width:800px;margin:10px 0px 0px 50px;">

                                <div class="layui-form-item">
                                    <label class="layui-form-label">收货人</label>
                                    <div class="layui-input-block">
                                        <input type="text" onkeyup="value=value.replace(/[^\w\u4E00-\u9FA5]/g, '')" style="width:250px;" name="username" id="username" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入" autocomplete="off" class="layui-input">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label">验证手机</label>
                                        <div class="layui-input-inline">
                                            <input type="tel" name="phone" id="phone" style="width:250px" lay-verify="phone" autocomplete="off" class="layui-input">
                                            <span id="show-phone"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">设为默认</label>
                                    <div class="layui-input-block">
                                        <input type="checkbox" name="close" lay-skin="switch" lay-text="ON|OFF">
                                    </div>
                                </div>
                                <div class="layui-form-item" id="x-city">
                                    <label class="layui-form-label">城市联动</label>
                                    <div class="layui-input-inline">
                                        <select name="province" lay-filter="province">
                                            <option value="">请选择省</option>
                                        </select>
                                    </div>
                                    <div class="layui-input-inline">
                                        <select name="city" lay-filter="city">
                                            <option value="">请选择市</option>
                                        </select>
                                    </div>
                                    <div class="layui-input-inline">
                                        <select name="area" lay-filter="area">
                                            <option value="">请选择县/区</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label" style="width:110px;float:left">普通文本域</label>
                                    <div class="layui-input-block">
                                        <textarea placeholder="请输入详细地址" style="width:250px;float:left" class="layui-textarea" lay-verify="texts" name="text"></textarea>
                                        <span id="texts"></span>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>

            </div>

            <script type="text/javascript">
                $(document).ready(function() {
                    $(".new-option-r").click(function() {
                        $(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
                    });

                    var $ww = $(window).width();
                    if($ww>640) {
                        $("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
                    }

                })
            </script>

            <div class="clear"></div>

        </div>
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
<script type="text/javascript" src="/js/xcity.js"></script>
<script type="text/javascript">
    function toDefault(a_id) {

        $.ajax({
            url: '/person/toupd_flag',
            type: "post",
            data: {"a_id": a_id},
            dataType: "json",
            success: function (data) {
                if (data == 1) {
                    $("#todefault").css("class", " user-addresslist defaultAddr");
                }
            }
        });

    }
    function delClick(a_id)
    {
        var con = confirm("确定要删除吗?");
        if(con)
        {
            $.ajax({
                url: '/person/del_address',
                type: "post",
                data: {"a_id": a_id},
                dataType: "json",
                success: function (data) {
                    if (data == 1) {
                       alert("删除成功");
                       location.href="/person/ByUserFind";
                    }
                }
            });
        }

    }
    $("#user-phone").blur(function(){
        var phone = /^1[345789]\d{9}$/;
        alert($(this).val())
        if(!phone.test($(this).val()))
        {
            $("#show-phone").text("请输入正确的手机号");
            $("#show-phone").css({"color":"red"});
        }
        else
        {
            $("#show-phone").text("");
        }
    })
   $(function(){
       layui.use(['form','code'], function(){
          form = layui.form;
          var forms = layui.form;
           layui.code();

           $('#x-city').xcity('广东','广州市','东山区');

           forms.verify({
               texts: function(value) {
                 if(value == "")
                 {
                     return "详细地址不能为空";
                 }
               },
               phone: [ /^[1][3,4,5,6,7,8,9][0-9]{9}$/, '请输入正确的手机号码'],
               name:function(value)
               {
                   if(value=="")
                   {
                       return "收货人名称不能为空";
                   }
               }

           });
           $(document).on('blur','#phone',function(){
               var phone = /^1[345789]\d{9}$/;
               if(!phone.test($(this).val()))
               {
                   $("#show-phone").text("请输入正确的手机号");
                   $("#show-phone").css({"color":"red"});
               }
               else
               {
                   $("#show-phone").text("");
               }
           });
           form.on('submit(demo1)', function(data) {
               // layer.msg(JSON.stringify(data.field));//弹出json格式所有表单的值
               var phone = data.field.phone;
               var username = data.field.username;
               var text = data.field.text;
               var pro = data.field.province;
               var city = data.field.city;
               var area = data.field.area;
               var check = data.field.close;
               var detialss=pro+city+area+text;
               if(check == "on")
               {
                   check="0"
               }
               else
               {
                   check="1"
               }
               if(text == "")
               {
                   return false;
               }
               else
               {

                   $.ajax({
                       url: '/person/add_address',
                       type: "post",
                       data:{"a_namedetials":detialss,"a_phone":phone,"a_name":username,"a_flag":check},
                       dataType: "json",
                       success: function(data) {
                           if(data == 1)
                           {
                               layer.alert("添加成功");
                               location.href="/person/ByUserFind";
                           }
                           else
                           {
                               layer.alert("添加失败,您的收货地址超过十个了。请修改其他的");
                           }
                       },
                       error:function(e){
                           layer.alert("提交失败！")
                       }
                   });
               }

                   return false;
           });





       });

   })

</script>
</body>
</html>
