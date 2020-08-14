<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/3/16
  Time: 17:09:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../Deploy.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
${payorders.in_id }&nbsp;&nbsp;&nbsp;
${payorders.pay_date }&nbsp;&nbsp;&nbsp;
${payorders.pay_price }&nbsp;&nbsp;&nbsp;
<input type="button" onclick="back('${now}')" class="btn btn-info" value="返回">
<hr />
<div style="width: 50%;margin: auto;">
    <form action="/zyh/Payorders/yes">
        <table border="1" style="width: 100%; margin: 0 auto;" class="table table-hover table-bordered table-striped">
            <caption><h1>审批采购单</h1></caption>
            <tr>
                <th>商品名称</th>
                <th>商品进价</th>
                <th>购买数量</th>
                <th>小计</th>
            </tr>
            <c:forEach items="${approves }" var="m">
                <tr>
                    <td>${m.m_name }</td>
                    <td>${m.m_oldprice }</td>
                    <td>${m.in_num1 }</td>
                    <td>${m.in_price1}</td>
                </tr>
            </c:forEach>
            <tr>
                <td style="text-align: center">
                    <input type="hidden" value="0" id="caiwu">
                    <input type="button" id="cs" value="财务签字" class="btn btn-info"><span id="wukong"></span>
                </td>
                <td style="text-align: center">
                    <input type="hidden" value="0"  id="caigou">
                    <input type="button" id="cf" class="btn btn-info" value="采购签字"><span id="wuqi"></span>
                </td>
                <td colspan="2" style="text-align: center">
                    <input type="hidden" value="${payorders.in_id}" name="in_id">
                    <input type="submit" class="btn btn-info" value="通过" onclick="return aprov('caiwu','caigou')">
                    <input type="button" value="不通过" class="btn btn-warning" onclick="bu('${payorders.in_id}')">
                </td>

            </tr>
            <tr>
                            </tr>
        </table>
    </form>
</div>
<div style="text-align: center; width:300px;margin:0px auto;" id="signature">
    员工姓名:<input type="text" id="name" name="e_name"><br /><br />
    员工密码:<input type="password" id="pass" name="e_pass"><br /><br />
    <input  type="button" id="com" value="签字" class="btn btn-info">
</div>
<script type="text/javascript">
    function bu(id) {
        var flag = confirm("确定不通过吗?");
        if(flag) location.href="/zyh/Payorders/bu?in_id="+id;
    }
    function aprov(caiwu,caigou) {
        var wu = $("#"+caiwu).val();
        var gou = $("#"+caigou).val();
        if(parseInt(wu) == 0 && parseInt(gou) == 0){
            alert("请采购和财务签字!");
            return false;
        }
        else if(parseInt(wu) == 0){
            alert("请财务签字!")
            return false;
        }
        else if(parseInt(gou) == 0){
            alert("请采购签字!")
            return false
        }
        else return true;
    }
    $("#signature").hide();
    $("#cs").click(function () {
        $("#signature").show();
    })
    $("#cf").click(function () {
        $("#signature").show();
    })
    $("#com").click(function () {
        $.ajax({
            url:'/zyh/Payorders/signature',
            type:'post',
            data:{'id':$("#name").val(),'pass':$("#pass").val()},
            dataType:'html',
            success:function (data) {
                var si = data;
                if(si == "caigou") {
                    $("#caigou").val(1);
                    $("#wuqi").html("已签字");
                    $("#signature").hide();
                }else if(si == "caiwu"){
                    $("#caiwu").val(1);
                    $("#wukong").html("已签字");
                    $("#signature").hide();
                }else if(si == "cuowu"){
                    alert("请输入财务或采购的账号!");
                }else {
                    alert("请输入正确的账号密码!");
                }
            }
        })
    })
</script>
</body>
</html>
