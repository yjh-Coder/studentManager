<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="all_courses.aspx.cs" Inherits="学籍成绩管理系统.main.all_courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../Scripts/layui/css/layui.css" rel="stylesheet" />
    <link href="layui/admin.css" rel="stylesheet" />
    <link href="layui/template.css" rel="stylesheet" />
    <script src="../Scripts/layui/layui.js"></script>
    <script src="../lib/js/jquery-3.3.1.min.js"></script>
    <style>
        .layui-table-cell{
             height:50px;
             line-height: 50px;
            }
        .layui-table{
            width:60%;
        }
       .layui-table-header{
           width:59.5%;
           border-top:none;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="layui-form">
        <div class="layui-body">
            <div class="layui-form-item" style="margin-bottom: 0px;">
                <div class="layui-input-inline">
                    <select name="list" lay-filter="aihao" lay-verify="required">
                        <option value="0">全部</option>
                        <option value="1">课程编号</option>
                        <option value="2">课程名称</option>
                        <option value="3">课程类型</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="search" class="layui-input" />
                </div>
                <div class="layui-input-inline">
                    <asp:Button ID="btn_search" runat="server" class="layui-btn layui-btn-green" Text="查询" OnClick="btn_search_Click1" />
                </div>
            </div>

            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <script>
                    var json = [];
                    </script>
                </HeaderTemplate>
                <ItemTemplate>
                    <script type="text/javascript">
                    json.push({
                        '课程号': '<%#Eval("cid")%>',
                        '课程名': '<%#Eval("cname")%>',
                        '学分': '<%#Eval("credit")%>',
                        '学时': '<%#Eval("hour")%>',
                        '学院': '<%#Eval("academy")%>',
                        '课程类型': '<%#Eval("coursetype")%>',
                        '课程封面': '<%#Eval("img")%>'
                    })
                    </script>

                </ItemTemplate>
                <FooterTemplate>
                    <table class="layui-hide" id="demo" lay-filter="test"></table>

                    <script type="text/html" id="barDemo">
                        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
                    </script>
                    <script src="layui/layui.js"></script>
                    <script>
                        var json = JSON.stringify(json);
                        var datas = JSON.parse(json);
                        console.log(datas);
                        window.onload = function () {
                            layui.use('table', function () {
                                var table = layui.table;
                                var form = layui.form;
                                form.render();
                                table.render({
                                    elem: '#demo'
                                    , title: '用户数据表'
                                    , cols: [[
                                        //{ type: 'checkbox', fixed: 'left' },  //左边选中框                                        
                                        { field: '课程名', width: 150, title: '课程名', sort: true },
                                        { field: '学分', width: 100, title: '课程学分', sort: true },
                                        { field: '学时', width: 100, title: '课程学时', sort: true },
                                        { field: '学院', width: 135, title: '学院', sort: true },
                                        { field: '课程类型', width: 100, title: '课程类型', sort: true },
                                        { field: '课程封面', width: 100, title: '课程封面', templet: '<div><img src="{{ d.课程封面}}" style="width: 80%;"></div>', style: 'height:76;width:100px;line-height:48px!important;' },
                                        { fixed: 'right', title: '操作', toolbar: '#barDemo', width: 100 }
                                    ]]
                                    , data: datas
                                    , page: true
                                    , limits: [9, 20, 25, 30, 35]
                                    , limit: 9
                                    , done: function () {
                                        $("[data-field='课程号']").css('display', 'none');
                                    }
                                });

                                table.on('tool(test)', function (obj) {
                                    data = obj.data;   //获取选中的数据
                                    layEvent = obj.event;
                                    if (layEvent == "detail") {
                                        window.location.href = "../main/Course_Info.aspx?cid=" + data.课程号;

                                    }
                                    //标注选中样式                               
                                    obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
                                   
                                });

                            });
                        }

                    </script>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
