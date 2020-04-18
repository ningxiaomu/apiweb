<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>用户删除列表</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="../css/font.css">
        <link rel="stylesheet" href="../css/xadmin.css">
        <script type="text/javascript" src="../js/jquery.min.js"></script>
        <script src="../lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../js/xadmin.js"></script>
        <!--[if lt IE 9]>
        <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
        <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">


                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                      <th>ID</th>
                                      <th>username</th>
                                      <th>ip</th>
                                      <th>url</th>
                                      <th>method</th>
                                      <th>visitTime</th>
                                </thead>
                                <tbody id="itbody">


                                </tbody>
                            </table>
                        </div>
                        <div class="layui-card-body ">
                            <div class="layui-card-body ">
                                <div class="page">
                                    <div>
                                        <div id="homePage"></div>
                                        <div id="previousPage"></div>
                                        <div id="allPageList"></div>
                                        <div id="nextPage"></div>
                                        <div id="tailPage"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div><span id="totalNum"></span></div>

                    </div>
                </div>
            </div>
        </div> 
    </body>
    <style>
        #allPageList,#homePage,#previousPage,#nextPage,#tailPage{
            display: inline-block;
        }

        a {
            cursor:pointer;
        }
    </style>
    <script>
        $(document).ready(function () {
            var $table=$('table tbody');
            $.ajax({
                type:"POST",
                dataType:"json",
                url:"/sysLog/findAllLog?size=100&page=1",
                contentType:"application/json;charset=utf-8",
                success:function (data) {
                    var pages = data.obj.pages
                    var pageSize = data.obj.pageSize
                    var pageNum = data.obj.pageNum
                    var totalNum = data.obj.total
                    $('#homePage').append("<a class='prev' onclick='clickPage(1,"+pageSize+")'>首页</a>")
                    $('#previousPage').append("<a class='prev' onclick='clickPage("+(pageNum-1)+","+pageSize+")'><<</a>")
                    $('#nextPage').append("<a class='prev' onclick='clickPage("+(pageNum+1)+","+pageSize+")'>>></a>")
                    $('#tailPage').append("<a class='prev' onclick='clickPage("+pages+","+pageSize+")'>尾页</a>")
                    $('#totalNum').text("总共的页数:"+pageNum+"；总共的操作日志记录条数:"+totalNum)
                    for (var k =1; k<parseInt(data.obj.pages)+1;k++){
                        $('#allPageList').append("<a  onclick='clickPage("+k+","+pageSize+")'>"+k+"</a>")
                    }

                    for (var i = 0; i <data.result.length; i++) {
                        var $tr=$("<tr>"+"</tr>");
                        $table.append($tr);
                        var date = new Date(data.result[i].visitTime);
                        Y = date.getFullYear() + '-';
                        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
                        D = date.getDate() + ' ';
                        h = date.getHours() + ':';
                        m = date.getMinutes() + ':';
                        s = date.getSeconds();
                        var time=Y+M+D+h+m+s;

                        $tr.append("<td>"+data.result[i].id+"</td>"+"<td>"+data.result[i].username+"</td>"+"<td>"+data.result[i].ip+"</td>"+"<td>"+data.result[i].url+"</td>"+"<td>"+data.result[i].method+"</td>"+"<td>"+time+"</td>")

                    }
                }
            })
        })

        var $table=$('table tbody');
        function clickPage(page,size) {
            $("table tr td").remove()
            console.log("清除完成")
            $.ajax({
                type:"POST",
                dataType:"json",
                url:"/sysLog/findAllLog?size="+size+"&page="+page,
                contentType:"application/json;charset=utf-8",
                success:function (data) {
                    console.log("页面的data:"+data)
                    var allPages = data.obj.pages
                    console.log("allPages:"+allPages)
                    //添加class属性
                    $('#allPageList a').each(function () {
                        if($(this).text()==(page)){
                            $(this).addClass("layui-bg-blue")
                        }else{
                            $(this).removeClass("layui-bg-blue")
                        }
                    })
                    //更改点击下一页的属性
                    if(page==allPages){
                        $('#nextPage a').attr("onclick","clickPage("+(allPages)+","+size+")")
                    }else{
                        $('#nextPage a').attr("onclick","clickPage("+(page+1)+","+size+")")
                    }

                    //更改点击上一页的属性
                    if(page==1){
                        $('#previousPage a').attr("onclick","clickPage("+(1)+","+size+")")
                    }
                    else{
                        $('#previousPage a').attr("onclick","clickPage("+(page-1)+","+size+")")
                    }



                    for (var i = 0; i < data.result.length; i++) {
                        var $tr=$("<tr>"+"</tr>");
                        $table.append($tr);
                        $tr.append("<td>"+data.result[i].id+"</td>"+"<td>"+data.result[i].username+"</td>"+"<td>"+data.result[i].ip+"</td>"+"<td>"+data.result[i].url+"</td>"+"<td>"+data.result[i].method+"</td>"+"<td>"+data.result[i].visitTime+"</td>")
                    }
                }
            })
        }
    </script>
    <script>
      layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;


        // 监听全选
        form.on('checkbox(checkall)', function(data){

          if(data.elem.checked){
            $('tbody input').prop('checked',true);
          }else{
            $('tbody input').prop('checked',false);
          }
          form.render('checkbox');
        }); 
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });


      });

       /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要停用吗？',function(index){

              if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

              }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
              }
              
          });
      }

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
      }



      function delAll (argument) {
        var ids = [];

        // 获取选中的id 
        $('tbody input').each(function(index, el) {
            if($(this).prop('checked')){
               ids.push($(this).val())
            }
        });
  
        layer.confirm('确认要删除吗？'+ids.toString(),function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>
</html>