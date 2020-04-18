<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-X-admin2.2</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="../css/font.css">
        <link rel="stylesheet" href="../css/xadmin.css">
        <link rel="stylesheet" href="../css/layer.css">
        <script type="text/javascript" src="../js/jquery.min.js"></script>
        <script type="text/javascript" src="../js/layer.js"></script>
        <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <%
    String caseid=request.getParameter("caseid");
    String caseName=request.getParameter("caseName");
    String project=request.getParameter("project");
    String domain=request.getParameter("domain");
    String requestAddress=request.getParameter("requestAddress");
    String method=request.getParameter("method");
    String contentType=request.getParameter("contentType");
    String parameter=request.getParameter("parameter");
    String exResult=request.getParameter("exResult");
    String status=request.getParameter("status");
    %>
    hello:<%=caseid%>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" id="editCase" action="##" method="post">
                    <div class="layui-form-item">
                        <label for="caseid" class="layui-form-label">
                            <span class="x-red">*</span>caseid
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="caseid" name="caseid" required="" lay-verify="required"
                                   autocomplete="off" class="layui-input" readonly="readonly" value=<%=caseid%>>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>用例id
                        </div>
                    </div>

                  <div class="layui-form-item">
                      <label for="caseName" class="layui-form-label">
                          <span class="x-red">*</span>caseName
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="caseName" name="caseName" required="" lay-verify="required"
                          autocomplete="off" class="layui-input" value=<%=caseName%>>
                      </div>
                      <div class="layui-form-mid layui-word-aux">
                          <span class="x-red">*</span>用例名称
                      </div>
                  </div>

                    <div class="layui-form-item">
                        <label for="project" class="layui-form-label">
                            <span class="x-red">*</span>用例所属项目
                        </label>
                        <div class="layui-input-inline">
                            <select  id="project" name="project" lay-verify="required" lay-filter="xmFilter">
                            </select>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>请仔细核对,必填
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label for="domain" class="layui-form-label">
                            <span class="x-red">*</span>项目域名
                        </label>
                        <div class="layui-input-inline">
                            <select  id="domain" name="domain" lay-verify="required" lay-filter="xmFilter">
                            </select>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span>必填</span>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label for="requestAddress" class="layui-form-label">
                            <span class="x-red">*</span>requestAddress
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="requestAddress" name="requestAddress" required="" lay-verify="required"
                                   autocomplete="off" class="layui-input" value=<%=requestAddress%>>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>请求地址
                        </div>
                    </div>



                    <div class="layui-form-item">
                        <label for="method" class="layui-form-label">
                            <span class="x-red">*</span>method
                        </label>
                        <div class="layui-input-inline">
                            <select id="method" name="method">
                                <c:if test="method==post">
                                    <option selected><%=method%></option>
                                    <option>get</option>
                                </c:if>
                                <c:if test="method==post">123</c:if>
<%--                                <c:if test="<%=method%>=='post'">--%>
<%--                                    <option selected><%=method%></option>--%>
<%--                                    <option>get</option>--%>
<%--                                </c:if>--%>
                                <c:if test="method==get">
                                    <option selected><%=method%></option>
                                    <option>post</option>
                                </c:if>

                            </select>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>请求方法
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label for="contentType" class="layui-form-label">
                            <span class="x-red">*</span>contentType
                        </label>
                        <div class="layui-input-inline">
                            <select id="contentType" name="contentType">
