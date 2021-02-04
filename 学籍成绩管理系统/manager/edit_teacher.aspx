<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_teacher.aspx.cs" Inherits="学籍成绩管理系统.manager.edit_teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
                <asp:TextBox ID="tb_tname" runat="server" name="tname" lay-verify="required" autocomplete="off" placeholder="请输入教师名称" class="layui-input"></asp:TextBox>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">密码:</label>
            <div class="layui-input-block" style="width: 300px;">
                <asp:TextBox ID="tb_password" runat="server" name="password" type="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input"></asp:TextBox>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别:</label>
            <div class="layui-input-block" style="width: 300px;">
                <asp:TextBox ID="tb_sex" runat="server" lay-verify="required" name="sex" placeholder="请输入性别" autocomplete="off" class="layui-input"></asp:TextBox>
            </div>

        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">学院:</label>
            <div class="layui-input-block" style="width: 300px;">
                <select name="academy" id="academy" lay-filter="aihao">
                    <option>请选择</option>
                    <option value="1">计算机与信息工程学院</option>
                    <option value="2">数学与统计学院</option>
                    <option value="3">体育学院</option>
                    <option value="4">文学院</option>
                    <option value="5">教育学院</option>
                    <option value="6">艺术学院</option>
                    <option value="7">材料科学与工程学院</option>
                    <option value="8">生命科学学院</option>
                    <option value="9">新闻传播学院</option>
                    <option value="10">历史文化学院</option>
                    <option value="11">经济学院</option>
                    <option value="12">商学院</option>
                    <option value="13">政法学院</option>
                    <option value="14">外国语学院</option>
                    <option value="15">哲学</option>
                    <option value="16">物理与电子科学学院</option>
                    <option value="17">化学化工学院</option>
                    <option value="18">资源环境学院</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">职称:</label>
            <div class="layui-input-block" style="width: 300px;">
                <select name="type" id="type" lay-filter="aihao">
                    <option>请选择</option>
                    <option value="1">讲师</option>
                    <option value="2">副教授</option>
                    <option value="3">教授</option>
                </select>
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
