<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>项目添加</title>
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
                <form class="layui-form" id="saveProject" action="##" method="post">
                  <div class="layui-form-item">
                      <label for="projectName" class="layui-form-label">
                          <span class="x-red">*</span>项目名称
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="projectName" name="projectName" required="" lay-verify="required"
                          autocomplete="off" class="layui-input">
                      </div>
                      <div class="layui-form-mid layui-word-aux">
                          <span class="x-red">*</span>将会成为您项目的名称,必填
                      </div>
                  </div>
                  <div class="layui-form-item">
                      <label for="domain" class="layui-form-label">
                          <span class="x-red">*</span>项目域名
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="domain" name="domain" required="" lay-verify="phone"
                          autocomplete="off" class="layui-input">
                      </div>
                      <div class="layui-form-mid layui-word-aux">
                          <span class="x-red">*</span>请仔细核对,必填
                      </div>
                  </div>
                  <div class="layui-form-item">
                      <label for="projectDesc" class="layui-form-label">
                          <span class="x-red">*</span>项目描述
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="projectDesc" name="projectDesc" required="" lay-verify="email"
                          autocomplete="off" class="layui-input">
                      </div>
                      <div class="layui-form-mid layui-word-aux">
<%--                          <span class="x-red">*</span>--%>
                          <span>非必填</span>
                      </div>
                  </div>


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
                        <p><input type="button" class="layui-btn" value="提交" id="L_repass" onclick="project_add()">&nbsp;<input type="reset" class="layui-btn" value="重置"></p >
                    </div>
              </form>
            </div>
        </div>
        <script type="text/javascript">

            function project_add() {
                var formObject = {};
                var formArray =$("#saveProject").serializeArray();
                $.each(formArray,function(i,item){
                    formObject[item.name] = item.value;
                });
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/project/saveProject" ,//url
                    data:JSON.stringify(formObject),
                    contentType:'application/json;charset=utf-8',
                    success: function (data) {
                        console.log(data);//打印服务端返回的数据(调试用)
                        if (data.result == true) {
                            alert("增加成功");
                            xadmin.close();
                            // 可以对父窗口进行刷新
                            xadmin.father_reload();
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
        <script>var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();</script>
    </body>

</html>
