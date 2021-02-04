<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="teaching.aspx.cs" Inherits="学籍成绩管理系统.manager.teaching" %>

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
</head>
<body>
    <form id="form1" runat="server" class="layui-form">
        <div class="layui-layout layui-layout-admin">

            <div class="layui-form-item" style="margin-bottom: 0px;">
                <div class="layui-input-inline">
                    <select name="list" lay-filter="aihao" lay-verify="required">
                        <option value="0">全部</option>
                        <option value="1">老师编号</option>
                        <option value="2">老师名称</option>
                        <option value="3">学院</option>
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
                            '教师编号': '<%#Eval("tid")%>',
                            '课程编号': '<%#Eval("cid")%>',
                            '授课老师': '<%#Eval("tname")%>',
                            '课程名称': '<%#Eval("cname")%>',
                            '班级编号': '<%#Eval("classid")%>',
                            '班级名称': '<%#Eval("classname")%>',
                            '学院': '<%#Eval("academy")%>',
                            '学院编号': '<%#Eval("academyid")%>',
                            '职称': '<%#Eval("title")%>',
                            '职称编号':'<%#Eval("titleid")%>'
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
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除记录</a>
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
                                    , title: '用户数据表'
                                    , toolbar: '#tbToolBar'
                                    , cols: [[
                                        { type: 'checkbox', fixed: 'left' },  //左边选中框
                                        { field: '课程名称', width: 200, title: '课程名称', sort: true },
                                        { field: '课程编号', width: 200, title: '课程编号', sort: true },
                                        { field: '授课老师', width: 200, title: '授课老师', sort: true },
                                        { field: '教师编号', width: 200, title: '教师编号', sort: true },
                                        { field: '班级编号', width: 200, title: '班级编号', sort: true },
                                        { field: '班级名称', width: 200, title: '班级名称', sort: true },                                                                              
                                        { field: '学院', width: 200, title: '学院', sort: true },                                        
                                        { field: '职称', width: 200, title: '职称', sort: true },
                                        { field: '学院编号', title: '学院编号', sort: true, style: 'display:none' },
                                        { field: '职称编号', width: 100, title: '课程类型编号', sort: true, style: 'display:none' },
                                        { fixed: 'right', title: '操作', toolbar: '#barDemo', width: 250 }
                                    ]]
                                    , data: datas
                                    , page: true
                                    , limits: [10, 20, 25, 30, 35]
                                    , limit: 10,
                                    done: function () {
                                        //隐藏 学院编号、课程类型编号 两列
                                        $("[data-field='学院编号']").css('display', 'none');
                                        $("[data-field='职称编号']").css('display', 'none');
                                        $("[data-field='班级编号']").css('display', 'none');
                                        $("[data-field='教师编号']").css('display', 'none');
                                    }
                                });

                                table.on('toolbar(test)', function (obj) {     //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                                    var checkStatus = table.checkStatus(obj.config.id)
                                        , data = checkStatus.data; //获取选中的数据
                                    var oldData = obj.config.data;
                                    //console.log(data);
                                    switch (obj.event) {
                                        case 'add':
                                            layer.open({
                                                title: '添加老师',
                                                type: 2,
                                                area: ['800px', '500px'],
                                                content: 'add_teacher.aspx',
                                                btn: '添加',
                                                success: function (layero, index) {
                                                    iframeWindow = layero.find('iframe')[0].contentWindow;
                                                },    // success
                                                yes: function (index) {
                                                    var body = layui.layer.getChildFrame('body', index);

                                                    var _tid = iframeWindow.document.getElementById("tb_tid").value;
                                                    var _tname = iframeWindow.document.getElementById("tb_tname").value;
                                                    var _password = iframeWindow.document.getElementById("tb_password").value;
                                                    var _sex = iframeWindow.document.getElementById("tb_sex").value;
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


                                                    //console.log(oldData);
                                                    $.ajax({
                                                        type: 'post',
                                                        url: "add_teacher.ashx",
                                                        data: {
                                                            tid: _tid,
                                                            tname: _tname,
                                                            password: _password,
                                                            sex: _sex,
                                                            academy: _academy,
                                                            type: _type
                                                        },
                                                        success: function (result) {
                                                            layer.alert("添加成功", { icon: 1 }, function (index) {
                                                                var dataBak = [];
                                                                for (var i = 0; i < oldData.length; i++) {
                                                                    dataBak.push(oldData[i]);
                                                                }
                                                                dataBak.push({
                                                                    教师编号: _tid,
                                                                    教师名称: _tname,
                                                                    密码: _password,
                                                                    性别: _sex,
                                                                    学院: academyvalue,
                                                                    学院编号: _academy,
                                                                    职称: typevalue,
                                                                    职称编号: _type
                                                                });
                                                                bak = dataBak;
                                                                table.reload("demo", { data: dataBak });
                                                                //window.parent.location.reload();

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
                                                var _tid = [];
                                                var flag = true;
                                                var dataBak = [];
                                                for (var o in data) {
                                                    _tid.push(data[o].教师编号);
                                                }
                                                for (var o in oldData) {
                                                    flag = true;
                                                    for (var v in data) {
                                                        if (oldData[o].教师编号 == data[v].教师编号) {
                                                            flag = false;
                                                        }
                                                    }
                                                    if (flag) {
                                                        dataBak.push(oldData[o]);
                                                    }
                                                }
                                                bak = dataBak;
                                                console.log(dataBak);
                                                $.ajax({
                                                    type: 'post',
                                                    url: 'del_teacher_many.ashx',
                                                    data: {
                                                        tid: _tid
                                                    },
                                                    success: function (res) {
                                                        layer.alert("删除成功", { icon: 1 }, function (index) {
                                                            table.reload("demo", {
                                                                data: dataBak
                                                            });
                                                            //window.parent.location.reload();
                                                            layer.closeAll();
                                                        });
                                                    },
                                                    error: function (error) {
                                                        alert("删除失败");
                                                    }
                                                });
                                                layer.close(index);
                                            });
                                    };  //switch
                                });

                                table.on('tool(test)', function (obj) {
                                    data = obj.data;   //获取选中的数据
                                    layEvent = obj.event;
                                    if (layEvent == "edit") {
                                        layer.open({
                                            title: '老师修改',
                                            type: 2,
                                            area: ['800px', '500px'],
                                            content: 'edit_teacher.aspx',
                                            btn: '修改',
                                            success: function (layero, index) {
                                                iframeWindow = layero.find('iframe')[0].contentWindow;
                                                var body = layui.layer.getChildFrame('body', index);
                                                body.find("#tb_tid").val(data.教师编号);
                                                body.find("#tb_tname").val(data.教师名称);
                                                body.find("#tb_password").val(data.密码);
                                                body.find("#tb_sex").val(data.性别);
                                                body.find("#academy").val(data.学院编号);
                                                body.find("#type").val(data.职称编号);
                                                // 记得重新渲染表单 *** 很重要
                                                iframeWindow.layui.form.render();

                                            },    // success
                                            yes: function (index) {
                                                var body = layui.layer.getChildFrame('body', index);
                                                var _tid = iframeWindow.document.getElementById("tb_tid").value;
                                                var _tname = iframeWindow.document.getElementById("tb_tname").value;
                                                var _password = iframeWindow.document.getElementById("tb_password").value;
                                                var _sex = iframeWindow.document.getElementById("tb_sex").value;
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
                                                console.log(_type);
                                                console.log(typevalue);
                                                $.ajax({
                                                    type: 'post',
                                                    url: "edit_teacher.ashx",
                                                    data: {
                                                        tid: _tid,
                                                        tname: _tname,
                                                        password: _password,
                                                        sex: _sex,
                                                        academy: _academy,
                                                        type: _type
                                                    },
                                                    success: function (result) {
                                                        layer.alert("修改成功", { icon: 1 }, function (index) {
                                                            obj.update({
                                                                '教师编号': _tid,
                                                                '教师名称': _tname,
                                                                '学院': academyvalue,
                                                                '性别': _sex,
                                                                '职称': typevalue
                                                            });
                                                            for (var v in bak) {
                                                                if (bak[v].教师编号 == data.教师编号) {
                                                                    bak[v].学院 = academyvalue;
                                                                    bak[v].性别 = _sex;
                                                                    bak[v].职称 = typevalue;
                                                                    bak[v].学院编号 = _academy;
                                                                    bak[v].教师名称 = _tname;
                                                                    bak[v].职称编号 = _type;
                                                                }
                                                            }
                                                            //window.parent.location.reload();
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
                                            var tid = data["教师编号"];
                                            //将要删除的一行的tid传到del_course.ashx里
                                            $.ajax({
                                                type: 'post',
                                                url: "del_teacher.ashx",
                                                data: {
                                                    tid: tid
                                                },
                                                success: function (result) {
                                                    layer.alert("删除成功", { icon: 1 }, function (index) {
                                                        var databak = [];
                                                        for (var i in bak) {
                                                            if (bak[i].教师编号 != data.教师编号) {
                                                                databak.push(bak[i]);
                                                            }
                                                        }
                                                        bak = databak;  //重新给bak赋值
                                                        table.reload("demo", { data: databak });
                                                        //table.reload("demo", { data: oldData });                                                            
                                                        layer.closeAll();
                                                    });
                                                },
                                                error: function (error) {
                                                    alert("删除失败");
                                                    layer.close(index);
                                                }
                                            })
                                            layer.close(index);
                                        })
                                    }
                                    else if (layEvent == "detail") {

                                        layer.open({
                                            title: '课程详情',
                                            type: 2,
                                            area: ['800px', '600px'],
                                            content: 'detail_teacher.aspx',
                                            btn: '关闭',
                                            success: function (layero, index) {
                                                iframeWindow = layero.find('iframe')[0].contentWindow;
                                                var body = layui.layer.getChildFrame('body', index);
                                                body.find("#tb_tid").val(data.教师编号);
                                                body.find("#tb_tname").val(data.教师名称);
                                                body.find("#tb_password").val(data.密码);
                                                body.find("#tb_sex").val(data.性别);
                                                body.find("#academy").val(data.学院);
                                                body.find("#type").val(data.职称);

                                                // 记得重新渲染表单 *** 很重要
                                                iframeWindow.layui.form.render();

                                            },    // success
                                            yes: function (index) {
                                                layer.close(index);
                                            }  //yes
                                        }); //open
                                    }
                                    //标注选中样式
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
