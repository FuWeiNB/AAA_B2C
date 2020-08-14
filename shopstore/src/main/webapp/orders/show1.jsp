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
<div style="width:1070px;height:40px;border:1px solid #dddddd;margin:0px 0px 0px 10px;">
    <span style="font-size: 16px;line-height: 40px;">&nbsp;&nbsp;&nbsp;状态分类</span>
</div>
<div style="width:1070px;height:160px;background-color: #f8f8f8;margin:0px 0px 0px 10px;">
    <div style="float:left;width:186px;height:130px;color:white;margin:20px 0px 0px 20px">
        <div style="font-size: 30px;width:186px;height:78px;background-color:#72b63f;text-align:center;">
            <span style="padding-top:20px;margin-top:20px;line-height:78px" name="countAll"></span>
        </div>
        <div style="width:186px;height:44px;background-color: #9cd159;text-align:center">
            <span style="margin-top:10px;line-height:44px" >全部订单</span>
        </div>
    </div>
    <div style="float:left;width:186px;height:130px;color:white;margin:20px 0px 0px 20px">
        <div style="font-size: 30px;width:186px;height:78px;background-color:#ff5757;text-align:center;">
            <span style="padding-top:20px;margin-top:20px;line-height:78px" name="countOK"></span>
        </div>
        <div style="width:186px;height:44px;background-color:#ff7171;text-align:center">
            <span style="margin-top:10px;line-height:44px" >已完成</span>
        </div>
    </div>
    <div style="float:left;width:186px;height:130px;color:white;margin:20px 0px 0px 20px">
        <div style="font-size: 30px;width:186px;height:78px;background-color:#19d2a8;text-align:center;">
            <span style="padding-top:20px;margin-top:20px;line-height:78px" name="countcancle"></span>
        </div>
        <div style="width:186px;height:44px;background-color: #4ee0bf;text-align:center">
            <span style="margin-top:10px;line-height:44px">已取消</span>
        </div>
    </div>
    <div style="float:left;width:186px;height:130px;color:white;margin:20px 0px 0px 20px">
        <div style="font-size: 30px;width:186px;height:78px;background-color:#8775a7;text-align:center;">
            <span style="padding-top:20px;margin-top:20px;line-height:78px" name="countTosend"></span>
        </div>
        <div style="width:186px;height:44px;background-color: #ad96d6;text-align:center">
            <span style="margin-top:10px;line-height:44px">待发货</span>
        </div>
    </div>
    <div style="float:left;width:186px;height:130px;color:white;margin:20px 0px 0px 20px">
        <div style="font-size: 30px;width:186px;height:78px;background-color:#0785d1;text-align:center;">
            <span style="padding-top:20px;margin-top:20px;line-height:78px" name="countShou"></span>
        </div>
        <div style="width:186px;height:44px;background-color: #60a7d0;text-align:center">
            <span style="margin-top:10px;line-height:44px" >待收货</span>
        </div>
    </div>
</div>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
    <legend>订单列表</legend>
