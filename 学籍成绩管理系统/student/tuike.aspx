<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tuike.aspx.cs" Inherits="学籍成绩管理系统.student.xuanke" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="layui/css/layui.css" rel="stylesheet" />
    <script src="layui/layui.js"></script>
    <link href="css/xuanke.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="header02">
                <div class="wrap1100">
                    <div class="logo">
                        <a href="#">
                            <img src="https://p.ananas.chaoxing.com/star3/origin/2386463173800464f6ecd78b373b9151.png" />
                        </a>
                    </div>
                </div>
                <div class="nav">
                    <div class="wrap1100" style="width: 1200px">
                        <div class="fl">
                            <ul class="fl menu">
                                <li class="cur">
                                    <a href="#">首页</a>
                                </li>
                                <li>
                                    <a href="#">新闻公告</a>
                                </li>
                                <li>
                                    <a href="#">课程中心</a>

                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
            <div style="clear: both"></div>
            <div class="mid">
                <div class="wrap1100 clearfix">
                    <div class="layui-col-md3 layui-col-sm3">
                        <div class="lierlf">
                            <div class="kwlm">
                                选课管理
                            </div>

                            <div class="libq"><a href="xuanke.aspx">选课</a></div>

                            <div class="libq"><a href="tuike.aspx">退课</a></div>



                        </div>
                        <div style="clear: both"></div>
                        <div style="" class="l_foot">
                            <div class="rg510dde">
                                <h2 style="text-align: center"><a href="#" target="_blank">选课管理系统</a> </h2>
                                <p><a href="#" target="_blank">为全校师生提供教学计划、排课、选课、成绩、学籍、教学评价等教务信息服务的综合管理系统。</a> </p>
                            </div>
                        </div>

                    </div>

                    <div class="layui-col-md9 layui-col-sm9">
                        <!-- 内容主体区域 -->
                        <div style="padding: 5px;">
                            <div>
                                <span class="layui-breadcrumb" style="visibility: visible;" lay-separator=">>">
                                    <a href="">首页</a><span lay-separator="">>></span>
                                    <a href="">退课</a>
                                    
                                    
                                </span>
                            </div>
                            <table id="demo" lay-filter="test"></table>
                            <script type="text/html" id="barDemo">

                                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="choose">退课</a>


                            </script>
                        </div>
                    </div>


                </div>
            </div>
            <div class="bannbot">
                <p class="foot">super.six.plus.one.com - 非常六加一团队制作</p>
            </div>
        </div>
    </form>
</body>
</html>
<script>
    layui.use("table", function () {
        var table = layui.table;
        //加载table实例
        table.render({
            elem: '#demo',//绑定id
            url: "jscript/user.json",
            page: true,

            cols: [[//标头 filed字段与数据一致
                { field: 'aa', type: 'numbers' },
                { field: 'cid', title: '课程编号', sort: true, width: 100 },
                { field: 'cname', title: '课程名称', sort: true, width: 150 },
                { field: 'academy', title: '学院', sort: true, width: 180 },

                { field: 'tname', title: '授课老师', sort: true, width: 120 },
                //设置表头工具栏
                { filed: "操作", toolbar: "#barDemo" }

            ]],

        })
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var tr = obj.data;
            var eventname = obj.event;
            if (eventname == 'choose') {
                layer.confirm("确认选择课程吗", function (index) {
                    obj.choose();
                    layer.close(index);
                });
            }
        })

    })
</script>
