<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/4
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/layui.css">
    <link rel="stylesheet" href="/assets/css/fonts/xadmin.css">
    <link rel="stylesheet" href="/css/font.css">
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <link rel="stylesheet" href="/js/css/modules/laydate/default/laydate.css"/>
    <link rel="stylesheet" href="/js/css/modules/layer/default/layer.css"/>
    <style>
        .layui-table-cell {
            font-size:14px;
            padding:0 5px;
            height:auto;
            overflow:visible;
            text-overflow:inherit;
            white-space:normal;
            word-break: break-all;
            display:table-cell;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<a href="javascript:void(0)" class="layui-btn" lay-event="toadd"  onclick="toadd()">新增进货订单</a>
<div style="width:1060px;margin:10px 0px 0px 10px">
    <table class="layui-table" id="layui_table_id" lay-filter="dataTable" name="layui-table-view" style="width:420px;border:1px solid black;"></table>
</div>
<script type="text/html" id="barDemo">

    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="view">详情</a>
    <a class="layui-btn layui-btn-info layui-btn-xs" lay-event="edit">编辑</a>
</script>
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
                id: "dataTable"
                , elem: '#layui_table_id'//指定表格元素
                , toolbar: '#toolbarDemo'
                , url: '/orders/showss'  //请求路径
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
                        field: 'o_id', //json对应的key
                        title: '订单编号',   //列名 显示出来的名称
                        sort: true,  // 默认为 false,true为开启排序
                        width: 120
                    },
                    {field: 'm_name', title: '所购商品', width:200,
                        templet:function(d)
                        {
                            return "名称:"+d.m_name+"付款总金额￥:"+d.o_price+"" +
                                "<img src='"+d.img_url+"' style='width:80px;height:90px' alt=\"白酒\"/>";
                        }
                    },
                    {field: 'o_date', title: '下单日期', width: 100,sort:true,
                        templet:function(d)
                        {
                            return layui.util.toDateString(d.o_date, 'yyyy-MM-dd HH:mm:ss')
                        }
                    },
                    {field: 'name', title: '会员名', width: 70},
                    {field: 'o_phone', title: '联系方式', width: 100},
                    {field: 'o_aname', title: '收货地址', width: 150}
                    , {field: 'o_flag', title: '订单状态', width: 90,event:tosend,
                        templet: function (d) {
                            if(d.o_flag == 0)
                            {
                                return "<span style='color:darkred'>待付款</span>";
                            }
                            if(d.o_flag == 1)
                            {
                                return "<span style='color:darkred'>已取消</span>";
                            }
                            if (d.o_flag == 2) {
                                if(${(e_id.r_id == 1 || e_id.r_id == 2 || e_id.r_id == 5 ||e_id.r_id == 9)&&d.or_flag == null})
                                {
                                    return "<span style='color:darkred'>未发货" +
                                        " </span>";
                                }
                                else
                                {
                                    return "<span style='color:darkred'>未发货</span>";
                                }
                            }
                            if(d.o_flag == 3)
                            {
                                return "<span style='color:firebrick'>已发货</span>";
                            }
                            if(d.o_flag == 4)
                            {
                                return "<span style='color:#c11a39'>已收货/已完成</span>";
                            }
                            if(d.o_flag == 5)
                            {
                                return "<span style='color:#da314b'>已评价</span>";
                            }
                            if(d.o_flag == 0||d.o_flag == 1)
                            {
                                return "<span style='color:red'> 无法发货 </span>";
                            }
                        }
                    }
                    ,
                    {field: 'or_flag', title: '退款状态', width: 100,
                        templet: function (d) {
                            if (d.or_flag == 0) {
                                return "<span style='color:darkred'>申请退款</span>";
                            }
                            if(d.or_flag==1)
                            {
                                return "<span style='color:red'>退款已审核</span>"
                            }
                            if(d.or_flag==2)
                            {
                                return "<span style='color:darkred'>退款成功</span>"
                            }
                            if(d.or_flag==null)
                            {
                                return "<span style='color:darkred'>无</span>"
                            }
                        }
                    },
                    {field: 'o_memo', title: '订单备注', width: 100},
                    {title: '操作', align: 'center', width: 110, toolbar: '#barDemo'}
                ]]
                //表格数据加载完后的事件
                , done: function (res, curr, count) {
                }

            })

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

            table.on('tool(dataTable)',function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
                var id = data['o_id']; //获得选中行的编号
                if(layEvent == 'edit')
                {
                    if(data['o_flag']==2)
                    {
                        toedit(id);
                    }
                    else
                    {
                        layer.msg("该订单可能已收货、已发货或者没有付款不能进行编辑", {icon: 1,time:1000,shade:0.4});
                    }
                }
                else if(obj.event === 'tosend')
                {
                    alert("还未完成该发货功能。")
                }
                else if(layEvent === 'view'){
                    /*//例子2
                    layer.prompt({
                        formType: 2,
                        value: '初始值',
                        title: '请输入值',
                        area: ['800px', '350px'] //自定义文本域宽高
                    }, function(value, index, elem){
                        alert(value); //得到value
                        layer.close(index);
                    });*/
                    toshow(id);

                }
            });

        });
        //获得总数的
        tocount();

    });


    <!--让页面加载的时候就去调用这个方法-->
    function tocount()
    {
        $.ajax({
            url: '/orders/counts',
            type: "post",
            dataType: "json",
            success: function(data) {
                var json = eval("("+data+")")
                $('span[name="countAll"]').html(json.allcount);
                $('span[name="countcancle"]').html(json.canclecount);
                $('span[name="countOK"]').html(json.countOk);
                $('span[name="countTosend"]').html(json.Tosend);
                $('span[name="countShou"]').html(json.countShou);
            }
        });
    }

    <!-- 点击编辑跳转到遮罩层 -->
    function toshow(id)
    {
        xadmin.open('详情','/orders/toview?o_id='+id,'800','500');
    }
    function toedit(id)
    {
        xadmin.open('编辑','/orders/toupd?o_id='+id,'600','500');
    }
    function tosend()
    {
        xadmin.open('发货详情','/orders/toview?o_id='+id,'600','500');
    }
    function toadd()
    {
        xadmin.open('进货订单','/hourse/insert.jsp','1000','510');
    }
</script>
</body>
</html>
