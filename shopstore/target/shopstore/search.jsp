<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="icon" href="http://59f2dea8d2c25.t73.qifeiye.com/qfy-content/uploads/2017/11/aa9891e0a41a8c53b41cdac4fe8d3526.png" type="image/png"/>
		<title>搜索页面</title>

		<link href="/ass/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="/ass/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="/ass/basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="/ass/css/seastyle.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="/ass/basic/js/jquery-1.7.min.js"></script>

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
				<div class="menu-hd"><div class="menu-hd">
					<a id="mc-menu-hd" href="/joinroom.jsp" target="_bank" style="color:white">
					<span>客服</span></a></div>
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
						<input id="searchInput" name="m_name" type="text" value="${m_name }" placeholder="搜索" autocomplete="off">
						<input id="ai-topsearch" class="submit am-btn"  value="搜索" index="1" type="submit">
					</form>
				</div>
			</div>

			<div class="clear"></div>
			<b class="line"></b>
           <div class="search">
			<div class="search-list">
			<div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>

						</div>
			</div>
					<div class="am-g am-g-fixed">
						<div class="am-u-sm-12 am-u-md-12">
	                  	<div class="theme-popover">														
							<div class="searchAbout">

							</div>
							<ul  class="select" id="imgZmList">
								<li  class="select-result">
									<dl >
										<dt>已选</dt>
										<dd class="select-no"></dd>
										<p class="eliminateCriteria">清除</p>
									</dl>
								</li>
								<div class="clear"></div>
								<li  class="select-list">
									<dl id="select1">
										<dt class="am-badge am-round">酒类</dt>
                                        <div class="dd-conent">
											<dd onclick="sd(0,1)" id="0" class="select-all selected"><a href="#">全部</a></dd>
                                             <c:forEach var="map_pc" items="${list_pc }">
                                            <dd id="${map_pc.c_Id}" onclick="sd(${map_pc.c_Id},1),list_pc(${map_pc.c_Id})"><a href="#">${map_pc.c_Name}</a></dd>
										    </c:forEach>
                                         </div>
						
									</dl>
								</li>
					        
							</ul>
							<div class="clear"></div>
                        </div>
							<div class="search-content">
								<div class="clear"></div>

								<ul id="like_pm" class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes"   >
									<c:forEach var="map" items="${list }" >
									<li>
										<a href="md_view?m_id=${map.m_id }">
										<div class="i-pic limit">
											<img src="${map.img_url }" style="width:218px;height:218px;" />
											<p class="title fl">${map.m_name }</p>
											<p class="price fl">
												<b>¥</b>
												<strong>${map.m_price }</strong>
											</p>
											<p class="number fl">
											</p>
										</div>
										</a>
									</li>
									</c:forEach>
								</ul>
							</div>

							</div>
							<div class="clear"></div>
							<%--<!--分页 -->
							<ul class="am-pagination am-pagination-right">
								<li class="am-disabled"><a href="#">&laquo;</a></li>
								<li class="am-active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>--%>

						</div>
					</div>
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
			<div style="width:150px;height:100px;color:white;float:left;margin-left:40px">
				<img src="../ass/img/图标12.png" style="width:37px;height:36px;"/>
				<span style="font-size: 18;">特色服务</span>
				<div style="width:80px;height:20px;margin-left:45px;">
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
			</div>
		</div>
		</div>
				</div>

			</div>

		<!--引导 -->
		<div class="navCir">
			<li><a href="home2.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>					
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
		</div>
		<script>
			window.jQuery || document.write('<script src="../ass/basic/js/jquery-1.9.min.js"><\/script>');
		</script>
		<script type="text/javascript" src="../ass/basic/js/quick_links.js"></script>

<div class="theme-popover-mask"></div>

	</body>
    <script src="/lib/layui/layui.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="text/javascript" src="/js/publishImg.js"></script>
    <script>
        function list_pc(id)
        {
            $.ajax({
                url:"/Select_pc",
                type:"post",
                data:"",
                dataType:"json",
                success:function (data)
                {
                        var arr = data.list;
                    	var html ="<li class=\"select-result\">";
                       	html +=$("ul .select-result").html();
					    html += "</li>";
	                    html += "<li class=\"select-list\">";
						html +=$("ul .select-list").html();
	                    html += "</li>";
					for(var i = 0 ;i < data.list.length;i++)
                        {
                            if (arr[i].c_Flag == id)
							{
                            	html +="<li class=\"select-list\" >";
                            	html +="<dl id='select"+arr[i].c_Id+"'>";
								html +="<dt class='am-badge am-round'>"+arr[i].c_Name+"</dt> ";
								html +="<div class='dd-conent'> ";
								html +="<dd id =\"0\" onclick=\"sd(0,"+arr[i].c_Id+")\" class='select-all selected'><a href='#'>全部</a></dd> ";
								for (var x = 0 ;x < data.list.length;x++)
								{
									if (arr[x].c_Flag == arr[i].c_Id)
									{
                                    	html +="<dd id =\""+arr[x].c_Id+"\" onclick=\"sd("+arr[x].c_Id+","+arr[i].c_Id+")\" ><a href='#'>"+arr[x].c_Name+"</a></dd> ";
                                    }
                                    else
									{
									    continue;
									}
                                }
								html +="</div> ";
                                html +="</dl>";
                                html +="</li>";
                            }
                            else {continue;}
                        }
                        $('#imgZmList').html(html);
						$("li").attr("style",'');
                    $(".select-result").show();
                	}
                })
        }
       </script>
