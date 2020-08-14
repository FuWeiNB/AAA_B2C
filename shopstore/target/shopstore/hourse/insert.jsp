<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/5
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
    <script type="text/javascript" src="/ass/js/jquery-1.8.3.min.js"></script>
    <style>
        .none {
            display: none;
        }
    </style>
</head>
<body>

<div style="float:right" >
    <div class="btn btn-info" id="btn_add">添加</div>
</div>
<form>
    <select id="s_id" name="s_id">
        <option value="0">--请选择供应商--</option>
    </select>
    <table class="table table-bordered">
        <h1 style="text-align: center">进货订单</h1>
        <thead>
        <tr>
            <th width="80px">序列号</th>
            <th width="70px">商品名称</th>
            <th width="120px">商品编号</th>
            <th width="80px">属性</th>
            <th width="50px">数量</th>
            <th width="80px">单位</th>
            <th width="80px">参考进价(元)</th>
            <th width="100px">金额(元)</th>
            <th width="100px">备注</th>
            <th width="100px">操作</th>
        </tr>
        </thead>
        <tbody>
        <tr  class="none" >
            <td><input type="checkbox"></td>
            <td>
                <select id="m_id" name="m_id" onchange="changeshop(this.value)"></select>
            </td>
            <td id="m_number" name="m_number"></td>
            <td id="t_name" name="t_name">
            </td>
            <td id="numbers">
                <input type="text"  id="pay_oldnumber"  name="pay_oldnumber" onchange="tocount(this.value)"  />
            </td>
            <td>瓶</td>
            <td>
                <input type="text" id="m_oldprice" name="m_oldprice" style="width:100px;"/>
            </td>
            <td>
                <input type="te" id="pay_price" name="pay_price" style="width:100px;" />
            </td>
            <td>
                <input type="text" id="pay_memo" name="pay_memo" />
            </td>
            <td>
                <a class="btn_del" href="javascript:void(0)">删除</a>
                <a class="btn_upd" href="javascript:void(0)">修改</a>
            </td>
        </tr>
        </tbody>
        <tfoot>
        <tr style="background-color: #f6f4f0">
            <td>合计</td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <span id="counts" name="counts"></span>
            </td>
            <td></td>
            <td></td>
            <td ><span id="prices" name="prices"></span></td>
            <td></td>
            <td></td>
        </tr>
        </tfoot>
    </table>
    <input type="submit" class="btn" value="提交" style="float:right" />
</form>

