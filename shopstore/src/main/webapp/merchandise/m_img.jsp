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

  <li>
         <div class="layui-form-item">
         <label  class="layui-form-label"style="width:120px;" >
          <span class="x-red">*</span><b>图片上传：</b></label>
        <div style="width:1100px; margin:0 auto;">
         <div class="layui-tab layui-tab-card">
         <div class="layui" style="padding: 20px 0 0 0;">
          <div class="layui-form-item">
           <label class="layui-form-label"></label>
           <div class="layui-input-inline">
            <div class="layui-upload-list layui-icon" id="addZmImg">
             &#xe64a;
            </div>

           </div>
          </div>
          <div class="">
           <ul id="imgZmList">
               <c:forEach var="map" items="${list }">
                   <li id="${map.img_name }" style="position:relative">
                   <img id="${map.img_name}" name="imgZmList" src="${map.img_url}"width="150" height="113">
                   <%--<div id="222" class="img_edit layui-icon" onclick="base(this,'${map.img_name}')"></div> --%>
                   <div id="${map.img_id}" class="img_close" onclick="deleteElement(this)">X</div>
                   </li>
               </c:forEach>
           </ul>
          </div>
         </div>
        </div>
         <div id="cropperdiv"></div></div></div>
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

<script type="text/javascript">
    layui.config({
        base: "/static/js/"
    })
 var file2 = null;
    function croppers_pic(obj,name) {
        var src = obj.parentNode.childNodes["0"].src;
        alert(src);
        layui.use(["croppers"], function () {
            var croppers = layui.croppers;
            croppers.render({
                area: ['900px', '600px']  //弹窗宽度
                , imgUrl: src
                , name : name
                , url: "/updateImg"  //图片上传接口返回和（layui 的upload 模块）返回的JOSN一样
                , done: function (url) { //上传完毕回调
                    //更改图片src
                    obj.parentNode.childNodes["0"].src = url.path;
                }

            });
        });
    }

    layui.use(['form', 'upload'], function () {
        var form = layui.form
            , $ = layui.jquery
            , upload = layui.upload;

        //证明多图片上传
        upload.render({
            elem: '#addZmImg'
            ,url: '/uploadImg'
           // ,auto: false
            //,bindAction: '#submit'
            , multiple: true
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    file2 = file.name;
                    $('#imgZmList').append('' +
                        '<li id="" style="position:relative">' +
                        '<img id="'+file2+'" name="imgZmList" src="' + result + '"width="150" height="113">' +
                        '<div id="222" class="img_edit layui-icon" onclick="croppers_pic(this,file2)"></div>'+
                        '<div id="'+"1"+file2+'" class="img_close" onclick="deleteElement(this)">X</div></li>');
                    form.render();
                    imgMove("imgZmList");
                });
            }
            , done: function(json){
                if(json.code == "200"){
                    var d  = document.getElementById(file2);
                    var c  = document.getElementById("1"+file2);
                    $(d).attr("id",json.name);
                    $(d).parent().attr("id",json.name);
                    $(c).attr("id",json.Uid);
                    return layer.msg('上传成功--------');
                }
            }
            ,error: function(index, upload){
                layer.closeAll('loading'); //关闭loading
            }

        });
    });

    function deleteElement(Obj) {
        Obj.parentNode.parentNode.removeChild(Obj.parentNode);
       $.ajax({
            url:"/DeleteImg",
            type:"post",
            data:{"i_name":$(Obj).parent().attr("id"),"m_name":$(Obj).last().attr("id")},
            dataType:"JSON",
            success:function (data)
            {
            }
        });
    }

</script>

  <script>
      function getUrlBase64(url, ext, callback) {
          var canvas = document.createElement("canvas");   //创建canvas DOM元素
          var ctx = canvas.getContext("2d");
          var img = new Image;
          img.crossOrigin = 'Anonymous';
          img.src = url;
          img.onload = function () {
              ctx.drawImage(img, 0, 0, canvas.width, canvas.height); //参数可自定义
              var dataURL = canvas.toDataURL("image/" + ext);
              callback.call(this, dataURL); //回掉函数获取Base64编码
              canvas = null;
          };
      }
      function base(obj,name) {
          var a = name.indexOf(".");
          var ext = name.substr(a+1,3);
          var path = "img_GFZ/"+name;
          getUrlBase64(path , ext, function (base64) {
              var a = base64;
              layui.use(["croppers"], function () {
                  var croppers = layui.croppers;
                  croppers.render({
                      area: ['900px', '550px']  //弹窗宽度
                      , imgUrl: a
                      , name : name
                      , url: "/updateImg"  //图片上传接口返回和（layui 的upload 模块）返回的JOSN一样
                      , done: function (url) { //上传完毕回调
                          //更改图片src
                          obj.parentNode.childNodes["0"].src = url.path;
                      }

                  });
              });
           });


      }

  </script>

  <script>

      window.onbeforeunload = onbeforeunload_handler;
      function onbeforeunload_handler(){
          alert(1111);
          //关闭当前frame
          xadmin.close();
          // 可以对父窗口进行刷新
          xadmin.father_reload();

      }
  </script>

</section>
</body>
</html>
