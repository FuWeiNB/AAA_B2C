<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/5
  Time: 11:49
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
    <link rel="stylesheet" href="/js/css/modules/layer/default/layer.css"/>
    <script src="/js/layui.js"></script>
    <script type="text/javascript" src="/js/lay/modules/jquery-1.8.3.min.js"></script>
</head>
<body>
<div style="width:1060px;margin:0px 0px 0px 10px">
    <table class="layui-table" id="layui_table_id" lay-filter="dataTable" name="layui-table-view" style="width:420px;border:1px solid black;"></table>
</div>

<script>

    $(function() {
        layui.use(['layer', 'upload', 'table','form'], function () {  // 引入 table模块
            var layer = layui.layer;
            var $ = layui.jquery;
            var day = 0;
            var table = layui.table;
            var form = layui.form;
            table.render({
                id: "dataTable"
                , elem: '#layui_table_id'//指定表格元素
                , toolbar: '#toolbarDemo'
                , url: '/hourse/showsuppliers'  //请求路径
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
                        field: 's_id', //json对应的key
                        title: '供应商编号',   //列名 显示出来的名称
                        sort: true,  // 默认为 false,true为开启排序
                        width: 120
                    },
                    {field: 's_name', title: '供应商名称', width:200,}
                ]]
                //表格数据加载完后的事件
                , done: function (res, curr, count) {
                }

            })
            var active = {
                reload: function(){
                    var a_name = $('input[name="a_name"]').val();
                    var oflag = $('select[name="oflag"]').val();
                    table.reload('dataTable', {
                        page: { curr: 1 }
                        ,where: {date:day,a_name:a_name,oflag:oflag}
                    });
                }
            };

            $('#search_btn').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
            //一些事件监听
            element.on('tab(docDemoTabBrief)', function(data){
                console.log(data);
            });




        });
    })
</script>
</body>
</html>
