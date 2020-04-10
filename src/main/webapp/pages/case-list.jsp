<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>用例列表</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="../css/font.css">
        <link rel="stylesheet" href="../css/xadmin.css">
        <link rel="stylesheet" href="../css/pagination.css">
        <script src="../lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../js/xadmin.js"></script>
        <script type="text/javascript" src="../js/jquery.min.js"></script>
        <script type="text/javascript" src="../js/jquery.pagination.js"></script>
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
                        <div class="layui-card-body ">
                            <form class="layui-form" id="findAppointCase" class="layui-form" action="##" method="post">
                                <div class="layui-inline layui-show-xs-block">
                                    <label for="projectSelect" class="layui-form-label">查询指定用例</label>
                                    <div class="layui-input-inline">
                                        <select  id="projectSelect" name="projectName" lay-verify="required" lay-filter="xmFilter">
                                        </select>
                                    </div>
                                    <div class="layui-form-item">
<%--                                        <input type="button" class="layui-btn" value="搜索" id="L_repass" onclick="case_select(this,this.projectName)">--%>
                                        <input type="button" class="layui-btn" value="搜索" id="L_repass" onclick="case_select(this,this.projectName)">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                            <button class="layui-btn" onclick="xadmin.open('添加用户','./case-add.jsp',600,400)"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body">
                            <table class="layui-table layui-form">
                              <thead>
                                <tr>
                                  <th>
                                    <input type="checkbox" name=""  lay-skin="primary">
                                  </th>
                                  <th>用例ID</th>
                                  <th>接口名称</th>
                                  <th>所属项目</th>
                                  <th>域名</th>
                                  <th>请求地址</th>
                                  <th>请求方法</th>
                                  <th>ContentType</th>
                                  <th>请求参数</th>
                                  <th>预期结果</th>
                                  <th>启用状态</th>
                                  <th>操作</th>

                              </thead>
                              <tbody id="itbody">
