<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.awt.print.Printable" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理系统</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
 <script src="/js/jquery.js"></script>
 <script src="/js/jquery.mCustomScrollbar.concat.min.js"></script>

 <link rel="stylesheet" href="/css/xadmin.css">
 <link href="/css/bootstrap.min.css" rel="stylesheet">
 <link href="/css/materialdesignicons.min.css" rel="stylesheet">
 <link href="/css/style.min.css" rel="stylesheet">
 <link rel="stylesheet" href="/css/layui.css" media="all">
 <link rel="stylesheet" href="/css/publish.css" media="all">
 <script type="text/javascript" src="/js/move.js"></script>
 <script type="text/javascript" src="/js/publishImg.js"></script>


</head>
<body>

<div class="card">
     <section>
         <form action="Md_Add" method="post" >

         <ul class="ulColumn2">
             <li>
                 <div class="layui-form-item">
                     <label  class="layui-form-label"style="width:120px;" >
                         <span class="x-red">*</span><b>商品编号：</b></label>
                     <div class="layui-input-inline">
                         <input oninput="value=value.replace(/[^\d]/g,'')" id="m_id"  type="text"style="width:300px;" name="m_id" class="form-control" placeholder="商品编号..."/> </div>
                 </div>
             </li>
       <li>
        <div class="layui-form-item">
        <label  class="layui-form-label"style="width:120px;" >
         <span class="x-red">*</span><b>商品名称：</b></label>
        <div class="layui-input-inline">
         <input id="m_name" name="m_name" type="text"style="width:300px;" class="form-control"  placeholder="商品名称..."/>
        </div>
        </div>
      </li>
       <li>
        <div class="layui-form-item">
         <label  class="layui-form-label"style="width:120px;" >
          <span class="x-red">*</span><b>商品售价：</b></label>
         <div class="layui-input-inline">
          <input id="m_price" type="text"style="width:300px;" name="m_price" class="form-control" placeholder="商品售价..."/> </div>
        </div>
       </li>
       <li>
        <div class="layui-form-item">
         <label  class="layui-form-label"style="width:120px;" >
          <span class="x-red">*</span><b>商品原价：</b></label>
         <div class="layui-input-inline">
          <input id="m_bookprice" type="text" style="width:300px;"name="m_bookprice" class="form-control" placeholder="商品货号..."/>
         </div>
        </div>
        </li>
       <li>
        <div class="layui-form-item">
        <label  class="layui-form-label"style="width:120px;" >
         <span class="x-red">*</span><b>商品进价：</b></label>
        <div class="layui-input-inline">
         <input id="m_oldprice"  type="text" style="width:300px;"name="m_oldprice" class="form-control" placeholder="商品货号..."/>
        </div>
       </div>
        </li>
       <li>
        <div class="layui-form-item">
         <label  class="layui-form-label"style="width:120px;" >
          <span class="x-red">*</span><b>库存数量：</b></label>
         <div class="layui-input-inline">
          <input id="m_count" type="text" name="m_count" style="width:300px;"class="form-control" placeholder="商品货号..."/>
         </div>
        </div>
       </li>
       <li>
        <div class="layui-form-item">
         <label  class="layui-form-label"style="width:120px;" >
          <span class="x-red">*</span><b>商品规格：</b></label>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">商品分类</button>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
         <div class="modal-dialog" role="document">
          <div class="modal-content">
           <div class="modal-header">

            <table class="layui-table">
             <tbody class="x-cate">
             <c:forEach var="map" items="${list }">
             <c:if test="${map.c_Flag == 0}">
             <tr cate-id='${map.c_Id}' fid='0' >
              <td>
               <i class="layui-icon x-show" status='true'>&#xe623;</i>
               <label class="lyear-checkbox checkbox-primary" style="margin-top: -20px;margin-left:20px;">
                <input name="c_id" type="checkbox" class="checkbox-parent" dataid="id-${map.c_Id}" value="${map.c_Id}">
               <span> ${map.c_Name}</span>
               </label>
             <tbody class="x-cate">
             <c:forEach var="map_2" items="${list }">
              <c:if test="${map_2.c_Flag == map.c_Id }">
               <tr cate-id='${map_2.c_Id }' fid='${map.c_Id }' >
                <td>
                 <i class="layui-icon x-show" status='true'>&#xe623;</i>
                 <label class="lyear-checkbox checkbox-primary" style="margin-top: -20px;margin-left:20px;">
                  <input name="c_id" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-${map.c_Id}-${map_2.c_Id}" value="${map_2.c_Id}">
                   &nbsp;&nbsp;&nbsp;&nbsp;
                  <span>  ${map_2.c_Name }</span>
                 </label>
                </td>
               </tr>
               <c:forEach var="map_3" items="${list }">
                <c:if test="${map_3.c_Flag == map_2.c_Id }">
                 <tr cate-id='${map_3.c_Id }' fid='${map_2.c_Id }' >
                  <td>
                   <label class="lyear-checkbox checkbox-primary"style="margin-left:20px;">
                  <input name="c_id" type="checkbox" class="checkbox-parent checkbox-child"  dataid="id-${map.c_Id}-${map_2.c_Id}-${map_3.c_Id}" value="${map_3.c_Id}">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>  ├ ${map_3.c_Name }</span>
                   </label>
                  </td>
                 </tr>
                </c:if>
               </c:forEach>
              </c:if>

             </c:forEach>
             </tbody>
             </c:if>
             </c:forEach>
             </tr>
             </tbody>
            </table>
           </div>
          </div>
         </div>
        </div>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModals" data-whatever="@mdo">商品属性</button>
            <div class="modal fade" id="exampleModals" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <ul id="p_type">
                                <li>
                                      <div class="btn-group">
                                         <button style="float: left;"  type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                         <span class="caret"></span>
                                         <span class="sr-only">切换下拉列表</span>
                                         </button>
                                         <input type="text" id="key" style="float: left;width:100px;height:38px"class="form-control">
                                         <button onclick="keys()" type="button" style="float: left;margin-left:10px" class="layui-btn layui-btn-radius layui-btn-normal">添加名称</button>
                                         <input type="text" id="val" style="float: left;margin-left:10px;width:100px;height:38px"class="form-control">
                                         <button onclick="vals()" type="button" style="float: left;margin-left:10px" class="layui-btn layui-btn-radius layui-btn-normal">添加值</button>
                                         <ul id="key_ul" class="dropdown-menu">
                                         </ul>

                                      </div>
                                    </li>
                                    <li id="view">
                                </li>
                            </ul>
                         </div>
                        </div>
                    </div>
                </div>
            </div>

       </li>
       <li>
        <div class="layui-form-item">
         <label  class="layui-form-label"style="width:120px;" >
          <span class="x-red">*</span><b>是否上线：</b></label>
          <label style="margin-top: 10px" class="lyear-switch switch-solid switch-success">
           <input type="checkbox" name="m_flag" checked="" value="1">
           <span></span></label></div>
       </li>
        <li>
         <div class="layui-form-item" >
          <label  class="layui-form-label"style="width:120px;" >
           <span class="x-red">*</span><b>商品详情：</b></label>
          <textarea  style="width: 500px;" class="form-control" id="example-textarea-input" name="m_detail" rows="6" placeholder="内容.."></textarea>
         </div>
       </li>

          <li>
             <div class="layui-form-item">
                 <label  class="layui-form-label"style="width:120px;" >
                 </label>
                 <div class="layui-input-inline">
                  <input id="submit" class="btn btn-block btn-primary" value="确认提交" type="submit">
                 </div>
             </div>
         </li>

      </ul>
         </form>
     </section>
 </div>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript" src="/js/chosen.jquery.min.js"></script>
