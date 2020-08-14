<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>购物车页面</title>

		<link href="../ass/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="../ass/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="../ass/css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="../ass/css/optstyle.css" rel="stylesheet" type="text/css" />
		<link href="/css/layui.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../ass/js/jquery.js"></script>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<script type="text/javascript" src="/static/layui/layui.js"></script>
		<link rel="icon" href="http://59f2dea8d2c25.t73.qifeiye.com/qfy-content/uploads/2017/11/aa9891e0a41a8c53b41cdac4fe8d3526.png" type="image/png"/>
	</head>

	<body>

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

			<div class="nav white" style="width:2000px;">
				<div class="logo"><img src="../ass/img/LOGO.png" /></div>
				<div class="logoBig" style="float:left">
					<li><img src="../ass/img/LOGO.png" sttle="float:left" /></li>
				</div>

				<form class="layui-form" action="" style="width:400px;float:left;margin:50px 0px 0px 120px;">

				<div class="layui-inline">
					<select name="a_id"  lay-verify="" style="float:left">
						 <option value="">--请选择--</option>
						 <c:forEach var="maps" items="${lists }">
							 <option value="${maps.a_id }">${maps.a_namedetials }</option>
						 </c:forEach>
					 </select>
				</div>
					<div style="float:left">
						<a href="javascript:void(0)" id="cl" class="layui-btn" >收货地址详情</a>
					</div>

				</form>
				<%--<form class="layui-form" action="">

					<div class="layui-input-inline">
						<select name="quiz3">
							<option value="">请选择县/区</option>
							<option value="西湖区">西湖区</option>
							<option value="余杭区">余杭区</option>
							<option value="拱墅区">临安市</option>
						</select>
					</div>
				</form>--%>

			</div>

			<div class="clear"></div>

			<!--购物车 -->
			<div class="concent" style="margin-top:240px;">
				<div id="cartTable">
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-chk">
								<div id="J_SelectAll1" class="select-all J_SelectAll">

								</div>
							</div>
							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-op">
								<div class="td-inner">操作</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>

					<tr class="item-list">
						<div class="bundle  bundle-last ">
							<div class="bundle-hd">
							</div>
							<div class="clear"></div>
							<div class="bundle-main">
							<c:forEach var="map" items="${list }">
								<ul class="item-content clearfix">
									<li class="td td-chk">
										<div class="cart-checkbox ">
											<input class="check" id="${map.m_id}" name="items[]" value="${map.m_id }" type="checkbox">
										</div>
									</li>
									<li class="td td-item">
										<div class="item-pic">
											<a href="#" target="_blank" data-title="${map.m_name }" class="J_MakePoint" data-point="tbcart.8.12">
												<img src="${map.img_url}" style="width:80px;height:80px;" class="itempic J_ItemImg"></a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
												<a href="#" target="_blank" title="${map.m_name}" class="item-title J_MakePoint" data-point="tbcart.8.11">${map.m_name}</a>
											</div>
										</div>
									</li>
									<li class="td td-info">
										<div class="item-props item-props-can">
											<span id="t${map.m_id}" name="${map.t_id}"  class="sku-line">${map.t_type}：${map.t_name}</span>
											<i class="theme-login am-icon-sort-desc"></i>
										</div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="price-original">${map.m_oldprice}</em>
												</div>
												<div class="price-line">
													<em id="p${map.m_id}" class="J_Price price-now" tabindex="0">${map.m_price}</em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													<input id="min" class="am-btn am-btn-default" name="${map.m_id}" type="button" value="-" />
													<input  name="${map.m_id}" class="aaaaa" id="text_box${map.m_id}" oninput="value=value.replace(/[^\d]/g,'')"  type="text" value="${map.b_number}" style="width:30px;" />
													<input id="add" class="am-btn am-btn-default" name="${map.m_id}" type="button" value="+" />
													<input type="hidden" id="count_m${map.m_id}" value="${map.m_count }">
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em id="e${map.m_id}" tabindex="0" class="J_ItemSum number">${map.b_number * map.m_price}</em>
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner">
											<a href="javascript:void(0)" onclick="del(${map.b_id})"  class="delete">
                  删除</a>
										</div>
										<input id="b${map.m_id }" type="hidden" value="${map.b_id }">
									</li>
								</ul>
							</c:forEach>
				</div>
				<div class="clear"></div>

				<div class="float-bar-wrapper">
					<div class="float-bar-right">
						<div class="amount-sum">
							<div class="arrow-box">
								<span class="selected-items-arrow"></span>
								<span class="arrow"></span>
							</div>
						</div>
						<div class="price-sum">
							<span class="txt">合计:</span>
							<strong class="price">¥<em id="sum">0.00</em></strong>
						</div>
						<div style="cursor: pointer;" id="go" class="btn-area">
							<a href="javascript:void(0);" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
								<span>结&nbsp;算</span></a>
						</div>
					</div>

				</div>

				<div style="width:100%;height:300px;background: #333333;margin:20px 0px">
		<div style="width:1100px;height:80px;margin:0px auto;border-bottom: 1px solid #474747;">
			
				<img src="../ass/img/图标6.png" style="width:68px;height:58px;margin:10px 0px 0px 0px;float:left "  />  		
			<div>
				<span style="color:#cc0000;font-size:30px;float:left;margin-top:25px;">
					400-125-6512&nbsp;&nbsp;&nbsp;</span>
				<span style="color:white;margin-top:32px;float:left">客服热线&nbsp;&nbsp;&nbsp;9:00-23:00&nbsp;&nbsp;&nbsp;贴心服务</span>	
			</div>    	
		</div>
		
		<div style="width:1100px;height:80px;margin:0px auto;">
			<div style="width:150px;height:100px;color:white;float:left">
				<img src="../ass/img/图标7.png" style="width:42px;height:46px;"/>
				<span style="font-size: 18;">新手入门</span>
				<div style="width:80px;height:20px;margin-left:45px;">
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
				<span style="font-size: 18;">常见问题</span>
				<div style="width:80px;height:20px;margin-left:45px;">
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
				<span style="font-size: 18;">配送说明</span>
				<div style="width:80px;height:20px;margin-left:45px;">
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
				<span style="font-size: 18;">支付方式</span>
				<div style="width:80px;height:20px;margin-left:45px;">
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
				<span style="font-size: 18;">售后服务</span>
				<div style="width:80px;height:20px;margin-left:45px;">
					<a href="#" style="color:#cccccc" >品质保证</a>
				</div>
				<div style="width:80px;height:20px;margin:10px 0px 0px 45px;">
					<a href="#" style="color:#cccccc" >退换货政策</a>
				</div>
				<div style="width:80px;height:20px;margin:10px 0px 0px 45px;">
					<a href="#" style="color:#cccccc" >退换货流程</a>
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

	</body>
	<script>
        $("input:button[id=add]").click(function () {
            var id = $(this).attr("name");
            var count = parseInt($("#text_box"+id).val())+1;
            var counts= parseInt($("#count_m"+id).val());
            var price = parseInt($("#p"+$(this).attr("name")).html());
            var sum   = parseFloat($("#sum").html());
            if (count >= counts)
            {
                $("#text_box"+id).val(counts);
                $("#e"+$(this).attr("name")).html(price * $("#text_box"+id).val());
            }else{
               	 $("#text_box"+id).val(parseInt($("#text_box"+id).val())+1);
				$("#e"+$(this).attr("name")).html(price * $("#text_box"+id).val());
            }
            if ($("#"+id).is(":checked") == true) {
                $("#sum").html(price+sum);
            }
        })
        $("input:button[id=min]").click(function () {
            var sum   = parseFloat($("#sum").html());
            var id = $(this).attr("name");
            var count = parseInt($("#text_box"+id).val())-1;
            var price = parseInt($("#p"+$(this).attr("name")).html());
            if (count <= 0)
            {
                $("#text_box"+id).val(1);
                $("#e"+$(this).attr("name")).html(price * $("#text_box"+id).val());

            }
            else{
                $("#text_box"+id).val($("#text_box"+id).val()-1);
                $("#e"+$(this).attr("name")).html(price * $("#text_box"+id).val());
            }
            if ($("#"+id).is(":checked") == true) {
                if(count == 1 )
                {
                    $("#sum").html(sum-price);
                }
                if(count > 1)
                {
                    $("#sum").html(sum-price);
                }
            }
        })
        $(".aaaaa").change(function () {
            var id = $(this).attr("name");
            var count = parseInt($(this).val());
            var counts =parseInt($("#count_m"+id).val());
            var price = parseInt($("#p"+$(this).attr("name")).html());
            if (count > counts)
            {
            	$(this).val(1);
                $("#e"+$(this).attr("name")).html(price * $("#text_box"+id).val());
            }
            else
			{
                $("#e"+$(this).attr("name")).html(price * $("#text_box"+id).val());
            }
        })
        $("input:checkbox").click(function ()
		{
			var id = $(this).attr("id");
            var price = parseFloat($("#e" + id).html());
            var sum   = parseFloat($("#sum").html());
            if ($(this).is(":checked") == true) {
                $("#sum").html(price+sum);
            }
            else{
                $("#sum").html(sum-price);
                }
        })
	$("#go").click(function ()
	{
		var sum  = parseInt($("#sum").html());
		if (sum == 0 )
		{
		    alert("请购买商品！");
		}
		else
		{
            var a_id = $("select[name='a_id']").val();

            if (a_id == "")
			{
			    alert("请把个人信息填写完整！");
			}
			else
			{
			    var a_name =  $("select[name='a_id']  option:selected").text();
			    var con = confirm("确定要发货到这个地址下"+a_name+"嘛?");
				if(con)
				{
                    var m_id = new Array();
                    var o_user = <%= session.getAttribute("user")%>;
                    var t_id = new Array();
                    var b_id = new Array();
                    var buy_number = new Array();
                    $("input:checkbox:checked").each(function(i){
                        m_id[i] = $(this).val();
                        var id = $(this).attr("id");
                        t_id[i] = $("#t"+id).attr("name");
                        buy_number[i] = $("#text_box"+id).val();
                        b_id[i] = $("#b"+id).val();
                    });
                    location.href="BuycarsPay?b_id="+b_id+"&m_id="+m_id+"&t_id="+t_id+"&buy_number="+buy_number+"&o_price="+sum+"&b_user="+o_user+"&a_id="+a_id;
				}

            }
		}
    })
		function del(id) {
            var o_user = <%= session.getAttribute("user")%>;
            var flag = confirm("确认要删除吗？");
   			if (flag)
			{
			    location.href="sp_del?b_id="+id+"&b_user="+o_user;
			}
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
        var layer ;
        $(function(){
            layui.use(['layer','form'], function() { //独立版的layer无需执行这一句
                var $ = layui.jquery;
				layer = layui.layer; //独立版的layer无需执行这一句
                var form = layui.form;
                form.on('submit(demo1)', function(data){
                    layer.alert(JSON.stringify(data.field), {
                        title: '最终的提交信息'
                    })
                    return false;
                });
            })


        })
          $("#cl").click(function(){
              var a_id = $("select[name='a_id']").val();
              if(a_id=="")
			  {
			      a_id=0;
			  }
                  $.ajax({
                      url: '/toshowDetials',
                      type: 'post',
                      data: {"a_id":a_id},
                      dataType : "json",
                      success: function (result) {
                          layer.open({
                              type: 1 //Page层类型
                              ,area: ['500px', '300px']
                              ,title: '收货地址详情'
                              ,shade: 0.6 //遮罩透明度
                              ,maxmin: true //允许全屏最小化
                              ,anim: 1 //0-6的动画形式，-1不开启
                              ,content: result
                          });
                      }
                  });
          });



	</script>
</html>