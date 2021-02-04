<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_manager.aspx.cs" Inherits="学籍成绩管理系统.manager.admin_manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>主界面</title>
    <link href="layui/css/layui.css" rel="stylesheet" />
    <link href="lib/build/css/app.css" rel="stylesheet" />
    <link href="../Login/mdialogjs/mdialog.css" rel="stylesheet"/>
    <script src="layui/layui.js" type="text/javascript"></script>
        <script type="text/javascript" src="../Login/mdialogjs/zepto.min.js"></script>
    <script type="text/javascript" src="../Login/mdialogjs/mdialog.js" ></script>

    <style>
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="layui-layout layui-layout-admin">
            <ul class="layui-nav layui-bg-green">
                <li class="layui-nav-item">湖北大学学生成绩管理系统</li>
                <ul class="layui-nav layui-layout-right">
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <img src="imgs/logo.png" class="layui-nav-img" />
                            非常6+1
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="">基本资料</a></dd>
                            <dd><a href="">安全设置</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item"><a href="../Login/ManagerLogin.aspx">退出</a></li>
                </ul>

            </ul>

            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">修改个人信息</a></dd>
                        <dd><a href="javascript:;">修改老师信息</a></dd>
                        <dd><a href="javascript:;">修改学生信息</a></dd>
                        <dd><a href="javascript:;">设置系统开关</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">课程管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">修改课程信息</a></dd>
                        <dd><a href="javascript:;">分配课程</a></dd>
                        <dd><a href="javascript:;">统计</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="javascript:;">产品</a></li>
                <li class="layui-nav-item"><a href="javascript:;">大数据</a></li>
            </ul>

            <div class="layui-body" id="container">
                <!-- 内容主体区域 -->
                <div style="padding: 15px;">主体内容加载中,请稍等...</div>
            </div>

            <div class="layui-footer">
                <!-- 底部固定区域 -->
                © 非常6+1 - 非常6+1团队制作           
            </div>
        </div>
    </form>

    <script type="text/javascript">
        layui.use('element', function () {
            var element = layui.element;
        });
    </script>
</body>
</html>
