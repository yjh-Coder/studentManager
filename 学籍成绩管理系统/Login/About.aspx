<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="学籍成绩管理系统.Login.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../manager/layui/css/layui.css" rel="stylesheet" />
    <link href="timeline/time.css" rel="stylesheet" />
    <script src="../manager/layui/layui.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="timeline-box shadow">
            <div class="timeline-main">
                <h1><i class="fa fa-clock-o"></i>天道酬勤</h1>
                <div class="timeline-line"></div>
                <div class="timeline-year">
                    <h2><a class="yearToggle">2020 年</a><i class="fa fa-caret-down fa-fw"></i></h2>
                    <div class="timeline-month">
                        <ul>
                            <li>
                                <div class="h4 animated fadeInLeft">
                                    <p class="date">9月12日</p>
                                </div>
                                <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>
                                <div class="content animated fadeInRight">
                                    小组讨论使用什么技术来完成这次项目
                             <i class="layui-icon"></i>
                                </div>
                                <div class="clear"></div>
                            </li>
                            <li>
                                <div class="h4 animated fadeInLeft">
                                    <p class="date">9月15日</p>
                                </div>
                                <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>
                                <div class="content animated fadeInRight">
                                    组长分配组员任务，每周定期检查任务是否完成
                                </div>
                                <div class="clear"></div>
                            </li>
                            <li>
                                <div class="h4 animated fadeInLeft">
                                    <p class="date">9月23日</p>
                                </div>
                                <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>
                                <div class="content animated fadeInRight">
                                    做出登录界面，主页面
                                </div>
                                <div class="clear"></div>
                            </li>

                            <li>
                                <div class="h4 animated fadeInLeft">
                                    <p class="date">9月25日</p>
                                </div>
                                <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>
                                <div class="content animated fadeInRight">
                                    设计数据库，考虑有哪些表，有哪些字段
                                </div>
                                <div class="clear"></div>
                            </li>

                            <li>
                                <div class="h4 animated fadeInLeft">
                                    <p class="date">9月28日</p>
                                </div>
                                <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>
                                <div class="content animated fadeInRight">
                                    搭建三层架构，封装ADO.NET语句，写出数据访问层、业务逻辑层相关类
                                </div>
                                <div class="clear"></div>
                            </li>

                            <li>
                                <div class="h4 animated fadeInLeft">
                                    <p class="date">9月29日</p>
                                </div>
                                <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>
                                <div class="content animated fadeInRight">
                                    设计各个主页面，使用layui的数据表格进行数据展示
                                </div>
                                <div class="clear"></div>
                            </li>


                            <li>
                                <div class="h4 animated fadeInLeft">
                                    <p class="date">10月2日</p>
                                </div>
                                <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>
                                <div class="content animated fadeInRight">
                                    将数据从表格传到弹窗，并将弹窗写的内容使用ajax传到对应的一般处理程序进行接收。
                                </div>
                                <div class="clear"></div>
                            </li>

                            <li>
                                <div class="h4 animated fadeInLeft">
                                    <p class="date">10月4日</p>
                                </div>
                                <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>
                                <div class="content animated fadeInRight">
                                    基本实现数据库中课程信息的增删改查。
                                </div>
                                <div class="clear"></div>
                            </li>

                            <li>
                                <div class="h4 animated fadeInLeft">
                                    <p class="date">10月5日</p>
                                </div>
                                <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>
                                <div class="content animated fadeInRight">
                                   对前端页面进行优化。
                                </div>
                                <div class="clear"></div>
                            </li>

                        </ul>
                    </div>
                </div>
                

                <h1 style="padding-top: 4px; padding-bottom: 2px; margin-top: 40px;"><i class="fa fa-hourglass-end"></i>THE END</h1>
            </div>
        </div>
    </form>
</body>
</html>
