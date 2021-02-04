<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="ManagerTest.aspx.cs" Inherits="学籍成绩管理系统.manager.ManagerTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ManagerTest" runat="server">

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
                    '开课时间': '<%#Eval("begintime")%>',
                    '结课时间': '<%#Eval("endtime")%>',
                    '学院编号': '<%#Eval("academyid")%>',
                    '课程类型编号': '<%#Eval("typeid")%>',
                    '课程封面': '<%#Eval("img")%>'
                })
            </script>

        </ItemTemplate>

        <FooterTemplate>
            <table class="layui-hide" id="test" lay-filter="test"></table>

            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-xs" lay-event="data">编辑</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
                            elem: '#test'
                            , title: '用户数据表'
                            , toolbar: 'default'
                            , cols: [[
                                { field: '课程号', width: 80, title: '课程号', sort: true, totalRowText: '合计' },
                                { field: '课程名', title: '课程名', sort: true },
                                { field: '学分', width: 100, title: '课程学分', sort: true, totalRow: true },
                                { field: '学时', title: '课程学时', sort: true },
                                { field: '学院', title: '学院', sort: true },
                                { field: '课程类型', title: '课程类型', sort: true },
                                { field: '开课时间', title: '开课时间', sort: true },
                                { field: '结课时间', title: '结课时间', sort: true },
                                { field: '学院编号', title: '学院编号', sort: true, style: 'display:none' },
                                { field: '课程类型编号', title: '课程类型编号', sort: true, style: 'display:none' },
                                { field: '课程封面', title: '课程封面', templet: '<div><img src="{{ d.课程封面}}" style="width: 20%;"></div>', style: 'height:48px;width:48px;line-height:48px!important;' },
                                { fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150 }
                            ]]
                            , data: datas
                            , page: true,
                            done: function () {
                                //隐藏 学院编号、课程类型编号 两列
                                $("[data-field='学院编号']").css('display', 'none');
                                $("[data-field='课程类型编号']").css('display', 'none');
                            }
                        });

                        table.on('toolbar(test)', function (obj) {
                            var checkStatus = table.checkStatus(obj.config.id)
                                , data = checkStatus.data; //获取选中的数据
                            switch (obj.event) {
                                case 'add':
                                    layer.open({
                                        title: '课程添加',
                                        type: 2,
                                        area: ['800px', '600px'],
                                        content: 'change_course.aspx?',
                                        btn: '添加',
                                        yes: function () {
                                            layer.closeAll();
                                            //console.log(parent);
                                            parent.location = 'change_course.aspx?';
                                        }
                                    });
                                    break;
                            };
                        });

                        table.on('row(test)', function (obj) {
                            var data = obj.data;
                            console.log(data);
                            layer.open({
                                title: '课程修改',
                                type: 2,
                                area: ['800px', '600px'],
                                content: 'change_course.aspx?cid=',
                                btn: '修改',
                                success: function (layero, index) {
                                    var iframeWindow = layero.find('iframe')[0].contentWindow;
                                    var body = layui.layer.getChildFrame('body', index);
                                    body.find("#tb_cid").val(data.课程号);
                                    body.find("#tb_cname").val(data.课程名);
                                    body.find("#tb_credit").val(data.学分);
                                    body.find("#tb_hour").val(data.学时);
                                    body.find(".select_academy").val(data.学院编号);
                                    body.find(".select_type").val(data.课程类型编号);
                                    body.find("#tb_begintime").val(data.开课时间);
                                    body.find("#tb_endtime").val(data.结课时间);
                                    // 记得重新渲染表单 *** 很重要
                                    iframeWindow.layui.form.render();
                                },
                                yes: function (index) {
                                    var body = layui.layer.getChildFrame('body', index);
                                    var cid = body.find("#tb_cid").val(data.课程号);
                                    var cname = body.find("#tb_cname").val(data.课程名);
                                    var credit = body.find("#tb_credit").val(data.学分);
                                    var hour = body.find("#tb_hour").val(data.学时);
                                    var academyid = body.find(".select_academy").val(data.学院编号);
                                    var typeid = body.find(".select_type").val(data.课程类型编号);
                                    var begintime = body.find("#tb_begintime").val(data.开课时间);
                                    var endtime = body.find("#tb_endtime").val(data.结课时间);
                                    //var img = body.find()

                                    //"change_course.aspx/change_course_ajax?cid=" + cid + "&cname=" + cname + "&credit=" + credit + "&hour=" + hour + "&academyid=" + academyid + "&typeid=" + typeid + "&begintime=" + begintime + "&endtime" + endtime,
                                    console.log(cid);
                                    $.ajax({
                                        url: "change_course.aspx",
                                        type: 'get',
                                        //contentType: 'application/json;charset=utf-8',      //请求头格式，json
                                        cache: false,
                                        success: function (resp) {
                                            layer.alert("修改成功", { icon: 1 }, function () {
                                                obj.update({
                                                    课程号: cid,
                                                    课程名: cname,
                                                    学分: credit,
                                                    学时: hour,
                                                    课程类型编号: typeid,
                                                    学院编号: academyid,
                                                  //  imgURL: pic_url
                                                });
                                                layer.closeAll(); // 关闭所有弹窗
                                                //   window.parent.location.reload();//刷新父页面
                                            });
                                        }
                                    })
                                    layer.closeAll();
                                    //console.log(parent);
                                    //parent.location = 'change_course.aspx?cid=' + data.课程号;
                                }
                            });

                            //标注选中样式
                            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
                        });
                    });
                }

            </script>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
