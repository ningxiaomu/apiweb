<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>用例添加</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="../css/font.css">
        <link rel="stylesheet" href="../css/xadmin.css">
        <script src="../lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../js/xadmin.js"></script>
        <script type="text/javascript" src="../js/jquery.min.js"></script>
        <!--[if lt IE 9]>
        <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
        <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" id="saveCase" action="##" method="post">
                    <div class="layui-form-item">
                        <label for="caseName" class="layui-form-label">
                            <span class="x-red">*</span>用例名称
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="caseName" name="caseName" required="" lay-verify="required"
                                   autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>将会成为您用例的名称,必填
                        </div>
                    </div>

                    <%--所属项目--%>
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
                    <%-- 项目域名--%>
                    <div class="layui-form-item">
                        <label for="domain" class="layui-form-label">
                            <span class="x-red">*</span>项目域名
                        </label>
                        <div class="layui-input-inline">
                            <select  id="domain" name="domain" lay-verify="required" lay-filter="xmFilter">
                            </select>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <%--                          <span class="x-red">*</span>--%>
                            <span>必填</span>
                        </div>
                    </div>
                    <!--请求地址-->
                    <div class="layui-form-item">
                        <label for="requestAddress" class="layui-form-label">
                            <span class="x-red">*</span>请求地址
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="requestAddress" name="requestAddress" required="" lay-verify="required"
                                   autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>必填
                        </div>
                    </div>

                    <!--请求方法-->
                    <div class="layui-form-item">
                        <label for="method" class="layui-form-label">
                            <span class="x-red">*</span>请求方法
                        </label>
                        <div class="layui-input-inline">
                            <select id="method" name="method">
                                <option>post</option>
                                <option>get</option>
                            </select>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>必填
                        </div>
                    </div>

                    <!--contentType-->
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
                            <span class="x-red">*</span>必填
                        </div>
                    </div>

                    <!--请求参数-->
                    <div class="layui-form-item">
                        <label for="parameter" class="layui-form-label">
                            <span class="x-red">*</span>请求参数
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="parameter" name="parameter" required="" lay-verify="email"
                                   autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>非必填,如：key=4664e5&cardno=50023
                        </div>
                    </div>

                    <!--预期结果-->
                    <div class="layui-form-item">
                        <label for="exResult" class="layui-form-label">
                            <span class="x-red">*</span>预期结果
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="exResult" name="exResult" required=""
                                   autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>只适用于查找的接口,非必填
                        </div>
                    </div>


                    <!--用例状态-->
                    <div class="layui-form-item">
                        <label for="status" class="layui-form-label">
                            <span class="x-red">*</span>状态
                        </label>
                        <div class="layui-input-inline">
                            <select id="status" name="status">
                                <option>1</option>
                                <option>0</option>
                            </select>
                        </div>
                        <div class="layui-form-mid layui-word-aux">1代表启用，0代表停用</div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <p><input type="button" class="layui-btn" value="提交" id="L_repass" onclick="case_add()">&nbsp;<input type="reset" class="layui-btn" value="重置"></p >
                    </div>
                </form>
            </div>
        </div>

        <script>
                // var name=$("#projectSelect").val();
                // console.log("选择框的值1："+parent.document.getElementById("projectSelect").innerText)
                // console.log("选择框的值2："+parent.document.getElementById("projectSelect").textContent)
                // console.log("选择框的值："+parent.document.getElementById("projectSelect").options[1].text)
                //console.log("选择框的值："+parent.document.getElementById("projectSelect").value)
        </script>
        <script type="text/javascript">
            console.log('我进入了case-add添加页面')
            console.log("选择框的值："+$('#project').val())
            function case_add() {
                var formObject = {};
                var formArray =$("#saveCase").serializeArray();
                $.each(formArray,function(i,item){
                    formObject[item.name] = item.value;
                });
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/case/saveCase" ,//url
                    data:JSON.stringify(formObject),
                    contentType:'application/json;charset=utf-8',
                    success: function (data) {
                        console.log(data);//打印服务端返回的数据(调试用)
                        if (data.result == true) {
                            alert("增加成功");
                            xadmin.close();
                            // 可以对父窗口进行刷新
                            //xadmin.father_reload();
                           // parent.location.href  ="/case/findAllSelectCaseAfterEdit?size=10&page=1&projectName="+$('#project').val();
                           window.parent.location.reload()
                        }else{
                            alert("添加失败");
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
            //test
            layui.use(['form', 'upload', 'layer'], function () {
                var form = layui.form;
                //检查项目添加到下拉框中
                $.ajax({
                    url: '${pageContext.request.contextPath}/project/findAllProject',
                    dataType: 'json',
                    type: 'post',
                    success: function (data) {
                        var p=parent.document.getElementById("projectSelect").value
                        $('#project').append(new Option(p))
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
                        $('#domain').append(new Option("请选择域名"))
                        var list = [];
                        for (var i = 0; i <data.result.length ; i++) {
                            list.push(data.result[i].domain)
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
        <script>layui.use(['form', 'layer','jquery'],
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
        <script>var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();</script>
    </body>

</html>