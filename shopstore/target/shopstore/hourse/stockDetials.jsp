<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/11
  Time: 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/layui.css">
    <link rel="stylesheet" href="/assets/css/fonts/xadmin.css">
    <link rel="stylesheet" href="/css/font.css">
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <link rel="stylesheet" href="/js/css/modules/laydate/default/laydate.css"/>
    <link rel="stylesheet" href="/js/css/modules/layer/default/layer.css"/>
    <script src="/js/layui.js"></script>
    <script type="text/javascript" src="/js/lay/modules/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" href="/orders/module/tableMerge.js"></script>
</head>

<body>
<div style="width:300px;height:100px;margin:10px 0px 0px 10px;">
    <img src="${map.img_url }" style="width:90px;height:90px;float:left"/>
    <span style="font-size: 24px;color:#53606b;margin:20px 0px 0px 20px;" name="shopname">
        ${m_name }
    </span>
    <br/>
    <span style="font-size: 12px;color:#999999;margin:20px 0px 0px 20px;">时间周期：全部 &nbsp;所有仓库</span>
</div>
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="layui-this">入库量</li>
            <li>出库量</li>
        </ul>
        <!--tab里面的内容-->
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div style="margin:10px 0px;">入库量&nbsp;>&nbsp;全部仓库</div>
                <div style="width:1060px;margin:0px 0px 0px 10px">
                    <table class="layui-table" id="layui_table_id" lay-filter="dataTable1" name="layui-table-view" style="width:420px;border:1px solid black;"></table>
                </div>

            </div>

            <!--出库量-->
            <div class="layui-tab-item">
                <div style="margin:10px 0px;">入库量&nbsp;>&nbsp;全部仓库</div>
                <div style="width:1060px;margin:0px 0px 0px 10px">
                    <table class="layui-table" id="layui_table" lay-filter="dataTable2" name="layui-table-view" style="width:420px;border:1px solid black;"></table>
                </div>
            </div>
        </div>
    </div>
    <script>
        //该商品的所有入库详情谁负责并且进了多少货
        inStore();
        function inStore()
        {
            // 自定义模块
            layui.config({
                base: '/orders/module/'
            }).extend({
                tableMerge: 'tableMerge'
            });

            layui.use(['layer', 'upload', 'table','form','laydate','tableMerge','element'], function () {  // 引入 table模块
                var layer = layui.layer;
                var $ = layui.jquery;
                var day = 0;
                var table = layui.table;
                var form = layui.form;
                var laydate = layui.laydate;
                var tableMerge = layui.tableMerge;
                var element =  layui.element;
                <%String m_id = request.getParameter("m_id");%>
                var m_id = '<%=m_id%>';
                table.render({
                    id: "dataTable1"
                    , elem: '#layui_table_id'//指定表格元素
                    , url: '/hourse/instore'  //请求路径
                    ,where :{m_id:m_id}
                    , cellMinWidth: 20 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , skin: 'line ' //表格风格 line （行边框风格）row （列边框风格）nob （无边框风格）
                    , page: true  //开启分页
                    , limits: [5, 10]  //每页条数的选择项，默认：[10,20,30,40,50,60,70,80,90]。
                    , limit: 5 //每页默认显示的数量
                    , method: 'post'  //提交方式
                    , parseData: function (res) {
                        //将原始数据解析成 table 组件所规定的数据，res为从url中get到的数据
                        var result;
                        if (this.page.curr) {
                            result = res.data.slice(this.limit * (this.page.curr - 1), this.limit * this.page.curr);
                        }
                        else {
                            result = res.data.slice(0, this.limit);
                        }
                        return {
                            "code": res.code, //解析接口状态
                            "msg": res.msg, //解析提示文本
                            "count": res.count, //解析数据长度
                            "data": result //解析数据列表
                        };
                    }
                    , cols: [[
                        {
                            field: 'pay_date', //json对应的key
                            title: '业务日期',   //列名 显示出来的名称
                            sort: true,  // 默认为 false,true为开启排序
                            width: 185,
                            templet: function (d) {
                                return layui.util.toDateString(d.pay_date, 'yyyy-MM-dd HH:mm:ss')
                            }
                        },
                        {field: 'name', title: '仓库', width:100,
                            templet:function(d)
                            {
                                return "默认仓库";
                            }
                        },
                        {field: 'name2', title: '关联业务', width: 100,
                           templet:function(d)
                           {
                               return "进货";
                           }
                        },
                        {field: 'in_id', title: '关联的业务账号', width: 130},
                        {field: 's_name', title: '往来的单位名称', width: 130},
                        {field: 'e_name', title: '负责人', width: 100},
                        {field: 'in_num2', title: '入库量(瓶)', width: 140,sort:true},
                    ]]
                    //表格数据加载完后的事件
                    , done: function (res, curr, count) {
                    }
                })
            });
        }
        outStore();
        function outStore()
        {

            layui.use(['layer', 'upload', 'table','form','element'], function () {  // 引入 table模块
                var layer = layui.layer;
                var $ = layui.jquery;
                var day = 0;
                var table = layui.table;
                var form = layui.form;
                var laydate = layui.laydate;
                var tableMerge = layui.tableMerge;
                var element =  layui.element;
                <%String m_id1 = request.getParameter("m_id");%>
                var m_id = '<%=m_id%>';
                table.render({
                    id: "dataTable2"
                    , elem: '#layui_table'//指定表格元素
                    , url: '/hourse/outstore'  //请求路径
                    ,where :{m_id:m_id}
                    , cellMinWidth: 20 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , skin: 'line ' //表格风格 line （行边框风格）row （列边框风格）nob （无边框风格）
                    , page: true  //开启分页
                    , limits: [5, 10]  //每页条数的选择项，默认：[10,20,30,40,50,60,70,80,90]。
                    , limit: 5 //每页默认显示的数量
                    , method: 'post'  //提交方式
                    , parseData: function (res) {
                        //将原始数据解析成 table 组件所规定的数据，res为从url中get到的数据
                        var result;
                        if (this.page.curr) {
                            result = res.data.slice(this.limit * (this.page.curr - 1), this.limit * this.page.curr);
                        }
                        else {
                            result = res.data.slice(0, this.limit);
                        }
                        return {
                            "code": res.code, //解析接口状态
                            "msg": res.msg, //解析提示文本
                            "count": res.count, //解析数据长度
                            "data": result //解析数据列表
                        };
                    }
                    , cols: [[
                        {
                            field: 'out_date', //json对应的key
                            title: '业务日期',   //列名 显示出来的名称
                            sort: true,  // 默认为 false,true为开启排序
                            width: 185,
                            templet: function (d) {
                                return layui.util.toDateString(d.out_date, 'yyyy-MM-dd HH:mm:ss')
                            }
                        },
                        {field: 'name', title: '仓库', width:100,
                            templet:function(d)
                            {
                                return "默认仓库";
                            }
                        },
                        {field: 'out_flag', title: '关联业务', width: 100,
                            templet:function(d)
                            {
                               return "销售";
                            }
                        },
                        {field: 'out_number', title: '关联的业务账号', width: 130},
                        {field: 'e_name', title: '负责人', width: 100},
                        {field: 'sums', title: '出库量(瓶)', width: 140,sort:true},
                    ]]
                    //表格数据加载完后的事件
                    , done: function (res, curr, count) {
                    }
                })
            });
        }
        toshow();
        function toshow()
        {
            <%String m_id2 = request.getParameter("m_id");%>
            var m_id = '<%=m_id%>';
            $.ajax({
                url: '/hourse/count',
                type: "post",
                dataType: "json",
                data:{m_id:m_id},
                success: function(data) {
                    var json = eval("("+data+")")
                    var nownumber = 500+json.inCount-json.outCount;
                    $('span[name="nowcount"]').html(nownumber);
                    $('span[name="incount"]').html(json.inCount);
                    $('span[name="outcount"]').html(json.outCount);
                    $('span[name="shopname"]').html(json.m_name);
                    $('img').attr("src",json.img_url);
                }
            });
        }


    </script>
</body>
</html>