<script src="/lib/layui/layui.js"></script>

<script>

    // 分类展开收起的分类的逻辑
    //
    $("#m_id").change( function ()
        {
            $.ajax({
                url:"/Ifid",
                type:"post",
                data:{"m_id":$("#m_id").val()},
                dataType:"json",
                success:function (data)
                {
                    if (data.msg == 1)
                    {
                        layui.use("layer",function(){
                            var layer = layui.layer;
                            layer.msg("该编号已存在！")
                        });
                        $("#m_id").val(null);
                    }

                }
            })
        }

    )
    $(function(){
        $("tbody.x-cate tr[fid!='0']").hide();
        // 栏目多级显示效果
        $('.x-show').click(function () {
            if($(this).attr('status')=='true'){
                $(this).html('&#xe625;');
                $(this).attr('status','false');
                cateId = $(this).parents('tr').attr('cate-id');
                $("tbody tr[fid="+cateId+"]").show();
            }else{
                cateIds = [];
                $(this).html('&#xe623;');
                $(this).attr('status','true');
                cateId = $(this).parents('tr').attr('cate-id');
                getCateId(cateId);
                for (var i in cateIds) {
                    $("tbody tr[cate-id="+cateIds[i]+"]").hide().find('.x-show').html('&#xe623;').attr('status','true');
                }
            }
        })
    })

    var cateIds = [];
    function getCateId(cateId) {
        $("tbody tr[fid="+cateId+"]").each(function(index, el) {
            id = $(el).attr('cate-id');
            cateIds.push(id);
            getCateId(id);
        });
    }

