<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_student.aspx.cs" Inherits="学籍成绩管理系统.add_student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>增加学生</title>

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
                <asp:TextBox ID="tb_sno" runat="server" name="sno" lay-verify="required" autocomplete="off" placeholder="请输入学号" class="layui-input"></asp:TextBox>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">
                学生姓名:
            </label>
            <div class="layui-input-block" style="width: 300px;">
                <asp:TextBox ID="tb_sname" runat="server" name="sname" lay-verify="required" autocomplete="off" placeholder="请输入学生姓名" class="layui-input"></asp:TextBox>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">学生密码:</label>
            <div class="layui-input-block" style="width: 300px;">
                <asp:TextBox ID="tb_password" runat="server" name="password" lay-verify="required" placeholder="请输入学生密码" autocomplete="off" class="layui-input"></asp:TextBox>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">学生性别:</label>
            <div class="layui-input-block" style="width: 300px;">
                  <select name="sex" id="sex" lay-filter="aihao">
                    <option>请选择</option>
                    <option value="1">男</option>
                    <option value="2">女</option>
                  
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学生班级:</label>
              <div class="layui-input-block" style="width: 300px;">
                <select name="classname" id="classname" lay-filter="aihao">
                    <option>请选择</option>
                    <option value="1">一班</option>
                    <option value="2">二班</option>
                    <option value="3">三班</option>
                    <option value="4">四班</option>
                    <option value="5">五班</option>
                </select>
            </div>

        </div>
    
        <div class="layui-form-item">
            <label class="layui-form-label">学生学院:</label>
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
            <div class="layui-inline">
                <label class="layui-form-label">身份证号码:</label>
                <div class="layui-input-block" style="width: 300px;">
                    <asp:TextBox ID="tb_identication" runat="server" class="layui-input" name="identication"  autocomplete="off"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">入学年份:</label>
                <div class="layui-input-block" style="width: 300px;">
                    <asp:TextBox ID="tb_enrollment_year" runat="server" class="layui-input" name="enrollment_year" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off"></asp:TextBox>
                </div>
            </div>
        </div>


        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">学生专业:</label>
              <div class="layui-input-block" style="width: 300px;">
                <select name="profession" id="profession" lay-filter="aihao">
                    <option>请选择</option>
                    <option value="1">国际经济与贸易</option>
                    <option value="2">人力资源</option>
                    <option value="3">软件工程</option>
                    <option value="4">旅游管理</option>
                    <option value="5">通信工程</option>
                    <option value="6">生物工程</option>
                    <option value="7">生物科学</option>
                    <option value="8">哲学</option>
                    <option value="9">思想政治教育</option>
                    <option value="10">教育学</option>
                    <option value="11">汉语言文学</option>
                    <option value="12">英语</option>
                    <option value="13">新闻学</option>
                    <option value="14">数学与应用数学</option>
                    <option value="15">物理学</option>
                    <option value="16">化学</option>
                    <option value="17">高分子材料与工程</option>
                    <option value="18">环境工程</option>
                    <option value="19">地理工程</option>
                    <option value="20">美术学</option>
                    <option value="21">体育教育</option>
                    <option value="22">历史学</option>
                    <option value="23">法学</option>
                    

                </select>
            </div>
           
        </div>
        <script>
            layui.use(['form', 'layedit', 'laydate'], function () {
                var form = layui.form
                , layedit = layui.layedit
                    , laydate = layui.laydate;

                //墨绿主题
                laydate.render({
                    elem: '#tb_enrollment_year'
                    , theme: 'molv',
                    trigger: 'click'
                });
            });

        </script>

    </form>
</body>
</html>
