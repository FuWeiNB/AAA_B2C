<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/1/4
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/layui.css" media="all">
<script src="/js/layui.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<input type="button" value="查看退货退款"/>
     <table class="layui-table" lay-skin="row" lay-size="sm">
         <tr>
             <td>订单编号</td>
             <td>收货人</td>
             <td>总金额</td>
             <td>应付金额</td>
             <td>支付状态</td>
             <td>发货状态</td>
             <td>操作</td>
         </tr>
         <c:forEach var="map" items="${list }">
             <tr>
                 <td>${map.o_id}</td>
                 <td>${map.name}:${map.a_phone}</td>
                 <td>${map.o_price }</td>
                 <td>${map.o_price }</td>
                 <td>${map.o_flag == 0 ? '未支付':'已支付'  }</td>
                 <td>
                     <c:if test="${map.o_flag == 1}">
                         <span> 待发货</span> <input type="button"  class="layui-btn layui-btn-xs" value="确认发货"/>
                     </c:if>
                     <c:if test="${map.o_flag == 2}">
                     <span>  已发货</span>
                     </c:if>
                     <c:if test="${map.o_flag==3 || map.o_flag == 4}">
                     <span>  已收货</span>
                     </c:if>
                     <c:if test="${map.o_flag==0}">
                        <span style="color:red"> 无法发货 </span>
                     </c:if>
                 </td>
               <td>
                   <a href="javascript:void(0)" class="layui-btn layui-btn-sm"  >详情</a>

                     <a href="javascript:void(0)" class="layui-btn layui-btn-sm" >编辑</a></td>
             </tr>
         </c:forEach>
     </table>
<div>
<c:forEach varStatus="i" begin="1" end="${page.totalPage}" step="1">
    <c:if test="${i.index== page.nowpage }">
        <span class="btn btn-info" onclick="topage(${i.index})">${i.index }</span>
    </c:if>
    <c:if test="${i.index!= page.nowpage }">
        <span class="btn" onclick="topage(${i.index})">${i.index }</span>
    </c:if>
</c:forEach>
</div>
<script type="text/javascript">
      function topage(page)
      {
          if(page<1)
          {
              page=1;
          }
          if(page>${page.totalPage})
          {
              page=${page.totalPage};
          }
          location.href="/orders/show?nowpage="+page;
      }

</script>
</body>
</html>
