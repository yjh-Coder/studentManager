<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detail_teacher.aspx.cs" Inherits="学籍成绩管理系统.manager.detail_teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>老师详情</title>
    <link href="../Scripts/layui/css/layui.css" rel="stylesheet" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="../Content/Site.css" rel="stylesheet" />
    <link href="../Login/mdialogjs/mdialog.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.js" type="text/javascript"></script>
    <script src="../Login/layui/layui.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Login/mdialogjs/zepto.min.js"></script>
    <script type="text/javascript" src="../Login/mdialogjs/mdialog.js"></script>
    <style>
        .layui-form-label {
            width: 110px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">
                老师编号:
            </label>
            <div class="layui-input-block" style="width: 300px;">
                <asp:TextBox ID="tb_tid" runat="server" name="tid" lay-verify="required" ReadOnly autocomplete="off" placeholder="请输入老师编号" class="layui-input"></asp:TextBox>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">
                教师名称:
            </label>
            <div class="layui-input-block" style="width: 300px;">
                <asp:TextBox ID="tb_tname" runat="server" name="tname" lay-verify="required" ReadOnly autocomplete="off" placeholder="请输入教师名称" class="layui-input"></asp:TextBox>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">密码:</label>
            <div class="layui-input-block" style="width: 300px;">
                <asp:TextBox ID="tb_password" runat="server" name="password" type="password" ReadOnly lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input"></asp:TextBox>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别:</label>
            <div class="layui-input-block" style="width: 300px;">
                <asp:TextBox ID="tb_sex" runat="server" lay-verify="required" name="sex" ReadOnly placeholder="请输入性别" autocomplete="off" class="layui-input"></asp:TextBox>
            </div>

        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">学院:</label>
            <div class="layui-input-block" style="width: 300px;">
                <input id="academy" runat="server" autocomplete="off" readonly class="layui-input" />
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">职称:</label>
            <div class="layui-input-block" style="width: 300px;">
                <input id="type" runat="server" autocomplete="off" readonly class="layui-input" />
            </div>
        </div>

        <script type="text/javascript">
            layui.use(['element', 'form'], function () {
                var element = layui.element,
                    form = layui.form;
            });
        </script>
    </form>
</body>
</html>