<script>
    $(function()
    {
        clearAll();
        //toshowshop();
        toshowsupplier();

    })
    //获取Id为btn_add的元素，并将其赋值给btn_add
    var btn_add = document.getElementById("btn_add");
     var count = 1;
    //获取标签名字为tbody的第一个标签，并将其赋值给tbody
    var tbody = document.getElementsByTagName("tbody")[0];

    // 为删除按钮绑定事件处理函数
    tbody.onclick = function(event){
        //新建触发事件=触发事件的Dom元素本身（触发事件即点击事件）
        var target = event.target;

        //如果触发事件的节点名字===a（如果点击a标签）
        if(target.nodeName === "A"){

            //如果触发事件的class名字===btn_del（如果点击class名字===btn_del的a标签）
            if(target.className === "btn_del"){
                //移除tody下的孩子（删除点击事件的父节点的父节点，即删除点击的a标签的父节点（td标签)的父节点（tr标签）

                tbody.removeChild(target.parentNode.parentNode)
            }
            //如果触发事件的class名字===btn_upd（如果点击class名字===btn_upd的a标签）
            if(target.className === "btn_upd"){
                alert("修改");
            }
        }
    }

    // 为添加按钮绑定事件处理函数
    btn_add.onclick = function(event){

        // 产生一个tr，新添加行等于复制隐藏行
        var newTr = tbody.firstElementChild.cloneNode(true);
        //新添加行的第2+1列的值为0-1之间的随机小数
        newTr.children[1].innerHTML = "<td>"+
        "<select id='m_id"+count+"'  name='m_id' onchange='changeshop(this.value,count)'></select>"+
           "</td>"
        newTr.children[2].innerHTML ="<td>" +
                "<span id='m_number"+count+"' name='m_number'></span>"+
            "</td>"
        newTr.children[3].innerHTML ="<td >" +
            "<span id='t_name"+count+"' name='t_name'></span>" +
            "</td>"

        newTr.children[4].innerHTML ="<td>"+
        "<input type='text'  id='pay_oldnumber"+count+"'  name='pay_oldnumber' onchange='tocount(this.value,count)' />"
        +"</td>"
        newTr.children[5].innerHTML ="<td>" +
            "<span id='m_numbers"+count+"' name='m_numbers'>瓶</span>" +
            "</td>"
        newTr.children[6].innerHTML ="<td>"+
           "<input type='text' id='m_oldprice"+count+"' name='m_oldprice' style='width:100px;'/>"+
            "</td>"
        newTr.children[7].innerHTML =" <td>"+
            "<input type='text' id='pay_price"+count+"' name='pay_price' style='width:100px;' />"+
            "</td>"
        //新添加行的class名字为0-1之间的随机小数，使其与复制的行不同，避免首CSS影响被隐藏
        newTr.className = Math.random();
        toshowshop();
        // 将一个tr追加到tbody
        tbody.appendChild(newTr);
    };

    //显示供应商
    function toshowsupplier()
    {
        $.ajax({
            url:"/hourse/showsu",
            async:true,
            type:"post",
            dataType:"json",
            success:function(data){
              $('#s_id').html(data);
            }
        });
    }
    //显示商品
    function toshowshop()
    {
        $.ajax({
            url:"/hourse/showshop",
            async:true,
            type:"post",
            dataType:"json",
            success:function(data){
                $("#m_id"+count).html(data);
                alert(count) ;alert(data);
                count++;
            }
        });
    }

    function changeshop(obj,aaa)
    {
        if(obj != 0)
        {
            $.ajax({
                url:"/hourse/showshopinfo",
                async:true,
                type:"post",
                data:{"m_id":obj},
                dataType:"json",
                success:function(data){
                    aaa--;
                    var json = eval("("+data+")");
                    $("input[id='pay_oldnumber"+aaa+"']").val("1");
                    var oldprice = json.m_oldprice;
                    var number = $("input[id='pay_oldnumber"+aaa+"']").val();
                    var total = 0;
                    for(var i = 0;i<aaa;i++)
                    {
                        total+= parseInt($("input[id='pay_oldnumber"+aaa+"']").val());
                        alert(total)
                    }
                    $("span[id='counts']").html(total);
                    $("span[id='m_number"+aaa+"']").html(json.m_number);
                    $("span[id='t_name"+aaa+"']").html(json.t_name);
                    $("input[id='m_oldprice"+aaa+"']").val(json.m_oldprice);
                    alert("json.m_oldprice"+json.m_oldprice)
                    $("input[id='pay_price"+aaa+"']").val(number*oldprice);
                }
            });
        }
        else
        {
            $("td[id='m_number']").html("");
            $("td[id='t_name']").html("");
            $("input[name='pay_oldnumber']").html("");
            $("input[name='m_oldprice']").val("");
            $("input[name='pay_price']").val("");
        }
    }
    //当修改数量的时候去算
    function tocount(obj,count)
    {
        count--;
        //获得总数量
        var number = 0;
        var total_num = 0;
        if(obj == 0||obj=="")
        {
            $("input[id='pay_oldnumber1']").css('border','1px solid red');
            if(obj == "")
            {
                $("span[id='counts']").html("0");
            }
            else
            {
                for(var i = 0;i<count;i++)
                {
                    number += parseInt($("input[id='pay_oldnumber"+count+"']").val());
                }
                $("span[id='counts']").html(number);
            }

        }
        else
        {
            $("input[id='pay_oldnumber1']").css('border','1px solid #cccccc');
            var price = $("input[id='m_oldprice"+count+"']").val();
            var total = price * obj;
            alert("count:"+count)
            for(var i = 0;i<count;i++)
            {
                number += parseInt($("input[id='pay_oldnumber"+count+"']").val());

                alert(number)
            }
            $("span[id='counts']").html(number);
            $("span[id='prices']").html(total_num);
            $("input[id='pay_price"+count+"']").val(total);
        }
    }
    //当第一次加载的时候清空文本框的值
    function clearAll()
    {
        $("td[id='m_number']").html("");
        $("td[id='t_name']").html("");
        $("input[name='pay_oldnumber']").val("1");
        $("input[name='m_oldprice']").val("");
        $("input[name='pay_price']").val("");
    }

</script>
</body>
</html>
