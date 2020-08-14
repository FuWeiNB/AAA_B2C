<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/3/5
  Time: 17:25:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../Deploy.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width: 70%; margin: auto;">
    <form action="/zyh/Role/findAll" method="post">
        <table style="width: 100%;" class="table-bordered table-condensed table-hover table-striped">
            <caption>职位信息</caption>
            <tr>
                <td>职位姓名:<input type="text" name="r_name" value="${entity.r_name }" /></td>
                <td><input type="submit" value="查询" class="btn btn-info" /></td>
            </tr>
            <tr>
                <td>职位编号</td>
                <td>职位名称</td>
                <td>分配权利</td>
            </tr>
            <c:forEach var="r" items="${page }">
                <tr>
                    <td>${r.r_id }</td>
                    <td>${r.r_name }</td>
                    <td><a href="/zyh/Role/toUpd?r_id=${r.r_id }" class="btn btn-info">分配权利</a></td>
                </tr>
            </c:forEach>
        </table>
    </form>
</div>
<div style="margin: auto; width: 70%;">
    <a href="/zyh/Role/findAll?r_name=${entity.r_name}&nowpage=1" class="btn btn-info">首页</a>
    <a href="javascript:void(0)" onclick="page(${nowpage-1 < 1 ? 1 : nowpage-1})" class="btn btn-info">上一页</a>
    <c:forEach varStatus="i" begin="1" end="${total }" step="1">
        <c:if test="${i.index == nowpage }">
            <span class="btn btn-info" onclick="page(${i.index })">${i.index }</span>
        </c:if>
        <c:if test="${i.index != nowpage }">
            <span class="btn" onclick="page(${i.index })">${i.index }</span>
        </c:if>
    </c:forEach>
    <select onchange="page(this.value)">
        <c:forEach varStatus="i" begin="1" end="${total }" step="1">
            <option value="${i.index }" ${i.index == nowpage ? 'selected' : '' }>${i.index }</option>
        </c:forEach>
    </select>/${total }
    <a href="javascript:void(0)" onclick="page(${nowpage+1 > total ? total : nowpage+1})" class="btn btn-info">下一页</a>
    <a href="/zyh/Role/findAll?r_name=${entity.r_name}&nowpage=${total }" class="btn btn-info">尾页</a>
</div>
    <script type="text/javascript">
        function page(now)
        {
            location.href="/zyh/Role/findAll?r_name=${entity.r_name}&nowpage="+now;
        }
    </script>
</body>
</html>
