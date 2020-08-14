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
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/layui.css" media="all">
    <link rel="stylesheet" href="/css/publish.css" media="all">
    <script type="text/javascript" src="/js/move.js"></script>
    <script src="/lib/layui/layui.js" charset="utf-8"></script>

    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
</head>
<body>
<button type="button" class="btn btn-primary" data-toggle="modal"  onclick="xadmin.open('添加','Md')" data-whatever="@mdo" ><i class="layui-icon">&#xe642;</i>添加商品</button>
</div>
<% request.setCharacterEncoding("UTF-8"); %>
<div class="layui-card-body ">
    <table class="layui-table ">
        <thead>
        <th width="70">商品编号</th>
        <th>商品名称</th>
        <th>商品售价</th>
        <th>商品原价</th>
        <th>商品进价</th>
        <th>库存数量</th>
        <th>是否上线</th>
        <th>商品分类</th>
        <th>商品图片</th>
        <th>商品操作</th>
        <th>商品属性</th>
        </thead>
        <c:forEach var="map" items="${list }">
            <tr>
                <td>${map.m_id}</td>
                <td>${map.m_name}</td>
                <td>${map.m_price}</td>
                <td>${map.m_bookprice}</td>
                <td>${map.m_oldprice}</td>
                <td>${map.m_count}</td>
                <td>
                    <label style="margin-top: 10px" class="lyear-switch switch-solid switch-success">
                        <input onclick="hahaa(${map.m_id})" id="${map.m_id}" type="checkbox" name="m_flag" ${map.m_flag == 1 ? "checked" : ""}  value="1"><span></span></label>
                </td>
                <td>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${map.m_id }" data-whatever="@mdo">商品分类</button>
                    <div class="modal fade" id="exampleModal${map.m_id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">

                                    <div class="layui-card-body ">
                                        <table class="layui-table layui-form">
                                            <thead>
                                            </thead>
                                            <tbody class="x-cate">
                                            <c:forEach var="map_1" items="${p_list }">
                                            <c:if test="${map_1.c_Flag == 0}">
                                                <c:if test="${map_1.m_id == map.m_id }">
                                            <tr cate-id='${map_1.c_Id }${map.m_id}' fid='0' >
                                                <td>
                                                    <i class="layui-icon x-show" status='true'>&#xe623;</i>
                                                        ${map_1.c_Name}
                                                </td>
                                              </tr>
                                            <tbody class="x-cate">
                                            <c:forEach var="map_2" items="${p_list }">
                                                <c:if test="${map_2.c_Flag == map_1.c_Id }">
                                                    <c:if test="${map_2.m_id == map.m_id }">
                                                    <tr cate-id='${map_2.c_Id }${map.m_id}' fid='${map_1.c_Id }${map.m_id}' >
                                                        <td>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <i class="layui-icon x-show" status='true'>&#xe623;</i>
                                                                ${map_2.c_Name }
                                                        </td>
                                                        </tr>
                                                        <c:forEach var="map_3" items="${p_list }">
                                                            <c:if test="${map_3.c_Flag == map_2.c_Id }">
                                                            <c:if test="${map_3.m_id == map.m_id }">
                                                                <tr cate-id='${map_3.c_Id }${map.m_id}' fid='${map_2.c_Id }${map.m_id}' >
                                                                    <td>
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        ├${map_3.c_Name }
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                           </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:if>

                                            </c:forEach>
                                            </tbody>
                                            </c:if>
                                            </c:if>
                                            </c:forEach>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </td>
                <td>
                    <button type="button" class="btn btn-primary" data-toggle="modal" onclick="xadmin.open('图片管理','Up_img?m_id=${map.m_id }')"  >图片管理</button>
                </td>
                <td>
                    <button type="button" class="btn btn-primary" data-toggle="modal" onclick="xadmin.open('修改','M_Upview?m_id=${map.m_id }')" ><i class="layui-icon">&#xe642;</i>修改商品</button>
                </td>
                <td>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModals${map.m_id }" data-whatever="@mdo">商品属性</button>
                    <div class="modal fade" id="exampleModals${map.m_id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <ul id="p_type">
                                        <li >
                                            <c:set var="type" value=""></c:set>
                                            <c:forEach var="map_pt2" items="${ptlist }">
                                                <c:if test="${map_pt2.m_Id == map.m_id}">
                                                    <c:if test="${type == '' || type != map_pt2.t_type }">
                                                        <c:set var="type" value="${map_pt2.t_type}"></c:set>
                                                        <div class="btn-group">
                                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <b id="val_${map_pt2.t_tid}">${map_pt2.t_type}</b> <span class="caret"></span>
                                                        </button>
                                                        <ul id="val_${map_pt2.t_tid }" class="dropdown-menu">
                                                            <c:forEach var="map_pt3" items="${ptlist }">
                                                                <c:if test="${(map_pt2.t_type == map_pt3.t_type)&&(map_pt3.m_Id == map.m_id)}">
                                                                    <li>
                                                                        <b>${map_pt3.t_name}</b>
                                                                    </li>
                                                                </c:if>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>

                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</div>
</div>
</div>
</div>
</section>

<script>
    layui.use(['form', 'layer'], function() {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;});
    // 分类展开收起的分类的逻辑
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
    function hahaa(id) {
        if($("#"+id).is(':checked'))
        {
            $.ajax({
                url:"/Upflag",
                type:"post",
                data:{"m_id":id ,"m_flag":1},
                dataType:"JSON",
                success:function (data)
                {
                }
            });
        }
        else
        {
            $.ajax({
                url:"/Upflag",
                type:"post",
                data:{"m_id":id ,"m_flag":0},
                dataType:"JSON",
                success:function (data)
                {
                }
            });
        }
    }
</script>

</section>
</body>
</html>
