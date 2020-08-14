<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/1/4
  Time: 14:57:52
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
        <form action="/zyh/Emp/findAll">
            <table style="width: 100%;" class="table-bordered table-condensed table-hover table-striped">
                <caption><h3>员工信息</h3></caption>
                <tr>
                    <td>是否离职:<select class="select" name="e_flag">
                        <option value="1" ${emp.e_flag == "1" ? 'selected' : ''}>离职</option>
                        <option value="0" ${emp.e_flag == "0" ? 'selected' : ''}>在职</option>
                    </select></td>
                    <td>部门名称：<input type="text" name="d_name" value="${dept.d_name }" /></td>
                    <td>员工名称：<input type="text" name="e_name" value="${emp.e_name }"></td>
                    <td>职位名称：<input type="text" name="r_name" value="${role.r_name }"></td>
                    <td><input type="submit" value="查询" class="btn btn-info"/></td>
                </tr>
                <tr>
                    <td>员工编号</td>
                    <td>员工姓名</td>
                    <td>所属部门</td>
                    <td>职位名称</td>
                    <td>操作</td>
                </tr>
                <c:forEach var="map" items="${paging }">
                    <tr>
                        <td>${map.e_id }</td>
                        <td>${map.e_name }</td>
                        <td>${map.d_name }</td>
                        <td>${map.r_name }</td>
                        <td>
                            <c:set var="b" value="${emp.e_flag == '0'}"></c:set>
                            <c:if test="${b}">
                                <a href="javascript:void(0)" onclick="trim(${map.e_id },null,1)" class="btn btn-info">离职</a>
                            </c:if>
                            <a href="javascript:void(0)" onclick="trim(${map.e_id },${map.d_id},2)" class="btn btn-info">修改</a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5"><a href="toAdd" class="btn btn-info">添加员工</a></td>
                </tr>
            </table>
        </form>
    </div>
    <div style="margin: auto; width: 70%;">
        <a href="/zyh/Emp/findAll?e_flag=${emp.e_flag}&d_name=${dept.d_name}&e_name=${emp.e_name}&r_name=${role.r_name}&nowpage=1" class="btn btn-info">首页</a>
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
        <a href="/zyh/Emp/findAll?e_flag=${emp.e_flag}&d_name=${dept.d_name}&e_name=${emp.e_name}&r_name=${role.r_name}&nowpage=${total }" class="btn btn-info">尾页</a>
    </div>
    </div>
    <script type="text/javascript">
        function trim(id,d_id,m)
        {
            var flag = confirm("确定执行吗？");
            if(flag)
            {
                if(m == 1) location.href="/zyh/Emp/del?e_id="+id;
                else if(m == 2) location.href="/zyh/Emp/toUpd?e_id="+id+"&d_id="+d_id;
            }
        }
        function paging(now)
        {
            location.href="/zyh/Emp/findAll?e_flag=${emp.e_flag}&d_name=${dept.d_name}&e_name=${emp.e_name}&r_name=${role.r_name}&nowpage="+now;
        }
    </script>
</body>
</html>
