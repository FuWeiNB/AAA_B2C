<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 20812
  Date: 2020/3/10
  Time: 17:12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../Deploy.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/zyh/PayordersPay/jiesuan?in_id=${in_id}" method="post">
    <table border="1" style="width: 80%; margin: 0 auto;"
           class="table table-hover table-bordered table-striped">
        <caption>
            <h1>进货</h1>
        </caption>
        <tr>
            <th>商家</th>
            <th>商品名称</th>
            <th>商品进价</th>
            <th>应买数量</th>
            <th>实买数量</th>
            <th>备注</th>
            <th>原付</th>
            <th>实付</th>
        </tr>
<%--        <c:set var="Stotal" value="0"></c:set>--%>
        <c:forEach var="map" items="${purchase }">
            <tr>
                <td>${map.s_name }
                    <input type="hidden" name="s_id" value="${map.s_id }">
                </td>
                <td>${map.m_name }
                    <input type="hidden" name="m_name" readonly="readonly" value="${map.m_name }" />
                </td>
                <td>${map.m_oldprice }
                    <input type="hidden" name="m_oldprice" readonly="readonly" value="${map.m_oldprice }" />
                </td>
                <td>${map.in_num1 }
                    <input type="hidden" name="in_num1" readonly="readonly" value="${map.in_num1 }" />
                </td>
                <td><input type="text" onchange="toxiaoji(this)" name="in_num2"></td>
                <td><input type="text" name="in_memo"></td>
                <td><input type="text" readonly="readonly" name="in_price1" value="${map.in_price1}"></td>
                <td>
                    <input type="text" readonly="readonly" name="in_price2" value="0"/>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td>
                <input type="hidden" value="0" id="caiwu">
                <input type="button" id="cs" value="财务签字" class="btn btn-info"><span id="wukong"></span>
            </td>
            <td>
                <input type="hidden" value="0" id="caigou">
                <input type="button" id="cf" value="采购签字" class="btn btn-info"><span id="wuqi"></span>
            </td>
            <td>总价:<input type="text" readonly="readonly" value="0" id="total" name="pay_price2"></td>
            <td colspan="5" align="right"><input class="btn btn-info"type="submit" onclick="return check('caiwu','caigou')" value="确定" /></td>
        </tr>
    </table>
</form>
<span id="size">${trolley.size}</span>
<div style="text-align: center; width:300px;margin:0px auto;" id="signature">
    员工姓名:<input type="text" id="name" name="e_name"><br /><br />
    员工密码:<input type="password" id="pass" name="e_pass"><br /><br />
    <input  type="button" id="com" value="签字" class="btn btn-info">
</div>
<script type="text/javascript">
    function toxiaoji(obj){
            var oldctoa = $(obj).parent().next().next().next().children().val();
            var price = $(obj).parent().prev().prev().children().val();
            var number = $(obj).val();
            var ctotal = price*number;
            $(obj).parent().next().next().next().children().val(ctotal.toFixed(2));
            var ctoa = $(obj).parent().next().next().next().children().val();
            var del = parseFloat($("#total").val())-(parseFloat(oldctoa)-parseFloat(ctoa));
            var add = parseFloat($("#total").val())+(parseFloat(ctoa)-parseFloat(oldctoa));
            if(parseFloat(oldctoa) < parseFloat(ctoa)) $("#total").val(add.toFixed(2));
            else $("#total").val(del.toFixed(2));
    }
    function check(caiwu,caigou) {
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