<%--                                <option>application/json</option>--%>
<%--                                <option>multipart/form-data</option>--%>
<%--                                <option>image/jpeg</option>--%>
<%--                                <option>application/x-www-form-urlencoded</option>--%>
                            </select>

                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>contentType
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label for="parameter" class="layui-form-label">
                            <span class="x-red">*</span>parameter
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="parameter" name="parameter" required="" lay-verify="required"
                                   autocomplete="off" class="layui-input" value=<%=parameter%>>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>请求参数
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label for="exResult" class="layui-form-label">
                            <span class="x-red">*</span>exResult
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="exResult" name="exResult" required="" lay-verify="required"
                                   autocomplete="off" class="layui-input" value=<%=exResult%>>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>预期结果
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label for="status" class="layui-form-label">
                            <span class="x-red">*</span>status
                        </label>
                        <div class="layui-input-inline">
                            <select id="status" name="status">
                            </select>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>启用状态：1是启用，0是禁用
                        </div>
                    </div>



                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <p><input type="button" class="layui-btn" value="提交" id="L_repass" onclick="case_edittest()"></p >
                    </div>
              </form>
            </div>
        </div>
        <div style="display: none" id="pname"></div>
        <script>
            console.log("case-edit的父级元素："+parent.document.getElementById("projectSelect").value)
        </script>
        <script>
            function case_edit() {

                //定义验证规则
                /*验证项目是否选择*/
                var projectValue = $('#project').val();
                if(projectValue=="请选择项目"){
                    alert("请选择项目");
                    return;
                }else {
                    console.log("项目已选择")
                }
                /*验证域名是否选择*/
                var domainValue = $('#domain').val();
                if(domainValue=="请选择域名"){
                    alert("请选择域名")
                    return;
                }else{
                    console.log("域名已选择")
                }

                var formObject = {};
                var formArray =$("#editCase").serializeArray();
                $.each(formArray,function(i,item){
                    formObject[item.name] = item.value;
                });
                //查找父级页面的项目名称(方便跳转)
                var parentName=parent.document.getElementById("projectSelect").value;
                console.log("case-edit的父级元素："+parent.document.getElementById("projectSelect").value)



                $.ajax({
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/case/editCase" ,//url
                    data:JSON.stringify(formObject),
                    contentType:'application/json;charset=utf-8',
                    success: function (data) {
                        var index = parent.layer.getFrameIndex(window.name);
                        console.log("index:"+index)
                        console.log(data);//打印服务端返回的数据(调试用)
                        if (data.result == true) {
                            //alert("修改成功");
                            //xadmin.close();
                            parent.layui.table.reload('itbody',{page:{curr:1}});
                            parent.layer.close(index);
                            console.log('刷新成功')
                            // 可以对父窗口进行刷新
                            // xadmin.father_reload();
                           //parent.location.href ="/case/findAllSelectCaseAfterEdit?size=10&page=1&projectName="+$('#project').val();
                           //parent.location.href ="/case/findAllSelectCaseAfterEdit?size=10&page=1&projectName="+parentName;
                            //parent.location.reload()
                            // history.back()
                        }else{
                            alert("修改失败");
                            xadmin.close();
                            xadmin.father_reload();
                        };
                    },
                    error : function() {
                        alert("异常！");
                    }
                });
            }
        </script>
        <script>

             function GetQueryValue(queryName) {
                     var query = decodeURI(window.location.search.substring(1));
                     var vars = query.split("&");
                     for (var i = 0; i < vars.length; i++) {
                             var pair = vars[i].split("=");
                             if (pair[0] == queryName) { return pair[1]; }
                        }
                    return null;
                }
                //重写项目
            layui.use(['form', 'upload', 'layer'], function () {
                var form = layui.form;
                //检查项目添加到下拉框中
                console.log("uri1:"+window.location.href)
                console.log("uri2:"+window.location.search)
                var project=GetQueryValue('project');
                console.log("project:"+project)
                // var project;
                // project=window.location.search.substring()


                $.ajax({
                    url: '${pageContext.request.contextPath}/project/findAllProject',
                    dataType: 'json',
                    type: 'post',
                    success: function (data) {
                        //var p="${caseInfo.project}"
                        $('#project').append(new Option(project))
                        // $('#project').append(new Option("请选择项目"))
                        var list = [];
                        for (var i = 0; i <data.result.length ; i++) {

                            list.push(data.result[i].projectName)

                        }

                        //删除重复的元素
                        for(var i=0;i<list.length;i++){
                            if(list[i]==project){
                                list.splice(i,1);
                            }
                        }
                        console.log("最后的list为："+list)

                        $.each(list, function (i, item) {
                            $('#project').append(new Option(item));// 下拉菜单里添加元素
                        });
                        layui.form.render("select");
                        //重新渲染 固定写法
                    }
                })
            })

        </script>

        <script >
            //重写域名
            var domain=GetQueryValue('domain')
            layui.use(['form', 'upload', 'layer'], function () {
                var form = layui.form;
                //检查项目添加到下拉框中
                $.ajax({
                    url: '${pageContext.request.contextPath}/project/findAllProject',
                    dataType: 'json',
                    type: 'post',
                    success: function (data) {
                        var p="${caseInfo.domain}"
                        $('#domain').append(new Option(domain))
                        var list = [];
                        for (var i = 0; i <data.result.length ; i++) {
                            list.push(data.result[i].domain)
                        }
                        //删除重复的元素
                        for(var i=0;i<list.length;i++){
                            if(list[i]==domain){
                                list.splice(i,1);
                            }
                        }
                        $.each(list, function (i, item) {
                            $('#domain').append(new Option(item));// 下拉菜单里添加元素
                        });
                        layui.form.render("select");
                        //重新渲染 固定写法
                    }
                })
            })
        </script>

        <script >
            //重写method
            var method=GetQueryValue('method')
                $('#method').append(new Option(method))
                if(method=='post'){
                    $('#method').append(new Option('get'))
                }else if(method=='get'){
                    $('#method').append(new Option('post'))
                }
        </script>
        <script >
            //重写status
            var status=GetQueryValue('status')
            console.log("status:"+status)
            console.log(typeof (status))
            $('#status').append(new Option(status))
            if(status=='1'){
                $('#status').append(new Option('0'))
            }else if(status=='0'){
                $('#status').append(new Option('1'))
            }
        </script>
        <script >
            //重写contentType
            var list=[];
            list=['application/json','multipart/form-data','image/jpeg','application/x-www-form-urlencoded']
            var contentType=GetQueryValue('contentType')
            $('#contentType').append(new Option(contentType))
            for(var i=0;i<list.length;i++){
                if(list[i]==contentType){
                    list.splice(i,1)
                }
            }
            console.log('list:'+list)
            $.each(list,function (i,item) {
                $('#contentType').append(new Option(item));
            })

        </script>
        

        <script>layui.use(['form', 'layer'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //自定义验证规则
                form.verify({
                    nikename: function(value) {
                        if (value.length < 5) {
                            return '昵称至少得5个字符啊';
                        }
                    },
                    pass: [/(.+){6,12}$/, '密码必须6到12位'],
                    repass: function(value) {
                        if ($('#L_pass').val() != $('#L_repass').val()) {
                            return '两次密码不一致';
                        }
                    }
                });

                //监听提交
                form.on('submit(add)',
                function(data) {
                    console.log(data);
                    //发异步，把数据提交给php
                    layer.alert("增加成功", {
                        icon: 6
                    },
                    function() {
                        //关闭当前frame
                        xadmin.close();

                        // 可以对父窗口进行刷新 
                        xadmin.father_reload();
                    });
                    return false;
                });

            });</script>

        <script>
            function case_edittest() {
                layui.use(['layer'], function(){
                    var layer=layui.layer;
                    var projectValue = $('#project').val();
                    console.log("parent.layui:"+parent.layer.table);
                    if(projectValue=="请选择项目"){
                        alert("请选择项目");
                        return;
                    }else {
                        console.log("项目已选择")
                    }
                    /*验证域名是否选择*/
                    var domainValue = $('#domain').val();
                    if(domainValue=="请选择域名"){
                        alert("请选择域名")
                        return;
                    }else{
                        console.log("域名已选择")
                    }

                    var formObject = {};
                    var formArray =$("#editCase").serializeArray();
                    $.each(formArray,function(i,item){
                        formObject[item.name] = item.value;
                    });
                    //查找父级页面的项目名称(方便跳转)
                    var parentName=parent.document.getElementById("projectSelect").value;
                    console.log("case-edit的父级元素："+parent.document.getElementById("projectSelect").value)



                    $.ajax({
                        type: "POST",//方法类型
                        dataType: "json",//预期服务器返回的数据类型
                        url: "/case/editCase" ,//url
                        data:JSON.stringify(formObject),
                        contentType:'application/json;charset=utf-8',
                        success: function (data) {
                            var index = parent.layer.getFrameIndex(window.name);
                            console.log("index:"+index)
                            console.log(data);//打印服务端返回的数据(调试用)
                            if (data.result == true) {
                                //alert("修改成功");
                                //xadmin.close();
                                window.parent.location.reload();
                                // parent.layer.table.reload('itbody',{page:{curr:1}});
                                parent.layer.close(index);
                                console.log('刷新成功')
                            }else{
                                alert("修改失败");
                                xadmin.close();
                                xadmin.father_reload();
                            };
                        },
                        error : function() {
                            alert("异常！");
                        }
                    });

                });
            }
        </script>
        <script>var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();</script>
    </body>

</html>
