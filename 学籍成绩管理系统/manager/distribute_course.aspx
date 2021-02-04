<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="distribute_course.aspx.cs" Inherits="学籍成绩管理系统.manager.distribute_course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../Scripts/layui/css/layui.css" rel="stylesheet" />
    <link href="lib/build/css/app.css" rel="stylesheet" />
    <link href="../Login/mdialogjs/mdialog.css" rel="stylesheet" />
    <script src="layui/layui.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Login/mdialogjs/zepto.min.js"></script>
    <script type="text/javascript" src="../Login/mdialogjs/mdialog.js"></script>
    <style>
        /*.layui-table th {*/
        /*表头内容居中显示*/
        /*text-align: center;
        }*/
        .layui-table td {
            /*表头内容居中显示*/
            text-align: left;
        }

    </style>
</head>
<body>
    <form runat="server">
        <div class="layui-layout layui-layout-admin">
            <label style="margin-left: 30%">学院：</label>
            <asp:DropDownList ID="ddlAcademy" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlAcademy_SelectedIndexChanged" DataSourceID="sdsAcademy" DataTextField="academy" DataValueField="academy" AppendDataBoundItems="True">
            </asp:DropDownList>

            <asp:SqlDataSource ID="sdsAcademy" runat="server" ConnectionString="<%$ ConnectionStrings:asp.studentConnectionString2 %>" SelectCommand="SELECT [academy] FROM [academy]"></asp:SqlDataSource>

            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <script>
                        var json = [];
                    </script>
                </HeaderTemplate>
                <ItemTemplate>
                    <script type="text/javascript">
                        json.push({
                            '教师编号': '<%#Eval("tid")%>',
                            '教师名称': '<%#Eval("tname")%>',
                            '密码': '<%#Eval("password")%>',
                            '性别': '<%#Eval("sex")%>',
                            '学院': '<%#Eval("academy")%>',
                            '学院编号': '<%#Eval("academyid")%>',
                            '职称': '<%#Eval("title")%>',
                            '职称编号':'<%#Eval("titleid")%>'
                        })
                    </script>
                </ItemTemplate>
                <FooterTemplate>
                    <div style="text-align: center;">
                        <div class="layui-inline">
                            <table id="demo" lay-filter="test" style="margin: 0 auto; text-align: left;"></table>
                        </div>

                    </div>


                    <script type="text/html" id="barDemo">
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="distribute">分配课程</a>
                    </script>
                    <script src="layui/layui.js"></script>
                    <script>
                        var json = JSON.stringify(json);
                        var datas = JSON.parse(json);
                        window.onload = function () {
                            layui.use('table', function () {
                                var table = layui.table;
                                var form = layui.form;
                                var bak = datas;
                                form.render();
                                table.render({
                                    elem: '#demo'
                                    , title: '教师表'
                                    , width: 1299 * 0.8
                                    , cols: [[
                                        { field: '教师编号', width: 1299 * 0.8 * 0.15, title: '教师编号', sort: true, totalRowText: '合计' },
                                        { field: '教师名称', width: 1299 * 0.8 * 0.15, title: '教师名称', sort: true },
                                        { field: '学院', width: 1299 * 0.8 * 0.25, title: '学院', sort: true },
                                        { field: '性别', width: 1299 * 0.8 * 0.15, title: '性别', sort: true },
                                        { field: '职称', width: 1299 * 0.8 * 0.15, title: '职称', sort: true },
                                        { field: '学院编号', title: '学院编号', sort: true, style: 'display:none' },
                                        { field: '职称编号', width: 1299 * 0.8 * 0.15, title: '课程类型编号', sort: true, style: 'display:none' },
                                        { fixed: 'right', title: '操作', toolbar: '#barDemo', width: 1299 * 0.8 * 0.15 }
                                    ]]
                                    , data: datas
                                    , page: true
                                    , limits: [6, 10, 12, 18, 25]
                                    , limit: 6,
                                    done: function () {
                                        //隐藏 学院编号、课程类型编号 两列
                                        $("[data-field='学院编号']").css('display', 'none');
                                        $("[data-field='职称编号']").css('display', 'none');
                                    }
                                });

                                table.on('tool(test)', function (obj) {
                                    data = obj.data;   //获取选中的数据
                                    layEvent = obj.event;
                                    if (layEvent == "distribute") {
                                        var oldData = table.cache["demo"];
                                        var courseid = data["课程号"];

                                        parent.modal1(data);
                                        //layer.open({
                                        //    type: 2,
                                        //    area: ['800px', '650px'],
                                        //    content: 'distribute.aspx',
                                        //    success: function (layero, index) {
                                        //        iframeWindow = layero.find('iframe')[0].contentWindow;
                                        //    },
                                        //    yes: function (index) {
                                        //        var body = layui.layer.getChildFrame('body', index);

                                        //    }
                                        //});

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
        <h1 style="color: turquoise; margin: 0px auto; text-align: center;">已分配课程</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sdsTeaching" class="layui-table" AllowPaging="True" AllowSorting="True" DataKeyNames="tid,cid,classid" PageSize="7" Width="80%" Font-Size="Medium" HorizontalAlign="Center" Style="margin: 0px auto; margin-top: 4px;" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
            <Columns>

                <asp:BoundField DataField="cid" HeaderText="课程号" SortExpression="cid" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="cname" HeaderText="课程名称" SortExpression="cname" />
                <asp:BoundField DataField="tid" HeaderText="教工号" SortExpression="tid" ReadOnly="True" />
                <asp:BoundField DataField="tname" HeaderText="教师姓名" SortExpression="tname" />


                <asp:BoundField DataField="title" HeaderText="职称" SortExpression="title" />
                <asp:BoundField DataField="academy" HeaderText="学院" SortExpression="academy" />
                <asp:BoundField DataField="classname" HeaderText="班级名称" SortExpression="classname" />
                <asp:BoundField DataField="classid" HeaderText="班级编号" ReadOnly="True" SortExpression="classid" Visible="False" />
                <asp:TemplateField HeaderText="删除">
                    <ItemTemplate>
                        <asp:Button ID="btnDeleteRow" class="layui-btn layui-btn-xs" runat="server" CommandArgument='<%# Eval("tid")+","+Eval("cid")+","+Eval("classid") %>' OnClick="btnDeleteRow_Click" Text="删除" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:SqlDataSource ID="sdsTeaching" runat="server" ConnectionString="<%$ ConnectionStrings:asp.studentConnectionString %>" SelectCommand="SELECT [tid], [cid], [tname], [cname], [title], [academy], [classname], [classid] FROM [teaches]"></asp:SqlDataSource>
    </form>
</body>
</html>