<%--                              <c:forEach items="${pageInfo.list}" var="CaseList">--%>
<%--                              <tr>--%>
<%--                                  <td><input type="checkbox" name=""  lay-skin="primary"></td>--%>
<%--                                  <td>${CaseList.caseid}</td>--%>
<%--                                  <td>${CaseList.caseName}</td>--%>
<%--                                  <td>${CaseList.project}</td>--%>
<%--                                  <td>${CaseList.domain}</td>--%>
<%--                                  <td>${CaseList.requestAddress}</td>--%>
<%--                                  <td>${CaseList.method}</td>--%>
<%--                                  <td>${CaseList.contentType}</td>--%>
<%--                                  <td>${CaseList.parameter}</td>--%>
<%--                                  <td>${CaseList.exResult}</td>--%>
<%--                                  <td>${CaseList.statusStr}</td>--%>
<%--                              </tr>--%>
<%--                              </c:forEach>--%>
<%-- 我是华丽的分割线啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊 --%>
<%--                                        <span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>--%>
<%--                                    <td class="td-manage">--%>
<%--                                        <a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">--%>
<%--                                            <i class="layui-icon">&#xe601;</i>--%>
<%--                                        </a>--%>
<%--                                        <a title="编辑"  onclick="xadmin.open('编辑','admin-edit.html')" href="javascript:;">--%>
<%--                                            <i class="layui-icon">&#xe642;</i>--%>
<%--                                        </a>--%>
<%--                                        <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">--%>
<%--                                            <i class="layui-icon">&#xe640;</i>--%>
<%--                                        </a>--%>
<%--                                    </td>--%>
                              </tbody>
                            </table>
                        </div>
                        <div id="testpagin"></div>
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
                        <div id="testlist"></div>
                        <div><span id="totalNum">总共${pageInfo.pages}页,共${pageInfo.total}条数据</span></div>
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
    <script type="text/javascript">
        //点击页码
        var $table=$('table tbody');
        function clickPage(page,size) {
            $("table tr td").remove()
            console.log("清除完成")
            $.ajax({
                type:"POST",
                dataType:"json",
                url:"/case/findAllCasePage?size="+size+"&page="+page,
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
                        var $tr = $("<tr>" + "</tr>");
                        $table.append($tr);
                        $tr.append("<td>" + "<div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\">" + "<i class=\"layui-icon layui-icon-ok\">" + "</i>" + "</div>" + "</td>" + "<td>" + data.result[i].caseid + "</td>" + "<td>" + data.result[i].caseName + "</td>" + "<td>" + data.result[i].project + "</td>" + "<td>" + data.result[i].domain + "</td>" + "<td>" + data.result[i].requestAddress + "</td>" + "<td>" + data.result[i].method + "</td>" + "<td>" + data.result[i].contentType + "</td>" + "<td>" + data.result[i].parameter + "</td>" + "<td>" + data.result[i].exResult + "</td>" + "<td>" + data.result[i].statusStr + "</td>"+"<td>"+"<a title='编辑' onclick='xadmin.open("+"\"编辑\""+","+"\"admin-edit.html\""+")'>"+"<i class=\"layui-icon\">&#xe642;</i>"+"</a>"+"<a title='删除' onclick='xadmin.open("+"\"删除\""+","+"\"admin-del.html\""+")'>"+"<i class=\"layui-icon\">&#xe640;</i>"+"</a>"+"</td>")
                    }
                }
            })
        }

        $(document).ready(function () {
            var $table=$('table tbody');
            $.ajax({
                type:"POST",
                dataType:"json",
                url:"/case/findAllCasePage?size=10&page=1",
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
                    $('#totalNum').text("总共的用例条数："+totalNum)
                    for (var k =1; k<parseInt(data.obj.pages)+1;k++){
                            $('#allPageList').append("<a  onclick='clickPage("+k+","+pageSize+")'>"+k+"</a>")
                    }

                    for (var i = 0; i <data.result.length; i++) {
                        var $tr=$("<tr>"+"</tr>");
                        $table.append($tr);
                        $tr.append("<td>"+"<div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\">"+"<i class=\"layui-icon layui-icon-ok\">"+"</i>"+"</div>"+"</td>"+"<td>"+data.result[i].caseid+"</td>"+"<td>"+data.result[i].caseName+"</td>"+"<td>"+data.result[i].project+"</td>"+"<td>"+data.result[i].domain+"</td>"+"<td>"+data.result[i].requestAddress+"</td>"+"<td>"+data.result[i].method+"</td>"+"<td>"+data.result[i].contentType+"</td>"+"<td>"+data.result[i].parameter+"</td>"+"<td>"+data.result[i].exResult+"</td>"+"<td>"+data.result[i].statusStr+"</td>"+"<td>"+"<a title='编辑' onclick='xadmin.open("+"\"编辑\""+","+"\"admin-edit.html\""+")'>"+"<i class=\"layui-icon\">&#xe642;</i>"+"</a>"+"<a title='删除' onclick='xadmin.open("+"\"删除\""+","+"\"admin-del.html\""+")'>"+"<i class=\"layui-icon\">&#xe640;</i>"+"</a>"+"</td>")
                    }
                }
            })
        })
    </script>
