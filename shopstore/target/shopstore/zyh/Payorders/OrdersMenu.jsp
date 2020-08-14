<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/3/12
  Time: 17:00:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../Deploy.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width: 50%;margin: auto;">
    <form action="/zyh/Payorders/OrdersFind">
        <table style="width: 100%;" border="1px solid black" class="table table-hover table-bordered table-striped">
            <caption><h3>采购详情</h3></caption>
            <tr>
                <td>订单状态::<select name="pay_flag">
                    <option value="">---请选择---</option>
                    <option value="0" ${pay_flag == 0 ? 'selected' : ''}>未审批</option>
                    <option value="1" ${pay_flag == 1 ? 'selected' : ''}>进货</option>
                    <option value="2" ${pay_flag == 2 ? 'selected' : ''}>未通过</option>
                    <option value="3" ${pay_flag == 3 ? 'selected' : ''}>未入库</option>
                    <option value="4" ${pay_flag == 4 ? 'selected' : ''}>已入库</option>
                </select></td>
                <td>
                    下单日期:<input type="date" name="min" value="${min }"> ~~ <input type="date" name="max" value="${max }">
                </td>
                <td>
                    <input type="submit" value="查询" class="btn btn-info">
                </td>
            </tr>
            <tr>
                <td>采购单号</td>
                <td>采购日期</td>
                <td>总价</td>
                <td>状态</td>
                <td>采购详情</td>
            </tr>
            <c:forEach var="map" items="${orders }">
                <tr>
                    <td>${map.in_id }</td>
                    <td>${map.pay_date }</td>
                    <td>${map.pay_price2 }</td>
                    <td>
                        <c:set var="boolean1" value="${map.pay_flag == '0'}"></c:set>
                        <c:set var="boolean2" value="${map.pay_flag == '1'}"></c:set>
                        <c:set var="boolean3" value="${map.pay_flag == '2'}"></c:set>
                        <c:set var="boolean4" value="${map.pay_flag == '3'}"></c:set>
                        <c:set var="boolean5" value="${map.pay_flag == '4'}"></c:set>
                        <c:if test="${boolean1}">
                            <a href="javascript:void(0)" onclick="trim('${map.in_id }',${map.pay_flag})" class="btn btn-info">未审批</a>
                        </c:if>
                        <c:if test="${boolean2}">
                            <a href="javascript:void(0)" onclick="trim('${map.in_id }',${map.pay_flag})" class="btn btn-info">进货</a>
                        </c:if>
                        <c:if test="${boolean3}">
                            <span>未通过</span>
                        </c:if>
                        <c:if test="${boolean4}">
                            <a href="javascript:void(0)" onclick="trim('${map.in_id }',${map.pay_flag})" class="btn btn-info">安排入库</a>
                        </c:if>
                        <c:if test="${boolean5}">
                            <span>已入库</span>
                        </c:if>
                    </td>
                    <td>
                        <a href="/zyh/Payorders/OrdersDetils?nowpage=${now }&in_id=${map.in_id }" class="btn btn-info">详情</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
</div>
<div  style="margin: auto; width: 40%;">
    <a href="/zyh/Payorders/OrdersFind?pay_flag=${pay_flag}&nowpage=1" class="btn btn-info">首页</a>
    <a href="javascript:viod(0)" onclick="page(${now-1 < 1 ? 1 : now-1 })" class="btn btn-info">上一页</a>
    <c:forEach varStatus="i" begin="1" end="${total }" step="1">
        <c:if test="${i.index == now }">
            <span class="btn btn-info" onclick="page(${i.index })">${i.index }</span>
        </c:if>
        <c:if test="${i.index != now }">
            <span class="btn" onclick="page(${i.index })">${i.index }</span>
        </c:if>
    </c:forEach>
    <select onchange="page(this.value)">
        <c:forEach varStatus="i" begin="1" end="${total }" step="1">
            <option value="${i.index }" ${i.index == now ? 'selected' : '' }>${i.index }</option>
        </c:forEach>
    </select>
    <a href="javascript:viod(0)" onclick="page(${now+1 > total ? total : now+1 })" class="btn btn-info">下一页</a>
    <a href="/zyh/Payorders/OrdersFind?pay_flag=${pay_flag}&nowpage=${total }" class="btn btn-info">尾页</a>
</div>
    <script type="text/javascript">
        function trim(id,i)
        {
            if(i == 0) location.href = "/zyh/Payorders/approve?in_id="+id;
            else if(i == 1) location.href = "/zyh/Payorders/purchase?in_id="+id;
            else if(i == 3) location.href = "/zyh/Payorders/MercountAdd?in_id="+id;
        }
        function page(now)
        {
            location.href="/zyh/Payorders/OrdersFind?pay_flag=${pay_flag}&nowpage="+now;
        }
    </script>
</body>
</html>