</fieldset>
            <div style="width:1080px;border:1px solid #dddddd;background-color: #f8f8f8">
                <div class="layui-form" style="margin:20px 0px 0px 10px;width:1055px;height:130px;border:1px solid #dddddd;background-color: #f8f8f8;">
                    <div class="layui-form-item" >
                        <div class="layui-inline" style="float:left">
                            <label for="a_name" class="layui-form-label" style="margin:10px 0px 0px -20px">
                                搜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;索:
                            </label>
                            <div class="layui-input-inline">
                                <input type="text" id="a_name" name="a_name" lay-verify="a_name" style="width:250px;margin-top:10px;float:left"
                                       autocomplete="off" class="layui-input" placeholder="搜索订单编号,商品名称,收货人信息">
                            </div>
                        </div>
                        <div class="layui-inline" style="margin:10px 0px 0px 60px;float:left">
                            <label class="layui-form-label">日期范围:</label>
                            <div class="layui-input-inline">
                                <input type="text" name="o_date"  class="layui-input" id="daterange" placeholder="指定范围内订单时长">
                            </div>
                        </div>
                        <div style="clear:both"></div>
                          <div class="layui-inline" style="margin:5px 0px 0px -20px;float:left">
                              <label class="layui-form-label">订单状态:</label>
                              <div class="layui-input-inline" style="width:250px;">
                                  <select name="oflag" lay-verify="" >
                                      <option value="">全部订单</option>
                                      <option value="0">待付款</option>
                                      <option value="1">已取消</option>
                                      <option value="2">未发货</option>
                                      <option value="3">已发货</option>
                                      <option value="4">已收货/已完成</option>
                                  </select>
                              </div>
                          </div>
                        <div style="margin:15px 0px 0px 400px;float:left">
                            <a href="javascript:void(0)"   data-type="reload" class="layui-btn layui-btn-sm"
                               lay-filter="search_btn" formnovalidate id="search_btn">搜索</a>
                        </div>
                    </div>
                </div>

                <div style="width:1060px;margin:0px 0px 0px 10px">
                    <table class="layui-table" id="layui_table_id" lay-filter="dataTable" name="layui-table-view" style="width:420px;border:1px solid black;"></table>
                </div>

                <script type="text/html" id="barDemo">

                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="view">详情</a>
                    <a class="layui-btn layui-btn-info layui-btn-xs" lay-event="edit">编辑</a>
                </script>
            </div>



    </div>
</div>
    </div>

<br/>


<script src="/js/layui.js"></script>
<script type="text/javascript" src="/js/lay/modules/jquery-1.8.3.min.js"></script>
<script>
   var table;
    $(function() {
        tocount();

        layui.use(['layer', 'upload', 'table','form','laydate','element'], function () {  // 引入 table模块
            var layer = layui.layer;
            var $ = layui.jquery;
            var day = 0;
            table = layui.table;
            var form = layui.form;
            var laydate = layui.laydate;
            var element =  layui.element;
            table.render({
                id: "dataTable"
                , elem: '#layui_table_id'//指定表格元素
                , toolbar: '#toolbarDemo'
                , url: '/orders/showss'  //请求路径后台的
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
                }//下边的field里面是sql里面的列名
                , cols: [[
                    {type: 'checkbox',field:'选择'},
                    {
                        field: 'o_id', //json对应的key
                        title: '订单编号',   //列名 显示出来的名称
                        sort: true,  // 默认为 false,true为开启排序
                        width: 120
                    },
                    {field: 'm_name', title: '所购商品', width:200,
                        templet:function(d)
                        {
                            return "名称:"+d.m_name+"<br/>付款总金额￥:"+d.o_price+"" +
                                "<br/><img src='"+d.img_url+"' style='width:80px;height:90px' alt=\"白酒\"/>";
                        }
                    },
                    {field: 'o_date', title: '下单日期', width: 100,sort:true,
                        templet:function(d)
                        {
                            return layui.util.toDateString(d.o_date, 'yyyy-MM-dd HH:mm:ss')
                        }
                    },
                    {field: 'o_name', title: '收货人', width: 70},
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
                                if(${(e_id.r_id == 1 || e_id.r_id == 2 || e_id.r_id == 4 ||e_id.r_id == 8)})
                                {
                                    return "<span style='color:darkred'>未发货" +
                                        "<a class='layui-btn layui-btn-danger layui-btn-xs' lay-event='tosend'>发货</a>" +
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
                    tosend(id);
                }
                else if(layEvent === 'view'){
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
            data:"",
            dataType: "json",
            success: function(data) {
                $('span[name="countAll"]').html(data[0]);
                $('span[name="countcancle"]').html(data[1]);
                $('span[name="countOK"]').html(data[2]);
                $('span[name="countTosend"]').html(data[3]);
                $('span[name="countShou"]').html(data[4]);

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
    function tosend(o_id)
    {
        xadmin.open('发货','/orders/tosend?o_id='+o_id,'1000','500');
    }

</script>

</body>
</html>
