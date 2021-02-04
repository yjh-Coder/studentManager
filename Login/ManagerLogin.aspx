<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagerLogin.aspx.cs" Inherits="学籍成绩管理系统.Login.ManagerLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录界面</title>
    <link href="layui/css/layui.css" rel="stylesheet" />
    <link href="sliderValidate/dist/sliderVerify/sliderVerify.js" rel="stylesheet" />
    <link href="mdialogjs/mdialog.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="sweetalert/sweetalert.css" />
    <script src="layui/layui.js" type="text/javascript"></script>
    <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="sweetalert/sweetalert-dev.js" type="text/javascript"></script>
    <script type="text/javascript" src="mdialogjs/zepto.min.js"></script>
    <script type="text/javascript" src="mdialogjs/mdialog.js"></script>

    <script>
        //function error(){
        //    swal("这还是标题！", "这还是文本", "error");
        //    }
<%--            <% 
                Response.Redirect("../manager/admin_manager.aspx");
            %>--%>
        

        //function delay_time(mill) {
        //    var now = new Date(); var exitTime = now.getTime() + mill; while (true) { now = new Date(); if (now.getTime() > exitTime) break; };
        //}

        function error(){
            new TipBox({ type: 'error', str: '用户名或密码错误！', hasBtn: true });
        }
    </script>

    <style>
        body {
            background-image: url("images/0011.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
        }

        .login {
            background-color: white;
            align-content: center;
            /*            margin-left: 35%;
            margin-top: 20%;*/
        }

        .myform {
            margin-left: 35%;
            margin-top: 20%;
            margin-right: 30%;
        }
    </style>

</head>
<body>

    <form id="form1" runat="server" class="myform">
        <div class="login">

            <input id="verify" name="verify" runat="server" type="hidden" value="0" />

            <div class="layui-form-item">
                <img src="images/logo2.jpg" alt="hubu_logo.png" style="width: 150px; height: 150px; padding-left: 35%; position: relative" />
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label" for="username">用户名：</label>
                <div class="layui-input-block">
                    <input name="username" id="username" type="text" required lay-verify="required" placeholder="用户名" class="layui-input" style="width: 300px" />
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label" for="password">密码：</label>
                <div class="layui-input-block ">
                    <input name="password" id="password" required lay-verify="required" placeholder="密码" type="password" autocomplete="off" class="layui-input" style="width: 300px; vertical-align: middle" />
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">滑动验证：</label>
                <div class="layui-input-block" style="width: 300px">
                    <div id="slider"></div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <asp:Button ID="btn_login" runat="server" class="layui-btn layui-btn-warm layui-btn-radius" Text="登录" lay-submit lay-filter="formVerify" OnClick="btn_login_Click" />
                    <button type="reset" class="layui-btn layui-btn-danger layui-btn-radius" style="position: relative; left: 160px;">重置</button>
                </div>
            </div>

        </div>
    </form>



    <script type="text/javascript">

        //$("#btn_login").click()

        //var username = $("#username").val();
        //var password = $("password").val();
        




        // 一般直接写在一个js文件中
        layui.config({
            base: 'sliderValidate/dist/sliderVerify/'
        }).use(['sliderVerify', 'jquery', 'form'], function () {
            var sliderVerify = layui.sliderVerify,
                form = layui.form;
            var slider = sliderVerify.render({
                elem: '#slider',
                onOk: function () {//当验证通过回调
                    layer.msg("滑块验证通过");
                }
            })
            // 监听提交
            form.on('submit(formVerify)', function (data) {
                if (slider.isOk()) {//用于表单验证是否已经滑动成功
                    $("#veryfy".val('1'));
                } else {
                    layer.msg("请先通过滑块验证");
                }
                return false;
            });
        })


    </script>

</body>
</html>
