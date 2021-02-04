<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detail_student.aspx.cs" Inherits="学籍成绩管理系统.manager.detail_student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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

    <script>
        function error() {
            new TipBox({ type: 'error', str: '修改失败！', hasBtn: true });
        }

        function success() {
            new TipBox({ type: 'success', str: '修改成功！', hasBtn: true });
        }

    </script>
</head>
<body>
    <form id="form1" runat="server" class="layui-form">
          <div class="layui-form-item">
            <label class="layui-form-label">
                学生学号:
            </label>
            <div class="layui-input-block" style="width: 300px;">
                <asp:TextBox ID="tb_sno" runat="server" name="tb_sno" lay-verify="required" ReadOnly autocomplete="off"  class="layui-input"></asp:TextBox>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">
                学生姓名:
            </label>
            <div class="layui-input-block" style="width: 300px;">
                <asp:TextBox ID="tb_sname" runat="server" name="tb_sname" lay-verify="required" ReadOnly autocomplete="off"  class="layui-input"></asp:TextBox>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">学生密码:</label>
            <div class="layui-input-block" style="width: 300px;">
                <asp:TextBox ID="tb_password" runat="server" name="tb_password" lay-verify="required" ReadOnly  autocomplete="off" class="layui-input"></asp:TextBox>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">学生性别:</label>
            <div class="layui-input-block" style="width: 300px;">
                 <asp:TextBox ID="sex" runat="server" name="tb_password" lay-verify="required" ReadOnly  autocomplete="off" class="layui-input"></asp:TextBox>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学生班级:</label>
              <div class="layui-input-block" style="width: 300px;">
                    <asp:TextBox ID="classname" runat="server" name="tb_password" lay-verify="required" ReadOnly  autocomplete="off" class="layui-input"></asp:TextBox>
            </div>

        </div>
    
        <div class="layui-form-item">
            <label class="layui-form-label">学生学院:</label>
            <div class="layui-input-block" style="width: 300px;">
                 <asp:TextBox ID="academy" runat="server" name="tb_password" lay-verify="required" ReadOnly  autocomplete="off" class="layui-input"></asp:TextBox>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">身份证号码:</label>
                <div class="layui-input-block" style="width: 300px;">
                   <asp:TextBox ID="tb_identication" runat="server" name="tb_password" lay-verify="required" ReadOnly  autocomplete="off" class="layui-input"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">入学年份:</label>
                <div class="layui-input-block" style="width: 300px;">
                    <asp:TextBox ID="tb_enrollment_year" runat="server" class="layui-input" name="tb_enrollment_year" ReadOnly lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off"></asp:TextBox>
                </div>
            </div>
        </div>


        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">学生专业:</label>
              <div class="layui-input-block" style="width: 300px;">
                 <asp:TextBox ID="profession" runat="server" name="tb_password" lay-verify="required"  ReadOnly autocomplete="off" class="layui-input"></asp:TextBox>
               
            </div>
           
        </div>

    </form>
</body>
</html>
