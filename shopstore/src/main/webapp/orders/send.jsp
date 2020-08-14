<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/11
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/js/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <link  src="js/css/modules/layer/default" />
    <script>
        function func()
        {
            var flag = false;
            var p_name = $("select[name='company']").val();
            var o_id = "${map.o_id }";

            if(p_name == "0")
            {
                alert("请先选择快递公司")
                return false;
            }
            var confi = confirm("确定要提交这个"+o_id+"订单,快递公司为:"+p_name+"嘛?");
            if(confi)
            {
                $.ajax({
                    url: '/orders/send',
                    type: "post",
                    data:{"o_id":o_id,"pa_number":p_name},
                    dataType: "json",
                    success: function(data) {

                    }
                });

                flag = true;
                //关闭当前frame
                xadmin.close();
                 //可以对父窗口进行刷新
                xadmin.father_reload();
            }
            return flag;
        }

    </script>
</head>
<body>
    <div style="width:100%;height:80px;border:1px solid #f2f2f2">
        <span><span style="color:sandybrown">第一步</span>&nbsp;&nbsp;&nbsp;选择物流公司</span>
        <table>
            <tr>
                <td>物流公司：</td>
                <td>
                    <select name="company">
                        <option value="0">--请先选择--</option>
                        <option value="韵达快递">韵达快递</option>
                        <option value="天天快递">天天快递</option>
                        <option value="德邦物流">德邦物流</option>
                        <option value="百世汇通">百世汇通</option>
                        <option value="顺丰速运">顺丰速运</option>
                        <option value="圆通快递">圆通快递</option>
                        <option value="中通快递">中通快递</option>
                        <option value="中国邮政">中国邮政</option>
                    </select>
                </td>
            </tr>
        </table>
    </div>
<div style="width:100%;height:auto;margin:10px 0px 0px 0px ;">
    <span><span style="color:sandybrown">第二步</span> &nbsp;&nbsp;&nbsp;确认发货信息</span>
    <form action="" method="post" onsubmit="return func()">
        <div style="width:100%;height:50px;border:1px solid #999999;background-color: #99d0f3">
            收货信息  收货地址:${map.o_aname }   手机号:${map.o_phone }  收货人: ${map.o_name }
        </div>
        <div style="width:100%;height:50px;border:1px solid #eaf0fe;background-color: #eaf0fe">
            订单编号:${map.o_id } &nbsp;&nbsp;&nbsp;&nbsp;买家：${map.name }
        </div>
        <c:forEach var="maps" items="${list}">
            <div style="width:455px;height:150px;float:left;margin:10px 0px 0px 10px;border-top: silver">
                <img src="${maps.img_url }" style="width:90px;height:85px;float:left"/>
                <span style="margin:0px 0px 0px 5px;">商品名称：${maps.m_name }</span>
                <br/>
                <span style="margin:0px 0px 0px 5px;">商品类型:${maps.t_name }</span>
                <br/>
                <span style="margin:0px 0px 0px 5px;">价格:${maps.m_price }</span>
                <br/>
                <span style="margin:0px 0px 0px 5px;">数量:${maps.buy_number}</span>
                <div style="clear:both"></div>
            </div>
        </c:forEach>
        <div style="clear:both"></div>
        <div style="width:100px;height:30px;">
            <input type="submit" value="提交" onclick="tosubmit()" />
        </div>
    </form>
</div>
<script type="text/javascript">
   function tosubmit()
   {
       var flag = false;
       var p_name = $("input[name='company']").val();
       var o_id = ${map.o_id }
       if(p_name == "--请选择--")
       {
               alert("请先选择")
               flag = false;
       }
       var confi = confirm("确定要提交这个"+o_id+"订单,快递公司为:"+p_name+"嘛?");
           if(confi)
           {
               $.ajax({
                   url: '/orders/send',
                   type: "post",
                   data:{"o_id":o_id},
                   dataType: "json",
                   success: function(data) {
                       alert(data);
                   }
               });

               flag = true;
               //关闭当前frame
               xadmin.close();
               // 可以对父窗口进行刷新
               xadmin.father_reload();
           }
           return flag;

   }
</script>
</body>
</html>
