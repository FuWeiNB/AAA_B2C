<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/3/10
  Time: 14:40:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../Deploy.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width: 70%;margin: auto;">
    <form action="/zyh/Payorders/goodsfindAll">
        <table style="width: 100%;" class="table-bordered table-condensed table-hover table-striped">
            <caption><h3>库存信息</h3></caption>
            <tr>
                <td></td>
                <td>商品名称：<input type="text" name="m_name" value="${mer.m_name }" /></td>
                <td>
                    商品类别：<select class="select" name="c_id">
                    <option value="">请选择</option>
                    <c:forEach var="pro" items="${Product_ca }">
                        <option value="${pro.c_Id }" ${pro.c_Id == mer.c_id ? 'selected' : '' }>${pro.c_Name }</option>
                    </c:forEach>
                    </select>
                </td>
                <td colspan="2" style="text-align: center"><input type="submit" class="btn btn-info" value="查询" /></td>
                <td  style="text-align: center"><a href="/zyh/Payorders/OrdersFind" class="btn btn-info">查看采购单</a> </td>
            </tr>
            <tr>
                <td>商品编号</td>
                <td>商品名称</td>
                <td>商品类型</td>
                <td>商品库存</td>
                <td>是否进货</td>
                <td>操作</td>
            </tr>>
            <c:forEach var="map" items="${goods }">
                <tr>
                    <td>${map.m_id }</td>
                    <td>${map.m_name }</td>
                    <td>${map.c_Name }</td>
                    <td>${map.m_count}</td>
                    <td>
                        <c:if test="${map.m_count < 30}">
                            需要进货
                        </c:if>
                        <c:if test="${map.m_count > 30}">
                            货源充足
                        </c:if>
                    </td>
                    <td><input onclick="toInsert(${map.m_id },${map.c_Id})" type="button" class="btn btn-info" value="加入采购单"></td>
                </tr>
            </c:forEach>
        </table>
    </form>
</div>
    <div style="margin: auto; width: 70%;">
        <a href="/zyh/Payorders/goodsfindAll?nowpage=1" class="btn btn-info">首页</a>
        <a href="javascript:void(0)" onclick="paging(${nowpage-1 < 1 ? 1 : nowpage-1 })" class="btn btn-info">上一页</a>
        <c:forEach varStatus="i" begin="1" end="${total }" step="1">
            <c:if test="${i.index == nowpage }">
                <span class="btn btn-info" onclick="paging(${i.index })">${i.index }</span>
            </c:if>
            <c:if test="${i.index != nowpage }">
                <span class="btn" onclick="paging(${i.index })">${i.index }</span>
            </c:if>
        </c:forEach>
        <select onchange="paging(this.value)">
            <c:forEach varStatus="i" begin="1" end="${total }" step="1">
                <option value="${i.index }" ${i.index == nowpage ? 'selected' : '' }>${i.index }</option>
            </c:forEach>
        </select>&nbsp;/&nbsp;${total }
        <a href="javascript:void(0)" onclick="paging(${nowpage+1 > total ? total : nowpage+1 })" class="btn btn-info">下一页</a>
        <a href="/zyh/Payorders/goodsfindAll?nowpage=${total }" class="btn btn-info">尾页</a>
    </div>
</div>
    <script type="text/javascript">
        function paging(now)
        {
            location.href="/zyh/Payorders/goodsfindAll?nowpage="+now;
        }
        function toInsert(id,c_Id){
            location.href="/zyh/Payorders/toTro?m_id="+id+"&c_id="+c_Id;
        }
    </script>
</body>
</html>
