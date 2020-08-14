<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/3/8
  Time: 15:06:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../Deploy.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width: 90%;margin: auto;">
    <form action="/zyh/Supplier/findAll">
        <table style="width: 100%;" class="table-bordered table-condensed table-hover table-striped">
            <caption><h3>供应商信息</h3></caption>
            <tr>
                <td></td>
                <td>供应商名称：<input type="text" name="s_name" value="${entity.s_name }" /></td>
                <td>
                    供应商类别：<select class="select" name="c_id">
                        <option value="">请选择</option>
                        <c:forEach var="pro" items="${Product_ca }">
                            <option value="${pro.c_Id }" ${pro.c_Id == entity.c_id ? 'selected' : '' }>${pro.c_Name }</option>
                        </c:forEach>
                    </select>
                </td>
                <td><input type="submit" class="btn btn-info" value="查询" /></td>
            </tr>
            <tr>
                <td>供应商编号</td>
                <td>供应商名称</td>
                <td>供应商类别</td>
                <td>操作</td>
            </tr>
            <c:forEach var="map" items="${Supplier }">
                <tr>
                    <td>${map.s_id }</td>
                    <td>${map.s_name }</td>
                    <c:forEach var="pro" items="${Product_ca }">
                        <c:if test="${pro.c_Id == map.c_id}">
                            <td>${pro.c_Name}</td>
                        </c:if>
                    </c:forEach>
                    <td>
                        <a href="javascript:void(0)" onclick="trim(${map.s_id },1)" class="btn btn-info">删除</a>
                        <a href="javascript:void(0)" onclick="trim(${map.s_id },2)" class="btn btn-info">修改</a>
                    </td>
                </tr>
            </c:forEach>
            <tr align="center">
                <td colspan="4"><a href="/zyh/Supplier/toAdd" class="btn btn-info">添加供应商</a></td>
            </tr>
        </table>
    </form>
    <div style="margin: auto; width: 70%;">
        <a href="/zyh/Supplier/findAll?s_name=${entity.s_name}&c_id=${entity.c_id}&nowpage=1" class="btn btn-info">首页</a>
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
        <a href="/zyh/Supplier/findAll?s_name=${entity.s_name}&c_id=${entity.c_id}&nowpage=${total }" class="btn btn-info">尾页</a>
    </div>
</div>
<script type="text/javascript">
    function trim(id,m)
    {
        var flag = confirm("确定执行吗？");
        if(flag)
        {
            if(m == 1) location.href="/zyh/Supplier/del?s_id="+id;
            else if(m == 2) location.href="/zyh/Supplier/toUpd?s_id="+id;
        }
    }
    function paging(now)
    {
        location.href="/zyh/Supplier/findAll?s_name=${entity.s_name}&c_id=${entity.c_id}&nowpage="+now;
    }
</script>
</body>
</html>
