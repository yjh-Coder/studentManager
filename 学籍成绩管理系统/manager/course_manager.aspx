<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="course_manager.aspx.cs" Inherits="学籍成绩管理系统.manager.admin_manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>主界面</title>
    <%--    <link href="layui/css/layui.css" rel="stylesheet" />--%>
    <link href="../Scripts/layui/css/layui.css" rel="stylesheet" />
    <link href="lib/build/css/app.css" rel="stylesheet" />
    <link href="../Login/mdialogjs/mdialog.css" rel="stylesheet" />
    <script src="layui/layui.js" type="text/javascript"></script>
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
        <div class="layui-layout layui-layout-admin">

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
                                '开课时间': '<%#Eval("begintime")%>',
                                '结课时间': '<%#Eval("endtime")%>',
                                '学院编号': '<%#Eval("academyid")%>',
                                '课程类型编号': '<%#Eval("typeid")%>',
                                '课程封面': '<%#Eval("img")%>'
                            })
                    </script>
                </ItemTemplate>
                <FooterTemplate>
                    <table class="layui-hide" id="demo" lay-filter="test"></table>

                    <script type="text/html" id="tbToolBar">
                        <%--自定义左边添加按钮--%>
                        <a class="layui-btn layui-btn-green" lay-event="add">添加</a>
                        <a class="layui-btn layui-btn-green" lay-event="delete">批量删除</a>
                    </script>


                    <script type="text/html" id="barDemo">
                        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
                        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
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
                                    elem: '#demo'
                                    , title: '用户数据表'
                                    , toolbar: '#tbToolBar'
                                    , cols: [[
                                        { type: 'checkbox', fixed: 'left' },  //左边选中框
                                        { field: '课程号', width: 150, title: '课程号', sort: true, totalRowText: '合计' },
                                        { field: '课程名', width: 150, title: '课程名', sort: true },
                                        { field: '学分', width: 100, title: '课程学分', sort: true, totalRow: true },
                                        { field: '学时', width: 100, title: '课程学时', sort: true },
                                        { field: '学院', width: 135, title: '学院', sort: true },
                                        { field: '课程类型', width: 100, title: '课程类型', sort: true },
                                        { field: '开课时间', width: 120, title: '开课时间', sort: true },
                                        { field: '结课时间', width: 120, title: '结课时间', sort: true },
                                        { field: '学院编号', title: '学院编号', sort: true, style: 'display:none' },
                                        { field: '课程类型编号', width: 100, title: '课程类型编号', sort: true, style: 'display:none' },
                                        { field: '课程封面', width: 100, title: '课程封面', templet: '<div><img src="{{ d.课程封面}}" style="width: 60%;"></div>', style: 'height:76;width:100px;line-height:48px!important;' },
                                        { fixed: 'right', title: '操作', toolbar: '#barDemo', width: 175 }
                                    ]]
                                    , data: datas
                                    , page: true
                                    , limits: [10, 20, 25, 30, 35]
                                    , limit: 10,
                                    done: function () {
                                        //隐藏 学院编号、课程类型编号 两列
                                        $("[data-field='学院编号']").css('display', 'none');
                                        $("[data-field='课程类型编号']").css('display', 'none');
                                    }
                                });

                                table.on('toolbar(test)', function (obj) {     //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"

                                    var checkStatus = table.checkStatus(obj.config.id)
                                        , data = checkStatus.data; //获取选中的数据
                                    var oldData = obj.config.data;
                                    switch (obj.event) {
                                        case 'add':
                                            layer.open({
                                                title: '添加课程',
                                                type: 2,
                                                area: ['800px', '500px'],
                                                content: 'add_course.aspx',
                                                btn: '添加',
                                                success: function (layero, index) {
                                                    iframeWindow = layero.find('iframe')[0].contentWindow;
                                                },    // success
                                                yes: function (index) {
                                                    var body = layui.layer.getChildFrame('body', index);

                                                    var _cid = iframeWindow.document.getElementById("tb_cid").value;
                                                    var _cname = iframeWindow.document.getElementById("tb_cname").value;
                                                    var _credit = iframeWindow.document.getElementById("tb_credit").value;
                                                    var _hour = iframeWindow.document.getElementById("tb_hour").value;
                                                    //var _academy = iframeWindow.document.getElementById("academy").value;
                                                    //var _type = iframeWindow.document.getElementById("type").value;
                                                    var academy = iframeWindow.document.getElementById("academy");
                                                    var index1 = academy.selectedIndex;
                                                    var _academy = academy.options[index1].value;
                                                    var academyvalue = academy.options[index1].text;
                                                    var type = iframeWindow.document.getElementById("type");
                                                    var index2 = type.selectedIndex;
                                                    var _type = type.options[index2].value;
                                                    var typevalue = type.options[index2].text;
                                                    var _begintime = iframeWindow.document.getElementById("tb_begintime").value;
                                                    var _endtime = iframeWindow.document.getElementById("tb_endtime").value;
                                                    var _img = iframeWindow.document.getElementById("img_name").value;

                                                    $.ajax({
                                                        type: 'post',
                                                        url: "add_course.ashx",
                                                        data: {
                                                            cid: _cid,
                                                            cname: _cname,
                                                            credit: _credit,
                                                            hour: _hour,
                                                            academy: _academy,
                                                            type: _type,
                                                            begintime: _begintime,
                                                            endtime: _endtime,
                                                            img: _img
                                                        },
                                                        success: function (result) {
                                                            layer.alert("添加成功", { icon: 1 }, function (index) {
                                                                //var dataBak = [];
                                                                //for (var i = 0; i < oldData.length; i++) {
                                                                //    dataBak.push(oldData[i]);
                                                                //}
                                                                //dataBak.push({
                                                                //    课程号: _cid,
                                                                //    课程名: _cname,
                                                                //    学分: _credit,
                                                                //    学时: _hour,
                                                                //    学院: academyvalue,
                                                                //    学院编号: _academy,
                                                                //    课程类型编号: _type,
                                                                //    课程类型: typevalue,
                                                                //    开课时间: _begintime,
                                                                //    结课时间: _endtime,
                                                                //    课程封面: _img
                                                                //});
                                                                //table.reload("demo", { data: dataBak });
                                                                window.parent.location.reload();

                                                                layer.closeAll();
                                                            });
                                                        },
                                                        error: function (error) {
                                                            alert("添加失败");
                                                        }
                                                    });   //ajax
                                                }  //yes
                                            });
                                            break;
                                        case 'delete':
                                            layer.confirm('确认删除吗？', function (index) {
                                                var _cid = [];
                                                var flag = true;
                                                for (var o in data) {
                                                    _cid.push(data[o].课程编号);
                                                }
                                                $.ajax({
                                                    type: 'post',
                                                    url: 'del_course_many.ashx',
                                                    data: {
                                                        cid: _cid
                                                    },
                                                    success: function (res) {
                                                        layer.alert("删除成功", { icon: 1 }, function (index) {
                                                            window.parent.location.reload();
                                                            layer.closeAll();
                                                        });
                                                    },
                                                    error: function (error) {
                                                        alert("删除失败");
                                                    }
                                                });  //ajax
                                                layer.close(index);
                                            });
                                    };  //switch
                                });

                                table.on('tool(test)', function (obj) {
                                    data = obj.data;   //获取选中的数据
                                    layEvent = obj.event;
                                    if (layEvent == "edit") {
                                        layer.open({
                                            title: '课程修改',
                                            type: 2,
                                            area: ['800px', '500px'],
                                            content: 'edit_course.aspx',
                                            btn: '修改',
                                            success: function (layero, index) {
                                                iframeWindow = layero.find('iframe')[0].contentWindow;
                                                var body = layui.layer.getChildFrame('body', index);
                                                body.find("#tb_cid").val(data.课程号);
                                                body.find("#tb_cname").val(data.课程名);
                                                body.find("#tb_credit").val(data.学分);
                                                body.find("#tb_hour").val(data.学时);
                                                body.find("#academy").val(data.学院编号);
                                                body.find("#type").val(data.课程类型编号);
                                                body.find("#tb_begintime").val(data.开课时间);
                                                body.find("#tb_endtime").val(data.结课时间);
                                                body.find("#img").attr("src", data.课程封面);
                                                body.find("#img_name").val(data.课程封面);
                                                // 记得重新渲染表单 *** 很重要
                                                iframeWindow.layui.form.render();

                                            },    // success
                                            yes: function (index) {
                                                var body = layui.layer.getChildFrame('body', index);
                                                var _cid = iframeWindow.document.getElementById("tb_cid").value;
                                                var _cname = iframeWindow.document.getElementById("tb_cname").value;
                                                var _credit = iframeWindow.document.getElementById("tb_credit").value;
                                                var _hour = iframeWindow.document.getElementById("tb_hour").value;
                                                //var _academy = iframeWindow.document.getElementById("academy").value;
                                                //var _type = iframeWindow.document.getElementById("type").value;
                                                var academy = iframeWindow.document.getElementById("academy");
                                                var index1 = academy.selectedIndex;
                                                var _academy = academy.options[index1].value;
                                                var academyvalue = academy.options[index1].text;
                                                var type = iframeWindow.document.getElementById("type");
                                                var index2 = type.selectedIndex;
                                                var _type = type.options[index2].value;
                                                var typevalue = type.options[index2].text;

                                                var _begintime = iframeWindow.document.getElementById("tb_begintime").value;
                                                var _endtime = iframeWindow.document.getElementById("tb_endtime").value;
                                                var _img = iframeWindow.document.getElementById("img_name").value;

                                                $.ajax({
                                                    type: 'post',
                                                    url: "edit_course.ashx",
                                                    data: {
                                                        cid: _cid,
                                                        cname: _cname,
                                                        credit: _credit,
                                                        hour: _hour,
                                                        academy: _academy,
                                                        type: _type,
                                                        begintime: _begintime,
                                                        endtime: _endtime,
                                                        img: _img
                                                    },
                                                    success: function (result) {
                                                        layer.alert("修改成功", { icon: 1 }, function (index) {
                                                            obj.update({
                                                                '课程编号': _cid,
                                                                '课程名': _cname,
                                                                '学分': _credit,
                                                                '学时': _hour,
                                                                '学院': academyvalue,
                                                                '学院编号': _academy,
                                                                '课程类型编号': _type,
                                                                '课程类型': typevalue,
                                                                '开课时间': _begintime,
                                                                '结课时间': _endtime,
                                                                '课程封面': _img
                                                            });
                                                            layer.closeAll();
                                                        });
                                                    },
                                                    error: function (error) {
                                                        alert("修改失败");
                                                    }
                                                });   // ajax
                                            }  //yes
                                        }); //open
                                    }

                                    else if (layEvent == "del") {
                                        layer.confirm('确认删除吗？', function (index) {
                                            var oldData = table.cache["demo"];
                                            oldData.splice(obj.tr.data('index'), 1);
                                            var courseid = data["课程号"];
                                            //将要删除的一行的cid传到del_course.ashx里
                                            $.ajax({
                                                type: 'post',
                                                url: "del_course.ashx",
                                                data: {
                                                    cid: courseid
                                                },
                                                success: function (result) {
                                                    layer.alert("删除成功", { icon: 1 }, function (index) {
                                                        window.parent.location.reload();     //重新加载表格
                                                        layer.closeAll();
                                                    });
                                                },
                                                error: function (error) {
                                                    alert("删除失败");
                                                    layer.close(index);
                                                }
                                            });
                                            layer.close(index);
                                        });
                                    }
                                    else if (layEvent == "detail") {

                                        layer.open({
                                            title: '课程详情',
                                            type: 2,
                                            area: ['800px', '600px'],
                                            content: 'detail_course.aspx',
                                            btn: '关闭',
                                            success: function (layero, index) {
                                                iframeWindow = layero.find('iframe')[0].contentWindow;
                                                var body = layui.layer.getChildFrame('body', index);
                                                body.find("#tb_cid").val(data.课程号);
                                                body.find("#tb_cname").val(data.课程名);
                                                body.find("#tb_credit").val(data.学分);
                                                body.find("#tb_hour").val(data.学时);
                                                body.find("#academy").val(data.学院);
                                                body.find("#type").val(data.课程类型);
                                                body.find("#tb_begintime").val(data.开课时间);
                                                body.find("#tb_endtime").val(data.结课时间);
                                                body.find("#img").attr("src", data.课程封面);

                                                // 记得重新渲染表单 *** 很重要
                                                iframeWindow.layui.form.render();

                                            },    // success
                                            yes: function (index) {
                                                layer.close(index);
                                            }  //yes
                                        }); //open
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

    <script type="text/javascript">
        layui.use('element', function () {
            var element = layui.element;
        });
    </script>
</body>
</html>
