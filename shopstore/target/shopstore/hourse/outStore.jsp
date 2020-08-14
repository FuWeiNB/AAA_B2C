<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/1/6
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/css/layui.css">
    <link rel="stylesheet" href="/assets/css/fonts/xadmin.css">
    <link rel="stylesheet" href="/css/font.css">
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <link rel="stylesheet" href="/js/css/modules/laydate/default/laydate.css"/>
    <link rel="stylesheet" href="/js/css/modules/layer/default/layer.css"/>
    <style>

    </style>
</head>
<body>

            <div style="margin:10px 0px;">全部&nbsp;>&nbsp;全部仓库</div>
            <div class="layui-form" style="margin:20px 0px 0px 10px;width:1055px;height:130px;border:1px solid #dddddd;background-color: #f8f8f8;">
                <div class="layui-form-item" >
                    <div class="layui-inline" style="float:left">
                        <label for="all_name" class="layui-form-label" style="margin:10px 0px 0px -20px">
                            搜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;索:
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="all_name" name="all_name" lay-verify="all_name" style="width:250px;margin-top:10px;float:left"
                                   autocomplete="off" class="layui-input" placeholder="商品名称,运单号,员工名称,订单编号">
                        </div>
                    </div>
                    <div class="layui-inline" style="margin:10px 0px 0px 60px;float:left">
                        <label class="layui-form-label">日期范围:</label>
                        <div class="layui-input-inline">
                            <input type="text" name="date"  class="layui-input" id="daterange" placeholder="指定范围内订单时长">
                        </div>
                    </div>
                    <div style="margin:15px 0px 0px 200px;float:left">
                        <a href="javascript:void(0)"  data-type="reload" class="layui-btn layui-btn-sm"
                           lay-filter="searchbtn" formnovalidate id="search_btn">搜索</a>
                    </div>
                    <div style="clear:both"></div>
                </div>
            </div>
            <div style="width:1060px;margin:0px 0px 0px 10px">
                <table class="layui-table" id="layui_table_id" lay-filter="dataTable1" name="layui-table-view" style="width:420px;border:1px solid black;"></table>
            </div>
            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="view1">详情</a>
            </script>
        <!--内容2-->


<script src="/js/layui.js"></script>
<script type="text/javascript" src="/js/lay/modules/jquery-1.8.3.min.js"></script>
<script type="text/javascript" href="/orders/module/tableMerge.js"></script>
<script>

    $(function() {
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
            table.render({
                id: "dataTable1"
                , elem: '#layui_table_id'//指定表格元素
                , toolbar: '#toolbarDemo'
                , url: '/hourse/showAllOut'  //请求路径
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
                        field: 'out_number', //json对应的key
                        title: '运单号',   //列名 显示出来的名称
                        sort: true,  // 默认为 false,true为开启排序
                        width: 250,
                        fixed:true
                    },
                    {field: 'out_date', title: '出库日期', width:160,fixed:true,
                        templet: function (d) {
                            return layui.util.toDateString(d.out_date, 'yyyy-MM-dd HH:mm:ss')
                        }},
                    {field: 'm_name', title: '出库商品', width: 120,fixed:true},
                    {field: 'o_id', title: '订单号', width: 280},
                    {field: 'm_price', title: '购买价格', width: 100},
                    {field: 'e_name', title: '出库负责人', width: 100,
                        templet: function (d) {
                            return "500";
                        }
                    },
                    {field: 'o_number', title: '出库数量', width: 100,sort:true},
                    {
                        field: 'out_flag', title: '出库状态', width: 200,sort:true,
                        templet: function (d) {
                            if(d.out_flag == 0)
                            {
                                return "已出库";
                            }
                            else
                            {
                                return "未出库";
                            }
                        }
                    },

                ]]
                //表格数据加载完后的事件
                , done: function (res, curr, count) {
                }

            })
            var day = "";
            //日期范围
            laydate.render({
                elem: '#daterange',
                range: true,
                value: '',
                done:function(value,date){
                    //选择日期点击确定后进行查询
                    day=value;
                }
            })


            var active = {
                reload: function(){
                    var a_name = $("input[name='all_name']").val();
                    table.reload('dataTable1', {
                        page: { curr: 1 }
                        ,where: {date:day,a_name:a_name}
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

            table.on('tool(dataTable1)',function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
                var id = data['m_id']; //获得选中行的编号

                if(layEvent === 'view1')
                {
                    toshow(id);
                }
            });
           parent.layui.table.reload('layui_table_id');
        });
    });




    <!-- 点击编辑跳转到遮罩层 -->
    function toshow(id)
    {
        xadmin.open('详情','/hourse/stockDetials.jsp?m_id='+id,'900','500');
    }
</script>

</body>
</html>
