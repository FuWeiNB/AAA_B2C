<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>店铺总收入</title>
    <!-- 引入 echarts.js -->
    <script src="https://cdn.jsdelivr.net/npm/echarts@4.6.0/dist/echarts.common.js"></script>
    <script src="/js/jquery.js"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    $.ajax({
        url : "incomes",
        type:"post",
        data:"",
        dataType:"json",
        success:function (data)
        {
            var option = {
                title: {
                    text: '店铺总收入'
                },
                tooltip: {},
                legend: {
                    data:['总收入']
                },
                xAxis: {
                    data: ["收入","支出","总收入"]
                },
                yAxis: {},
                series: [{
                    name: '总收入',
                    type: 'bar',
                    data: data.xcount
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }

    })


</script>
</body>
</html>