<
	<script !src="">
        $(".select dd").live("click", function() {

            if ($(".select-result dd").length > 1)
            {
                $(".select-no").hide();
                $(".eliminateCriteria").show();
                $(".select-result").show();
                var arr = new Array();
                $(".select-result dd").each(function(i){
                    arr[i] = $(this).attr("name");
                    arr[0] = 1;
                });
                $.ajax({
                    url:"/like_pm",
                    type:"post",
                    data:{"c_id":arr},
                    traditional :true,
                    dataType:"json",
                    success:function (data)
                    {
                        $("#like_pm").html(data);
                    }
                })
            }
            else {
                $(".select-no").show();
                $(".select-result").hide();
            }
        });
	</script>
	<script>

        function sd (id,index) {
            if (id == 0 && index == 1)
            {
                location.href="Sh";
            }
            if (id == 0 || index == 1) {
                var html = "<li class=\"select-result\">";
                html += "<dl >" +
                    "<dt>已选</dt>" +
                    "<dd class=\"select-no\"></dd>" +
                    "<p class=\"eliminateCriteria\">清除</p>" +
                    "</dl>";
                html += "</li>";
                html += "<li class=\"select-list\">";
                html += $("ul .select-list").html();
                html += "</li>";
                $('#imgZmList').html(html);
                $("#"+id).addClass("selected").siblings().removeClass("selected");
                if ($("#" + id).hasClass("select-all")) {
                    $("#selects" + index).remove();
                } else {
                    var copyThisA = $("#" + id).clone();
                    if ($("#selects" + index).length > 0) {
                        $("#selects" + index + " a").html($("#" + id).text());
                        $("#selects" + index).attr("name", id);
                    } else {
                        $(".select-result dl").append(copyThisA.attr("id", "selects" + index));
                        $(".select-result dl").append(copyThisA.attr("onclick", "re(" + index + ")"));
                        $(".select-result dl").append(copyThisA.attr("name", id));
                    }
                }
                var arr = new Array();
                $(".select-result dd").each(function(i){
                    arr[i] = $(this).attr("name");
                    arr[0] = 1;
                });
                $.ajax({
                    url:"/like_pm",
                    type:"post",
                    data:{"c_id":arr},
                    traditional :true,
                    dataType:"json",
                    success:function (data)
                    {
                        $("#like_pm").html(data);
                    }
                })
            }
			else{
            $("#"+id).addClass("selected").siblings().removeClass("selected");
            if ($("#"+id).hasClass("select-all")) {
                $("#selects"+index).remove();
            } else {
                var copyThisA = $("#"+id).clone();
                if ($("#selects"+index).length > 0) {
                    $("#selects"+index+" a").html($("#"+id).text());
                    $("#selects"+index).attr("name", id);
                } else {
                    $(".select-result dl").append(copyThisA.attr("id", "selects"+index));
                    $(".select-result dl").append(copyThisA.attr("onclick", "re("+index+")"));
                    $(".select-result dl").append(copyThisA.attr("name", id));
                }
            }
            }
        }

        function re(index) {
			if (index == 1)
			{
                location.href="Sh";
			}
			else{
            $("#selects"+index).remove();
            $("#select"+index+" .select-all").addClass("selected").siblings().removeClass("selected");$(".select-result").hide();
            $('#imgZmList').html($(".select").html());
            $(".select-result").show();
                var arr = new Array();
                $(".select-result dd").each(function(i){
                    arr[i] = $(this).attr("name");
                    arr[0] = 1;
                });
                $.ajax({
                    url:"/like_pm",
                    type:"post",
                    data:{"c_id":arr},
                    traditional :true,
                    dataType:"json",
                    success:function (data)
                    {
                        $("#like_pm").html(data);
                    }
                })
			}
        }

        $(".eliminateCriteria").live("click", function() {
            $("#selectA").remove();
            $("#selectB").remove();
            $("#selectC").remove();
            $(".select-all").addClass("selected").siblings().removeClass("selected");
            $(".eliminateCriteria").hide();
            $(".select-no").show();
            $(".select-result").hide();

        });
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










</html>