<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="system_switch.aspx.cs" Inherits="学籍成绩管理系统.manager.system_switch" %>

<%@ Import Namespace="学籍成绩管理系统.manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>系统开关</title>
    <link href="../Scripts/layui/css/layui.css" rel="stylesheet" />
    <link href="lib/build/css/app.css" rel="stylesheet" />
    <link href="../Login/mdialogjs/mdialog.css" rel="stylesheet" />
    <script src="../lib/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="layui/layui.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Login/mdialogjs/zepto.min.js"></script>
    <script type="text/javascript" src="../Login/mdialogjs/mdialog.js"></script>

    <script>
        $(function () {
            $("#system").prop("checked",<%Response.Write(Session["system"].ToString());%>);
            $("#select_course").prop("checked",<%Response.Write(Session["select_course"].ToString());%>);
            $("#drop_course").prop("checked",<%Response.Write(Session["drop_course"].ToString());%>);
            $("#give_score").prop("checked",<%Response.Write(Session["give_score"].ToString());%>);
        });

        function success() {
            new TipBox({ type: 'success', str: '保存成功！', hasBtn: true });
        }

        function error() {
            new TipBox({ type: 'error', str: '保存失败！', hasBtn: true });
        }

    </script>
</head>
<body>

    <form id="form1" runat="server" class="layui-form">


        <div class="layui-form-item">
            <label class="layui-form-label">系统开关</label>
            <div class="layui-input-block">
                <input type="checkbox" checked="" id="system" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF" />
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">选课开关</label>
            <div class="layui-input-block">
                <input type="checkbox" checked="" id="select_course" name="open" lay-skin="switch" lay-filter="switchTest1" lay-text="ON|OFF" />
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">退课开关</label>
            <div class="layui-input-block">
                <input type="checkbox" checked="" id="drop_course" name="open" lay-skin="switch" lay-filter="switchTest2" lay-text="ON|OFF" />
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">打分开关</label>
            <div class="layui-input-block">
                <input type="checkbox" checked="" id="give_score" name="open" lay-skin="switch" lay-filter="switchTest3" lay-text="ON|OFF" />
            </div>
        </div>

        <button class="layui-btn" id="save">保存开关状态</button>

    </form>

    <script>
        layui.use(['form', 'layer'], function () {
            var form = layui.form;
            var layer = layui.layer;
            //监听指定开关
            form.on('switch(switchTest)', function (data) {
                //layer.msg('开关开启：' + (this.checked ? 'true' : 'false'), {
                //    offset: '6px'
                //});
                layer.tips('该系统已' + (this.checked ? "打开" : "关闭"), data.othis)
            });

            //监听指定开关
            form.on('switch(switchTest1)', function (data) {
                layer.tips('选课系统已' + (this.checked ? "打开" : "关闭"), data.othis)
            });


            //监听指定开关
            form.on('switch(switchTest2)', function (data) {

                layer.tips('退课系统已' + (this.checked ? "打开" : "关闭"), data.othis)
            });

            //监听指定开关
            form.on('switch(switchTest3)', function (data) {
                layer.tips('打分系统已' + (this.checked ? "打开" : "关闭"), data.othis)
            });

        });


        $("#save").click(function () {
            var layer = layui.layer;
            var flag1 = document.getElementById("system").checked;
            var flag2 = document.getElementById("select_course").checked;
            var flag3 = document.getElementById("drop_course").checked;
            var flag4 = document.getElementById("give_score").checked;
            $.ajax({
                type: 'post',
                url: 'save_switch.ashx',
                data: {
                    "system": flag1,
                    "select_course": flag2,
                    "drop_course": flag3,
                    "give_score": flag4
                },
                success: function () {
                    window.parent.location.reload();
                },
                error: function () {
                    alert("保存失败！");
                }
            });  //ajax
        });


    </script>
</body>
</html>