</script>
<script type="text/javascript">
    $(function(){
        //动态选择框，上下级选中状态变化
        $('input.checkbox-parent').on('change', function(){
            var dataid = $(this).attr("dataid");
            $('input[dataid^=' + dataid + '-]').prop('checked', $(this).is(':checked'));
        });
        $('input.checkbox-child').on('change', function(){
            var dataid = $(this).attr("dataid");
            dataid = dataid.substring(0, dataid.lastIndexOf("-"));
            var parent = $('input[dataid=' + dataid + ']');
            if($(this).is(':checked')){
                parent.prop('checked', true);
                //循环到顶级
                while(dataid.lastIndexOf("-") != 2){
                    dataid = dataid.substring(0, dataid.lastIndexOf("-"));
                    parent = $('input[dataid=' + dataid + ']');
                    parent.prop('checked', true);
                }
            }else{
                //父级
                if($('input[dataid^=' + dataid + '-]:checked').length == 0){
                    parent.prop('checked', false);
                    //循环到顶级
                    while(dataid.lastIndexOf("-") != 2){
                        dataid = dataid.substring(0, dataid.lastIndexOf("-"));
                        parent = $('input[dataid=' + dataid + ']');
                        if($('input[dataid^=' + dataid + '-]:checked').length == 0){
                            parent.prop('checked', false);
                        }
                    }
                }
            }
        });
    });
    $("form").submit(function ()
    {
        var If = true;
        if ($("#m_id").val()== "" || $("#m_count").val()== "" || $("#m_oldprice").val()== ""|| $("#m_bookprice").val()== ""|| $("#m_price").val()== ""|| $("#m_name").val()== "" ||  $("#example-textarea-input").val()== "")
        {
            layui.use("layer",function(){
                var layer = layui.layer;
                layer.msg('请把信息填写完整！');
            });
            If = false;
            return If;
        }
        else{If = true;}
        return If;
    })

</script>

<script>
    function keys()
    {
       var key = $("#key").val();
        if (key == "") {
            layui.use("layer", function () {
                var layer = layui.layer;
                layer.msg('名称不能为空！');
            });
            return;
        }
       var ifs = new Array();
       $("#key_ul li b ").each(function (i) {
           ifs[i] = $(this).html();
       })
        var bool = true;
        for (var i = 0; i < ifs.length;i++)
        {
            if (ifs[i] == key)
            {
                bool = false;
                layui.use("layer",function(){
                    var layer = layui.layer;
                    layer.msg('该名称已存在！');
                });
                break;
            }
            else
            {
                bool = true;
            }
        }
        if (bool)
        {
            var html =  $("#key_ul").html();
                html += "<li id=\""+key+"\"><b>"+key+"</b><button type=\"button\" class=\"close\" id=\"del_k"+ifs.length+"\" onclick=\"del_key('del_k"+ifs.length+"')\"   aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></li>"
                $("#key_ul").html(html);
                html = $("#view").html();
                html +=" <div class=\"btn-group\">\n" +
                    "<button type=\"button\" class=\"btn btn-primary dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
                    "<b id=\"val_"+ifs.length+"\">"+key+"</b> <span class=\"caret\"></span>\n" +
                    "<input type=\"hidden\" name=\"t_type\" value=\""+key+"\">\n" +
                    "<input id='len"+key+"' type=\"hidden\" name=\"lengths\" value=\"0\">\n" +
                    "</button>\n" +
                    "<ul id=\"val_"+ifs.length+"\" class=\"dropdown-menu\">\n" +
                    "</ul>\n" +
                    "</div>";
            $("#view").html(html);
        }
    }

    function vals() {
        var key = $("#key").val();
        var val = $("#val").val();
        if (key == "") {
            layui.use("layer", function () {
                var layer = layui.layer;
                layer.msg('名称不能为空！');
            });
            return;
        }
        if (val == "") {
            layui.use("layer", function () {
                var layer = layui.layer;
                layer.msg('值不能为空！');
            });
            return;
        }
            var ifs = new Array();
            var bool = true;
            $("#view button b ").each(function (i) {
            ifs[i] = $(this).html();
            if (ifs[i] == key) {
                var len =parseInt($("#len"+key).val());
                len +=1;
                $("#len"+key).val(len);

                 var html = $(this).parent("button").next("ul").html();
                      html += "<li><b>"+val+"</b><button id=\"val"+val+"\" onclick=\"del_val('"+val+"','"+key+"')\" type=\"button\" class=\"close\"  aria-label=\"Close\"><span  aria-hidden=\"true\">×</span>" +
                          "<input type=\"hidden\" name=\"t_name\" value=\""+val+"\">\n" +
                          "</button></li>";
                      $(this).parent("button").next("ul").html(html);
                      bool = false;
            }
        })
        if (bool)
        {
            layui.use("layer", function () {
                var layer = layui.layer;
                layer.msg('该名称未添加，请先添加名称！');
            });
        }
    }

    function del_key(id)
    {

            var key =$("#"+id).parent("li").attr("id");
            $("#"+id).parent("li").remove();
            var ifs = new Array();
            $("#view button b ").each(function (i) {
            ifs[i] = $(this).html();
            if (ifs[i] == key)
            {
                $(this).parent("button").parent("div").remove();
            }
        })
    }
    function  del_val(id,key)
    {
        $("#val"+id).parent("li").remove();
        var len =parseInt($("#len"+key).val());
        len -=1;
        $("#len"+key).val(len);

    }
</script>
</section>
</body>
</html>
