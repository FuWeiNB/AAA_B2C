<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/1/4
  Time: 10:06:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../Deploy.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div style="width:70%;margin: auto;">
        <form action="/zyh/Dept/findAll">
            <table style="width: 100%;" class="table-bordered table-condensed table-hover table-striped">
                <caption><h3>部门信息</h3></caption>
                <tr>
                    <td></td>
                    <td>部门名称：<input type="text" name="d_name" value="${entity.d_name }" /></td>
                    <td><input type="submit" value="查询" class="btn btn-info"/></td>
                </tr>
                <tr>
                    <td>部门编号</td>
                    <td>部门名称</td>
                    <td>部门地址</td>
                    <td>操作</td>
                </tr>
                <c:forEach var="map" items="${dept }">
                    <tr>
                        <td>${map.d_id }</td>
                        <td>${map.d_name }</td>
                        <td>${map.d_loc }</td>
                        <td>
                            <a href="javascript:void(0)" onclick="trim(${map.d_id },1)" class="btn btn-info">删除</a>
                            <a href="javascript:void(0)" onclick="trim(${map.d_id },2)" class="btn btn-info">修改</a>
                        </td>
                    </tr>
                </c:forEach>
                <tr align="center">
                    <td colspan="4"><a href="/zyh/Dept/DeptAdd.jsp" class="btn btn-info">添加部门</a></td>
                </tr>
            </table>
        </form>
        <div style="margin: auto; width: 70%;">
            <a href="/zyh/Dept/findAll?d_name=${entity.d_name}&nowpage=1" class="btn btn-info">首页</a>
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
            <a href="/zyh/Dept/findAll?d_name=${entity.d_name}&nowpage=${total }" class="btn btn-info">尾页</a>
        </div>
    </div>
    <script type="text/javascript">
        function trim(id,m)
        {
            var flag = confirm("确定执行吗？");
            if(flag)
            {
                if(m == 1) location.href="/zyh/Dept/del?d_id="+id;
                else if(m == 2) location.href="/zyh/Dept/toUpd?d_id="+id;
            }
        }
        function paging(now)
        {
            location.href="/zyh/Dept/findAll?d_name=${entity.d_name}&nowpage="+now;
        }
    </script>
</body>
</html>
