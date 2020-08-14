<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>商品页面</title>
	<link rel="icon" href="http://59f2dea8d2c25.t73.qifeiye.com/qfy-content/uploads/2017/11/aa9891e0a41a8c53b41cdac4fe8d3526.png" type="image/png"/>

	<link href="../ass/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="../ass/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="../ass/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link type="text/css" href="../ass/css/optstyle.css" rel="stylesheet" />
	<link type="text/css" href="../ass/css/style.css" rel="stylesheet" />

	<script type="text/javascript" src="../ass/basic/js/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="../ass/basic/js/quick_links.js"></script>
	<script src="/js/jquery.js"></script>
	<script type="text/javascript" src="../ass/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	<script type="text/javascript" src="../ass/js/jquery.imagezoom.min.js"></script>
	<script type="text/javascript" src="../ass/js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="../ass/js/list.js"></script>

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
			<div class="menu-hd">
				<div class="menu-hd">
					<a id="mc-menu-hd" href="/joinroom.jsp" target="_bank" style="color:white">
					<span>客服</span></a>
				</div>
		</div>
		<%--<div class="topMessage favorite">
            <div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>

        </div>--%>
	</ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
	<div class="logo"><img src="../ass/img/LOGO.png" /></div>
	<div class="logoBig">
		<li><img src="../ass/img/LOGO.png" /></li>
	</div>
	<div class="search-bar pr">
		<a name="index_none_header_sysc" href="#"></a>
		<form action="/like_sh" method="post">
			<input id="searchInput" name="m_name" type="text" placeholder="搜索" autocomplete="off">
			<input id="ai-topsearch" class="submit am-btn"  value="搜索" index="1" type="submit">
		</form>
	</div>
</div>

<div class="clear"></div>
<b class="line"></b>
<div class="listMain">

	<!--分类-->
	<div class="nav-table">

	</div>
	<!--放大镜-->

	<div class="item-inform">
		<div style="margin-left:120px; " class="clearfixLeft" id="clearcontent">

			<div class="box">
				<div class="tb-booth tb-pic tb-s310">

						<img src="" alt="细节展示放大镜特效" rel="" class="jqzoom" />
					</div>
				<ul class="tb-thumb" id="thumblist">
					<span id="cla">
					<c:set var="indexs" value="1"></c:set>
					<c:forEach var="map_m" items="${list_m }">
						<li name="${indexs }" style="cursor:pointer;">
							<div class="tb-pic tb-s40">
								<img id="${indexs }" src="${map_m.img_url}" mid="${map_m.img_url}" big="${map_m.img_url}" width="60" height="58.75">
							</div>
						</li>
						<c:set var="indexs" value="${indexs+1}"></c:set>
					</c:forEach>
						</span>
					<span id="indexs" name="${indexs }"></span>
				</ul>
			</div>

			<div class="clear"></div>
		</div>

		<div class="clearfixRight" style="width: 400px;margin-left: 40px;margin-top:30px;">

			<!--规格属性-->
			<!--名称-->
			<c:forEach var="map" items="${list_m}" end="0">
			<div class="tb-detail-hd">
				<h1>
					${map.m_name}
				</h1>
			</div>
			<div class="tb-detail-list" style="width: 300px; ">
				<!--价格-->
				<div class="tb-detail-price" s>
					<li style="margin-top: -20px;" class="price iteminfo_price">
						<dt>促销价</dt>
						<dd><em>¥</em><b class="sys_item_price">${map.m_price}</b>  </dd>
					</li>
					<li class="price iteminfo_mktprice">
						<dt>原价</dt>
						<dd><em>¥</em><b class="sys_item_mktprice">${map.m_oldprice}</b></dd>
					</li>
					<div class="clear"></div>
				</div>

				<div class="clear"></div>

				<!--各种规格-->
				<dl class="iteminfo_parameter sys_item_specpara">
					<dt class="theme-login"><div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div></dt>
					<dd>
						<!--操作页面-->

						<div class="theme-popover-mask"></div>
						<input id="m_id" type="hidden" value="${map.m_id }">
						<div class="theme-popover">
							<div class="theme-span"></div>
								<div class="theme-popbod dform">
									<div class="theme-signin-left">
										<c:set var="type" value=""></c:set>
										<c:forEach var="map_t" items="${list_t}">
												<c:if test="${type == ''|| type != map_t.t_type}">
										<div class="theme-options">
											<div class="cart-title">${map_t.t_type}</div>
											<ul id="type">
												<c:set var="index" value="0"></c:set>
												<c:forEach var="map_ty" items="${list_t }">
												<c:if test="${map_ty.t_type == map_t.t_type}">
												<c:if test="${index == 0}" >
												<li name="${map_t.t_id}" id="${map_ty.t_id}" class="sku-line selected">${map_ty.t_name}<i></i></li>
												<input id="in${map_t.t_id}" type="hidden" value="${map_ty.t_id}">
												</c:if>
												<c:if test="${index != 0}" >
												<li name="${map_t.t_id}" id="${map_ty.t_id}" class="sku-line">${map_ty.t_name}<i></i></li>
												</c:if>
												<c:set var="index" value="${index+1}"></c:set>
												</c:if>
												</c:forEach>
											</ul>
										</div>
											</c:if>
												<c:set var="type" value="${map_t.t_type}"></c:set>
										</c:forEach>
										<div class="theme-options">
											<div class="cart-title number">数量</div>
					<dd>
						<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
						<input id="text_box" oninput="value=value.replace(/[^\d]/g,'')"  type="text" value="1" style="width:30px;" />
						<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
						<span id="Stock" class="tb-hidden">库存<span class="stock">${map.m_count }</span>件</span>
						<input type="hidden" id="count_m" value="${map.m_count }">
					</dd>
				</dl>
				<div class="pay">
					<li>
						<div class="clearfix tb-btn tb-btn-buy theme-login">
							<a id="Buy" title="点此按钮到下一步确认购买信息"style="cursor: pointer;" >立即购买</a>
						</div>
					</li>
					<li>
						<div class="clearfix tb-btn tb-btn-basket theme-login">
							<a id="sp" title="加入购物车" style="cursor: pointer;"><i></i>加入购物车</a>
						</div>
					</li>

				</div>
			</div>
		</div>
			<div class="clear"></div>

