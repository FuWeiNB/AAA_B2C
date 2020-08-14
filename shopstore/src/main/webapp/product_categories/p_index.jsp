<%--
    Fhw~
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="../js/jquery-1.8.3.min.js"></script>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-warm layui-btn-xs" onclick="xadmin.open('添加','p_Add?c_Flag=0')">
                        <i class="layui-icon">&#xe642;</i>添加主栏</button>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                            <th width="70">ID</th>
                            <th>栏目名</th>
                            <th width="250">操作</th>
                         </thead>
                        <tbody class="x-cate">
                         <c:forEach var="map" items="${list }">
                         <c:if test="${map.c_Flag == 0}">
                                <tr cate-id='${map.c_Id}' fid='0' >
                                <td>${map.c_Id}</td>
                                <td>
                                    <i class="layui-icon x-show" status='true'>&#xe623;</i>
                                     ${map.c_Name}
                                </td>
                                <td class="td-manage">
                                    <button class="layui-btn layui-btn layui-btn-xs"  onclick="xadmin.open('修改','p_Ud?c_Name=${map.c_Name }&c_Id=${map.c_Id}')" ><i class="layui-icon">&#xe642;</i>编辑</button>
                                    <button class="layui-btn layui-btn-warm layui-btn-xs"  onclick="xadmin.open('添加','p_Add?c_Flag=${map.c_Id }')" ><i class="layui-icon">&#xe642;</i>添加子栏目</button>
                                    <button class="layui-btn-danger layui-btn layui-btn-xs"  onclick="member_del(this,${map.c_Id })" href="javascript:;" ><i class="layui-icon">&#xe640;</i>删除</button>
                                </td>
                            </tr>
                        <tbody class="x-cate">
                    <c:forEach var="map_2" items="${list }">
                                 <c:if test="${map_2.c_Flag == map.c_Id }">
                                     <tr cate-id='${map_2.c_Id }' fid='${map.c_Id }' >
                                         <td>${map_2.c_Id }</td>
                                         <td>
                                             &nbsp;&nbsp;&nbsp;&nbsp;
                                             <i class="layui-icon x-show" status='true'>&#xe623;</i>
                                                 ${map_2.c_Name }
                                         </td>
                                         <td class="td-manage">
                                             <button class="layui-btn layui-btn layui-btn-xs"  onclick="xadmin.open('修改','p_Ud?c_Name=${map_2.c_Name }&c_Id=${map_2.c_Id}')" ><i class="layui-icon">&#xe642;</i>编辑</button>
                                             <button class="layui-btn layui-btn-warm layui-btn-xs"  onclick="xadmin.open('添加','p_Add?c_Flag=${map_2.c_Id}')" ><i class="layui-icon">&#xe642;</i>添加子栏目</button>
                                             <button class="layui-btn-danger layui-btn layui-btn-xs"  onclick="member_del(this,${map_2.c_Id })" href="javascript:;" ><i class="layui-icon">&#xe640;</i>删除</button>
                                         </td>
                                     </tr>
                                     <c:forEach var="map_3" items="${list }">
                                         <c:if test="${map_3.c_Flag == map_2.c_Id }">
                                             <tr cate-id='${map_3.c_Id }' fid='${map_2.c_Id }' >
                                                 <td>${map_3.c_Id }</td>
                                                 <td>
                                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    ├${map_3.c_Name }
                                                 </td>
                                                 <td class="td-manage">
                                                     <button class="layui-btn layui-btn layui-btn-xs"  onclick="xadmin.open('修改','p_Ud?c_Name=${map_3.c_Name }&c_Id=${map_3.c_Id}')" ><i class="layui-icon">&#xe642;</i>编辑</button>
                                                     <button class="layui-btn-danger layui-btn layui-btn-xs"  onclick="del(this,${map_3.c_Id})" href="javascript:;" ><i class="layui-icon">&#xe640;</i>删除</button>
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
</div>
                <script>
                    layui.use(['form'], function(){
                        form = layui.form;
                    });
                    function refresh() {
                        location.reload();
                    }
                        /*类别-删除*/
                    function member_del(obj,id){
                        layer.confirm('确认要删除主栏吗？\n提示：主栏下的数据，也会删除！',function(index){
                            //发异步删除数据
                            $(obj).parents("tr").remove();
                            $.ajax({
                                url:"p_del",
                                type:"post",
                                data:{"c_Id":id},
                                dataType:"html",
                                success:function (data)
                                {

                                }

                            })
                            layer.msg('已删除!',{icon:1,time:1000});
                            setTimeout("refresh()",1000);
                        });
                    }
                    function del(obj,id){
                        layer.confirm('确认要删除栏位吗？',function(index){
                            //发异步删除数据
                            $(obj).parents("tr").remove();
                            $.ajax({
                                url:"p_del",
                                type:"post",
                                data:{"c_Id":id},
                                dataType:"html",
                                success:function (data)
                                {

                                }

                            })
                            layer.msg('已删除!',{icon:1,time:1000})
                            setTimeout("refresh()",1000);
                        });
                    }

                    // 分类展开收起的分类的逻辑
                    //
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
</body>
</html>