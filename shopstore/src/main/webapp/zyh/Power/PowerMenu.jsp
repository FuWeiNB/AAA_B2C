<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/1/7
  Time: 13:59:33
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
        <form action="/zyh/Power/findAll">
            <table style="width: 100%;" class="table-bordered table-condensed table-hover table-striped">
                <caption><h3>权力信息</h3></caption>
                <tr>
                    <td>权力名称：<input type="text" name="p_name" value="${entity.p_name }" /></td>
                    <td>
                        所属父级：
                        <select name="mgr">
                            <option value="">---请选择---</option>
                            <c:forEach var="rank" items="${mgr }">
                                <c:forEach var="pw" items="${all }">
                                    <c:if test="${rank.mgr == pw.p_id}">
                                        <option value="${rank.mgr}" ${entity.mgr == rank.mgr ? 'selected' : ''}>${pw.p_name}</option>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </select>
                    </td>
                    <td><input type="submit" value="查询" /></td>
                </tr>
                <tr>
                    <td>权力编号</td>
                    <td>权力名称</td>
                    <td>操作</td>
                </tr>
                <c:forEach var="map" items="${power }">
                    <tr>
                        <td>${map.p_id }</td>
                        <td>${map.p_name }</td>
                        <td>
                            <a href="javascript:void(0)" onclick="trim(${map.p_id },1)" class="btn btn-info">修改</a>
                            <a href="javascript:void(0)" onclick="trim(${map.p_id },2)" class="btn btn-info">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                <tr align="center">
                    <td colspan="4"><a href="/zyh/Power/toAdd" class="btn btn-info">添加权力</a></td>
                </tr>
            </table>
        </form>
        <div style="margin: auto; width: 70%;">
            <a href="/zyh/Power/findAll?mgr=${entity.mgr}&p_name=${entity.p_name}&nowpage=1" class="btn btn-info">首页</a>
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
            <a href="/zyh/Power/findAll?mgr=${entity.mgr}&p_name=${entity.p_name}&nowpage=${total }" class="btn btn-info">尾页</a>
        </div>
    </div>
    <script type="text/javascript">
        function trim(id,i)
        {
            var flag = confirm("确定执行吗？");
            if(flag) {
                if(i == 1){
                    location.href="/zyh/Power/toUpd?p_id="+id;
                }
                else if(i==2) location.href="/zyh/Power/del?p_id="+id;
            }
        }
        function paging(now)
        {
            location.href="/zyh/Power/findAll?mgr=${entity.mgr}&p_name=${entity.p_name}&nowpage="+now;
        }
    </script>
</body>
</html>