</div>
	</div>
</div>
</dd>
<div class="clear"></div>

</c:forEach>
</div>
<div class="clear"></div>

<div class="introduce">
	<div class="browse">

	</div>

	<div class="introduceMain" style="margin-left: 120px;">
		<div class="am-tabs" data-am-tabs>
			<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
				<li class="am-active">
					<a href="#">

						<span class="index-needs-dt-txt">宝贝详情</span></a>

				</li>
			</ul>

			<div class="am-tabs-bd">

				<div class="am-tab-panel am-fade am-in am-active">
					<div class="J_Brand">

						<div class="attr-list-hd tm-clear">
							<h4>产品详情：</h4></div>
						<div class="clear"></div>
						<ul id="J_AttrUL">
							<c:forEach var="map" items="${list_m }" end="0">
							<li title="">${map.m_detail }</li>
							</c:forEach>
						</ul>
						<div class="clear"></div>
					</div>

					<div class="details">
						<div class="attr-list-hd after-market-hd">
							<h4>商品细节</h4>
						</div>
						<div class="twlistNews">
							<c:forEach var="map" items="${list_m }" >
								<img src="${map.img_url}" />
							</c:forEach>
						</div>
					</div>
					<div class="clear"></div>

				</div>

				<div class="clear"></div>

				<div class="clear"></div>
			</div>

			<div class="am-tab-panel am-fade">


			</div>

		</div>

		<div class="clear"></div>

		<div style="width:100%;height:300px;background: #333333;">
			<div style="width:960px;height:80px;margin:0px auto;border-bottom: 1px solid #474747;">

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
</div>
</div>
</div>
</div>

</div>
</div>
<!--菜单 -->
<div class=tip>
	<div id="sidebar">
		<div id="wrap">
			<div onclick="sp()" id="shopCart" class="item">
				<a>
					<span class="message"></span>
				</a>
				<p>
					购物车
				</p>
			</div>

			<!--回到顶部 -->
			<div id="quick_links_pop" class="quick_links_pop hide"></div>

		</div>

	</div>
	<div id="shopCart-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>
			购物车
		</div>
	</div>
</div>

</body>
<script type="text/javascript">
    var index = parseInt($("#indexs").attr("name"))-1;
    var i = 0;
    $(function ()
    {
        $("#cla li").click(function ()
        {
            $("#cla li").removeClass("tb-selected");
            $(this).addClass("tb-selected");
            i = parseInt($(this).attr("name"))-1;
            var src = $("#"+(i+1)).attr("src");
            $(".jqzoom").attr("src",src);
            $(".jqzoom").attr("rel",src);
        })
        indexss();
    })
    function indexss()
    {
        if(i > index)
        {
            i=0;
        }
        $($("#cla li").get(i)).click();
        setTimeout("indexss()", 2000);
        i++;
    }
</script>
<script>
   $("#type li").click(function () {
        $("#type li").removeClass("sku-line selected").addClass("sku-line");
        $(this).addClass("sku-line selected");
        var id = $(this).attr("name");
        $("#in"+id).val($(this).attr("id"));
    })
	$("#add").click(function () {
        var count = parseInt($("#text_box").val())+1;
        var counts =parseInt($("#count_m").val());
        if (count >= counts)
        {
            $("#text_box").val(counts);
        }else{
        $("#text_box").val(parseInt($("#text_box").val())+1);}
    })
	$("#min").click(function () {
        var count = parseInt($("#text_box").val())-1;
		if (count <= 0)
		{
		    $("#text_box").val(1);
		}
		else{
        $("#text_box").val($("#text_box").val()-1);}
    })
	$("#text_box").change(function () {
		var count = parseInt($(this).val());
		var counts =parseInt($("#count_m").val());
		if (count > counts)
		{
            $(this).val(1);
		}
    })
	$("#sp").click(function ()
	{
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
              var m_id = $("input[id='m_id']").val();
              var m_count = $("#text_box").val();
              var arr = new Array();
              $(".selected").each(function (i) {
                  arr[i] = $(this).attr("id");
              })
              $.ajax({
                  url:"add_sp",
                  type:"post",
                  data:{"m_id":m_id,"t_id":arr,"m_count":m_count},
                  traditional :true,
                  success:function (data)
                  {
                      alert(data);
                  }
              })
		  }

    })

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
    $("#Buy").click(function ()
    {
        var user = <%= session.getAttribute("user")%>;
        if(user == null)
        {
            alert("请先登陆！");
        }
        else
        {
            var m_id = $("#m_id").val();
            var m_count = $("#text_box").val();
            var arr = new Array();
            $(".selected").each(function (i) {
                arr[i] = $(this).attr("id");
            })
            location.href = "BuyItNow?m_id="+m_id+"&t_id="+arr+"&m_count="+m_count+"&b_user="+user;
        }

    })
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
</html>