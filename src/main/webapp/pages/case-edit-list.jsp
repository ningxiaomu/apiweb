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
        <script type="text/javascript" src="../js/jquery.min.js"></script>
        <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
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
                                   autocomplete="off" class="layui-input" readonly="readonly" value="">
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
                          autocomplete="off" class="layui-input" value="">
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
                                   autocomplete="off" class="layui-input" value="">
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
                                <c:if test="${caseInfo.method=='post'}">
                                    <option selected>${caseInfo.method}</option>
                                    <option>get</option>
                                </c:if>
                                <c:if test="${caseInfo.method=='get'}">
                                    <option selected>${caseInfo.method}</option>
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
                                <option>application/json</option>
                                <option>multipart/form-data</option>
                                <option>image/jpeg</option>
                                <option>application/x-www-form-urlencoded</option>
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
                                   autocomplete="off" class="layui-input" value="">
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
                                   autocomplete="off" class="layui-input" value="">
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
                                <c:if test="${caseInfo.status=='1'}">
                                    <option selected>${caseInfo.status}</option>
                                    <option>0</option>
                                </c:if>
                                <c:if test="${caseInfo.status=='0'}">
                                    <option selected>${caseInfo.status}</option>
                                    <option>1</option>
                                </c:if>
                            </select>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>启用状态：1是启用，0是禁用
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <p><input type="button" class="layui-btn" value="提交" id="L_repass" onclick="case_edit()">&nbsp;<input type="reset" class="layui-btn" value="重置"></p >
                    </div>
              </form>
            </div>
        </div>
        <script>
            //定义验证规则
            $('#project').blur(function () {
                var caseidValue = $('#project').val();
                if(caseidValue=="请选择项目"){
                    alert("请选择项目");
                    return;
                }else {
                    console.log("项目已选择")
                }
            })
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
                $.ajax({
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/case/editCase" ,//url
                    data:JSON.stringify(formObject),
                    contentType:'application/json;charset=utf-8',
                    success: function (data) {
                        var name="${caseInfo.project}";
                        console.log("name:"+name)
                        console.log(data);//打印服务端返回的数据(调试用)
                        if (data.result == true) {
                            alert("修改成功");
                            xadmin.close();
                            // case_select(this,name)
                            // 可以对父窗口进行刷新
                            // xadmin.father_reload();
                            console.log("case-edit-list")
                            parent.window.location.href ="/case/findAllSelectCaseAfterEdit?size=10&page=1&projectName="+$('#project').val();
                            // document.write(data)
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
            layui.use(['form', 'upload', 'layer'], function () {
                var form = layui.form;
                //检查项目添加到下拉框中
                $.ajax({
                    url: '${pageContext.request.contextPath}/project/findAllProject',
                    dataType: 'json',
                    type: 'post',
                    success: function (data) {
                        var p="${caseInfo.project}"
                        $('#project').append(new Option(p))
                        // $('#project').append(new Option("请选择项目"))
                        var list = [];
                        for (var i = 0; i <data.result.length ; i++) {

                            list.push(data.result[i].projectName)

                        }

                        //删除重复的元素
                        for(var i=0;i<list.length;i++){
                            if(list[i]==p){
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
            layui.use(['form', 'upload', 'layer'], function () {
                var form = layui.form;
                //检查项目添加到下拉框中
                $.ajax({
                    url: '${pageContext.request.contextPath}/project/findAllProject',
                    dataType: 'json',
                    type: 'post',
                    success: function (data) {
                        var p="${caseInfo.domain}"
                        $('#domain').append(new Option(p))
                        var list = [];
                        for (var i = 0; i <data.result.length ; i++) {
                            list.push(data.result[i].domain)
                        }
                        //删除重复的元素
                        for(var i=0;i<list.length;i++){
                            if(list[i]==p){
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
            var $table=$('table tbody');
            function clickSelectPage(page,size) {
                var name="${caseInfo.project}";
                console.log("clickSelectPage——name:"+name)
                $("table tr td").remove()
                console.log("清除完成")
                $.ajax({
                    type:"POST",
                    dataType:"json",
                    url:"/case/findAllSelectCase?size=10&page="+page+"&projectName="+name,
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
                            var $tr=$("<tr>"+"</tr>");
                            var baseURI="${pageContext.request.contextPath}/case/findCaseById?caseid="
                            var caseid=data.result[i].caseid
                            var statusStrCss;
                            $table.append($tr);
                            if(data.result[i].statusStr=='启用'){
                                statusStrCss='layui-btn layui-btn-normal layui-btn-mini';
                            }else if(data.result[i].statusStr=='停用'){
                                statusStrCss='layui-btn layui-btn-danger';
                            }else{
                                statusStrCss='layui-btn';
                            }
                            $tr.append("<td>"+"<div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\">"+"<i class=\"layui-icon layui-icon-ok\">"+"</i>"+"</div>"+"</td>"+"<td>"+data.result[i].caseid+"</td>"+"<td>"+data.result[i].caseName+"</td>"+"<td>"+data.result[i].project+"</td>"+"<td>"+data.result[i].domain+"</td>"+"<td>"+data.result[i].requestAddress+"</td>"+"<td>"+data.result[i].method+"</td>"+"<td>"+data.result[i].contentType+"</td>"+"<td>"+data.result[i].parameter+"</td>"+"<td>"+data.result[i].exResult+"<td class='"+statusStrCss+"' >"+data.result[i].statusStr+"</td>"+"<td>"+"<a title='编辑' id='"+caseid+"' href='"+baseURI+""+caseid+"' >"+"<i class=\"layui-icon\">&#xe642;</i>"+"</a>"+"<a title='删除' id='"+caseid+"' onclick='delSelectCase(this.id)'>"+"<i class=\"layui-icon\">&#xe640;</i>"+"</a>"+"</td>")
                            //$tr.append("<td>"+"<div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\">"+"<i class=\"layui-icon layui-icon-ok\">"+"</i>"+"</div>"+"</td>"+"<td>"+data.result[i].caseid+"</td>"+"<td>"+data.result[i].caseName+"</td>"+"<td>"+data.result[i].project+"</td>"+"<td>"+data.result[i].domain+"</td>"+"<td>"+data.result[i].requestAddress+"</td>"+"<td>"+data.result[i].method+"</td>"+"<td>"+data.result[i].contentType+"</td>"+"<td>"+data.result[i].parameter+"</td>"+"<td>"+data.result[i].exResult+"<td class='"+statusStrCss+"' >"+data.result[i].statusStr+"</td>")
                        }
                    }
                })
            }
            <!-- 我是华丽丽的分割线 -->
            function case_select(obj,name) {
                var name="${caseInfo.project}";
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
                        $('#totalNum').text("总共的页码数："+pageNum+"；总共的用例条数："+totalNum)
                        $("table tr td").remove()
                        console.log("清除完成")
                        //添加th -> 操作
                        // $temp=$('#ith').attr('myth')
                        // if(typeof ($temp)=='undefined'){
                        //     $('#itr').append($("<th id='ith' myth='caozuo'>"+"操作"+"</th>"))
                        // }else{
                        //     console.log('存在了，不用在添加了')
                        // }

                        var $table=$('table tbody');
                        for (var i = 0; i <data.result.length; i++) {
                            var $tr=$("<tr>"+"</tr>");
                            var baseURI="${pageContext.request.contextPath}/case/findCaseById?caseid="
                            var caseid=data.result[i].caseid
                            var statusStrCss;
                            $table.append($tr);
                            if(data.result[i].statusStr=='启用'){
                                statusStrCss='layui-btn layui-btn-normal layui-btn-mini';
                            }else if(data.result[i].statusStr=='停用'){
                                statusStrCss='layui-btn layui-btn-danger';
                            }else{
                                statusStrCss='layui-btn';
                            }

                            $tr.append("<td>"+"<div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\">"+"<i class=\"layui-icon layui-icon-ok\">"+"</i>"+"</div>"+"</td>"+"<td>"+data.result[i].caseid+"</td>"+"<td>"+data.result[i].caseName+"</td>"+"<td>"+data.result[i].project+"</td>"+"<td>"+data.result[i].domain+"</td>"+"<td>"+data.result[i].requestAddress+"</td>"+"<td>"+data.result[i].method+"</td>"+"<td>"+data.result[i].contentType+"</td>"+"<td>"+data.result[i].parameter+"</td>"+"<td>"+data.result[i].exResult+"<td class='"+statusStrCss+"' >"+data.result[i].statusStr+"</td>"+"<td>"+"<a title='编辑' id='"+caseid+"' href='"+baseURI+""+caseid+"' >"+"<i class=\"layui-icon\">&#xe642;</i>"+"</a>"+"<a title='删除' id='"+caseid+"' onclick='delSelectCase(this.id)'>"+"<i class=\"layui-icon\">&#xe640;</i>"+"</a>"+"</td>")

                            // if(name=="请选择项目"){
                            //     console.log("name:"+name)
                            //     try{
                            //         $("table #ith").remove()
                            //     }catch (e) {
                            //         console.log(e)
                            //     }
                            //
                            //     $tr.append("<td>"+"<div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\">"+"<i class=\"layui-icon layui-icon-ok\">"+"</i>"+"</div>"+"</td>"+"<td>"+data.result[i].caseid+"</td>"+"<td>"+data.result[i].caseName+"</td>"+"<td>"+data.result[i].project+"</td>"+"<td>"+data.result[i].domain+"</td>"+"<td>"+data.result[i].requestAddress+"</td>"+"<td>"+data.result[i].method+"</td>"+"<td>"+data.result[i].contentType+"</td>"+"<td>"+data.result[i].parameter+"</td>"+"<td>"+data.result[i].exResult+"<td class='"+statusStrCss+"' >"+data.result[i].statusStr+"</td>")
                            // }else{
                            //     console.log("name:"+name)
                            //     $tr.append("<td>"+"<div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\">"+"<i class=\"layui-icon layui-icon-ok\">"+"</i>"+"</div>"+"</td>"+"<td>"+data.result[i].caseid+"</td>"+"<td>"+data.result[i].caseName+"</td>"+"<td>"+data.result[i].project+"</td>"+"<td>"+data.result[i].domain+"</td>"+"<td>"+data.result[i].requestAddress+"</td>"+"<td>"+data.result[i].method+"</td>"+"<td>"+data.result[i].contentType+"</td>"+"<td>"+data.result[i].parameter+"</td>"+"<td>"+data.result[i].exResult+"<td class='"+statusStrCss+"' >"+data.result[i].statusStr+"</td>"+"<td>"+"<a title='编辑' id='"+caseid+"' href='"+baseURI+""+caseid+"' >"+"<i class=\"layui-icon\">&#xe642;</i>"+"</a>"+"<a title='删除' id='"+caseid+"' onclick='delSelectCase(this.id)'>"+"<i class=\"layui-icon\">&#xe640;</i>"+"</a>"+"</td>")
                            // }
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
        <script>var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();</script>
    </body>

</html>