<%--    <script>--%>
<%--        $(document).ready(function () {--%>
<%--            $.ajax({--%>
<%--                type:"POST",--%>
<%--                dataType:"json",--%>
<%--                url:"/case/findAllCasePage?size=10&page=1",--%>
<%--                contentType:"application/json;charset=utf-8",--%>
<%--                success:function (data) {--%>
<%--                    console.log("obj:"+data.obj)--%>
<%--                    var pages = data.obj.pages--%>
<%--                    var pageSize = data.obj.pageSize--%>
<%--                    var pageNum = data.obj.pageNum--%>
<%--                    var totalNum = data.obj.total--%>
<%--                    var homePageUri="${pageContext.request.contextPath}/case/findAllCasePage?page=1&size="+pageSize--%>
<%--                    var prePageUri ="${pageContext.request.contextPath}/case/findAllCasePage?page="+(pageNum-1)+"&size="+pageSize--%>
<%--                    var nextPageUri="${pageContext.request.contextPath}/case/findAllCasePage?page="+(pageNum+1)+"&size="+pageSize--%>
<%--                    var tailPageUri = "${pageContext.request.contextPath}/case/findAllCasePage?page="+pages+"&size="+pageSize--%>
<%--                    $('#homePage').attr("href",homePageUri)--%>
<%--                    $('#previousPage').attr("href",prePageUri)--%>
<%--                    $('#nextPage').attr("href",nextPageUri)--%>
<%--                    $('#tailPage').attr("href",tailPageUri)--%>
<%--                    $('#totalNum').text("总共的用例条数："+totalNum)--%>
<%--                    var $table=$('table tbody');--%>
<%--                    for (var k =1; k<parseInt(data.obj.pages);k++){--%>
<%--                        var $tr=$("<tr>"+"</tr>");--%>
<%--                        $table.append($tr);--%>
<%--                        $tr.append("<td>"+"<div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\">"+"<i class=\"layui-icon layui-icon-ok\">"+"</i>"+"</div>"+"</td>"+"<td>"+data.result[k].caseid+"</td>"+"<td>"+data.result[k].caseName+"</td>"+"<td>"+data.result[k].project+"</td>"+"<td>"+data.result[k].domain+"</td>"+"<td>"+data.result[k].requestAddress+"</td>"+"<td>"+data.result[k].method+"</td>"+"<td>"+data.result[k].contentType+"</td>"+"<td>"+data.result[k].parameter+"</td>"+"<td>"+data.result[k].exResult+"</td>"+"<td>"+data.result[k].statusStr+"</td>")--%>
<%--                        $('#allPageList').append("<a href='${pageContext.request.contextPath}/case/findAllCasePage?page="+k+"&size="+pageSize+"'>"+k+"</a>")--%>
<%--                    }--%>
<%--                }--%>
<%--            })--%>
<%--        })--%>
<%--    </script>--%>



     <script>
        layui.use(['form', 'upload', 'layer'], function () {
            var form = layui.form;
            //检查项目添加到下拉框中
            $.ajax({
                url: '${pageContext.request.contextPath}/project/getProjectList',
                dataType: 'json',
                type: 'post',
                success: function (data) {
                    $('#projectSelect').append(new Option("请选择项目"))
                    $.each(data, function (index, item) {
                        $('#projectSelect').append(new Option(item));// 下拉菜单里添加元素
                    });
                    layui.form.render("select");
                    //重新渲染 固定写法
                }
            })
        })
    </script>


    <script>
        var $table=$('table tbody');
        function clickSelectPage(page,size) {
            var name=$("#projectSelect").val();
            $("table tr td").remove()
            console.log("清除完成")
            $.ajax({
                type:"POST",
                dataType:"json",
                url:"/case/findAllSelectCase?size=10&page=1&projectName="+name,
                contentType:"application/json;charset=utf-8",
                success:function (data) {
                    console.log("页面的data:"+data)
                    var allselectPages = data.obj.pages
                    console.log("allselectPages:"+allselectPages)
                    //添加class属性
                    $('#allPageList a').each(function () {
                        if($(this).text()==(page)){
                            $(this).addClass("layui-bg-blue")
                        }else{
                            $(this).removeClass("layui-bg-blue")
                        }
                    })
                    //更改点击下一页的属性
                    if(page==allselectPages){
                        $('#nextPage a').attr("onclick","clickSelectPage("+(allselectPages)+","+size+")")
                    }else{
                        $('#nextPage a').attr("onclick","clickSelectPage("+(page+1)+","+size+")")
                    }

                    //更改点击上一页的属性
                    if(allselectPages==1){
                        $('#previousPage a').attr("onclick","clickSelectPage("+(1)+","+size+")")
                    }
                    else{
                        $('#previousPage a').attr("onclick","clickSelectPage("+(page-1)+","+size+")")
                    }



                    for (var i = 0; i < data.result.length; i++) {
                        var $tr = $("<tr>" + "</tr>");
                        $table.append($tr);
                        $tr.append("<td>" + "<div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\">" + "<i class=\"layui-icon layui-icon-ok\">" + "</i>" + "</div>" + "</td>" + "<td>" + data.result[i].caseid + "</td>" + "<td>" + data.result[i].caseName + "</td>" + "<td>" + data.result[i].project + "</td>" + "<td>" + data.result[i].domain + "</td>" + "<td>" + data.result[i].requestAddress + "</td>" + "<td>" + data.result[i].method + "</td>" + "<td>" + data.result[i].contentType + "</td>" + "<td>" + data.result[i].parameter + "</td>" + "<td>" + data.result[i].exResult + "</td>" + "<td>" + data.result[i].statusStr + "</td>"+"<td>"+"<a title='编辑' onclick='xadmin.open("+"\"编辑\""+","+"\"admin-edit.html\""+")'>"+"<i class=\"layui-icon\">&#xe642;</i>"+"</a>"+"<a title='删除' onclick='xadmin.open("+"\"删除\""+","+"\"admin-del.html\""+")'>"+"<i class=\"layui-icon\">&#xe640;</i>"+"</a>"+"</td>")
                    }
                }
            })
        }
        <!-- 我是华丽丽的分割线 -->
        function case_select(obj,name) {
            var name=$("#projectSelect").val();
            console.log(name)
            var formObject = {};
            var formArray =$("#findAppointCase").serializeArray();
            $.each(formArray,function(i,item){
                formObject[item.name] = item.value;
            });
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/case/findAllSelectCase?size=10&page=1&projectName="+name ,//url
                data:JSON.stringify(formObject),
                contentType:'application/json;charset=utf-8',
                success:function (data) {
                    var pages = data.obj.pages
                    var pageSize = data.obj.pageSize
                    var pageNum = data.obj.pageNum
                    var totalNum = data.obj.total
                    console.log("搜索的data"+data)
                    $('#totalNum').text("总共的用例条数："+totalNum)
                    $("table tr td").remove()
                    console.log("清除完成")
                    var $table=$('table tbody');
                    for (var i = 0; i <data.result.length; i++) {
                        var $tr=$("<tr>"+"</tr>");
                        $table.append($tr);

                        $tr.append("<td>"+"<div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\">"+"<i class=\"layui-icon layui-icon-ok\">"+"</i>"+"</div>"+"</td>"+"<td>"+data.result[i].caseid+"</td>"+"<td>"+data.result[i].caseName+"</td>"+"<td>"+data.result[i].project+"</td>"+"<td>"+data.result[i].domain+"</td>"+"<td>"+data.result[i].requestAddress+"</td>"+"<td>"+data.result[i].method+"</td>"+"<td>"+data.result[i].contentType+"</td>"+"<td>"+data.result[i].parameter+"</td>"+"<td>"+data.result[i].exResult+"</td>"+"<td>"+data.result[i].statusStr+"</td>"+"<td>"+"<a title='编辑' onclick='xadmin.open("+"\"编辑\""+","+"\"admin-edit.html\""+")'>"+"<i class=\"layui-icon\">&#xe642;</i>"+"</a>"+"<a title='删除' onclick='xadmin.open("+"\"删除\""+","+"\"admin-del.html\""+")'>"+"<i class=\"layui-icon\">&#xe640;</i>"+"</a>"+"</td>")
                    }

                    //重置页码
                    $('#allPageList a').remove()
                    for (var k =1; k<parseInt(data.obj.pages)+1;k++){
                        $('#allPageList').append("<a  onclick='clickSelectPage("+k+","+pageSize+")'>"+k+"</a>")
                    }
                    //重置首页
                    $('#homePage a').remove()
                    $('#homePage').append("<a class='prev' onclick='clickSelectPage(1,"+pageSize+")'>首页</a>")

                    //重置尾页
                    $('#tailPage a').remove()
                    $('#tailPage').append("<a class='prev' onclick='clickSelectPage("+pages+","+pageSize+")'>尾页</a>")

                }


            });
        }
    </script>


    <script>

      layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var form = layui.form;
        
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

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
</html>