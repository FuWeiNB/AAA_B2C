<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/4
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
<link type="text/css" href="${pageContext.servletContext.contextPath }/assets/css/bootstrap.css" rel="stylesheet" />
<%
    //JSP小脚本
    request.setAttribute("pn", pageContext.getServletContext().getContextPath());
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table table-striped table-bordered table-hover " border="1" style="width: 100%; margin: 0 auto;">
    <caption><h1>用户管理</h1>
        <div style="text-align: center;">
            用户状态：
            <select onchange="changeTable()" name="flag" id="ty" style="width:100px">
                <option value="2" ${flag == "2" ? 'selected':''}>—请选择—</option>
                <option value="0" ${flag == "0" ? 'selected':''}>正常</option>
                <option value="1" ${flag == "1" ? 'selected':''}>禁用</option>
            </select>
            &nbsp;&nbsp;&nbsp;&nbsp;
            用户姓名：
            <input type="text" placeholder="请输入搜索关键字" name="name" id="t" onchange="changeTable()" />
        </div>
    </caption>
    <tr>
        <td>用户名</td>
        <td>邮箱地址</td>
        <td>联系方式</td>
        <td>状态</td>
        <td>操作</td>
 <c:if test="${empty list }">
    <tr >
        <td style="text-align: center;" colspan="8">没有数据</td>
    </tr>
</table>
</c:if>
<c:if test="${!empty list }">
    <c:forEach var="m" items="${list }">
        <tr>

            <td>${m.name == "" ||m.name == null ? '无': m.name }</td>
            <td>${m.email == "" || m.email== null  ? '无' : m.email }</td>
            <td>${m.phone == "" || m.phone == null ? '无' : m.phone}</td>
            <td>${m.flag == 0 ? '正常' : '已禁用'}</td>
            <td>
                <a href="toUpd?user=${m.user }" class="btn btn-info">
                    修改
                </a>
            </td>
        </tr>
    </c:forEach>
    </tr>
    </table>
    <div style="border:0px solid black; width:300px; margin:10px auto;float: left">
        共${page.totalPage}页，${page.count}条数据，每页${page.pageSize}条数据
    </div>
    <div style="border:0px solid black; width:400px; margin:10px 0px 0px 50px;float:left">
        <a href="javascript:void(0)" onclick = "topage(1)">首页</a>
        <a href="javascript:void(0)" onclick = "topage(${page.nowpage-1})">上一页</a>
        <c:forEach varStatus="i" begin="1" end="${page.totalPage }" step="1">
            <c:if test="${i.index == page.nowpage }">
			<span class="btn btn-info" onclick="topage(${i.index})">
                    ${i.index}
            </span>
            </c:if>


            <c:if test="${i.index != page.nowpage }">
			<span class="btn" onclick="topage(${i.index})">
                    ${i.index}
            </span>
            </c:if>
        </c:forEach>
        <a href="javascript:void(0)" onclick = "topage(${page.nowpage+1})">下一页 </a>
        <a href="javascript:void(0)" onclick = "topage(${page.totalPage})">尾页</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
            <%--${page.nowpage } / ${page.totalPage}--%>
        <select  onchange="topage(this.value)">
            <c:forEach varStatus="i" begin="1" end="${page.totalPage }" step="1" >
                <option ${i.index == page.nowpage ? 'selected' : '' } value="${i.index }">${i.index}</option>
            </c:forEach>
        </select>/ ${page.totalPage}
    </div>

<%--        <input class="input-small" onchange="topage(this.value)"/>/ ${page.totalPage}--%>

</c:if>

<script type="text/javascript">
    function topage(nowpage)
    {
        if(nowpage < 1)
        {
            alert("已经是第一页了！");
            nowpage=1;
        }
        if(nowpage > ${page.totalPage})
        {
            alert("已经是最后一页了！");
            nowpage=${page.totalPage};
        }

        location.href="findAll?nowpage="+nowpage;
    }
    function changeTable()
    {
        var flag = $("#ty").val();
        //alert(flag);
        var name = $("#t").val();

        //alert($("#t").val());
        if($("#t").val() == "")
        {
            location.href="findAll?flag="+flag;
        }
        else
        {
            location.href="findAll?flag="+flag+"&name="+name;
        }

    }
</script>

</body>
</html>
