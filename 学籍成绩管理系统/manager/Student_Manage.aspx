<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Manage.aspx.cs" Inherits="学籍成绩管理系统.manager.Student_Manage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

        <link href="../Scripts/layui/css/layui.css" rel="stylesheet" />
    <link href="lib/build/css/app.css" rel="stylesheet" />
    <link href="../Login/mdialogjs/mdialog.css" rel="stylesheet" />
    <script src="layui/layui.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Login/mdialogjs/zepto.min.js"></script>
    <script type="text/javascript" src="../Login/mdialogjs/mdialog.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" class="layui-form">
         <div class="layui-layout layui-layout-admin">

                <div class="layui-form-item" style="margin-bottom: 0px;">
                    <div class="layui-input-inline">
                        <select name="list" lay-filter="aihao" lay-verify="required">
                            <option value="0">全部</option>
                            <option value="1">学生学号</option>
                            <option value="2">学生姓名</option>
                            
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="search" class="layui-input" />
                    </div>
                    <div class="layui-input-inline">
                        <asp:Button ID="btn_search" runat="server" class="layui-btn layui-btn-green" Text="查询" OnClick="btn_search_Click" />
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
                                '学号': '<%#Eval("sno")%>',
                                '姓名': '<%#Eval("sname")%>',
                                '密码': '<%#Eval("password")%>',
                                '性别': '<%#Eval("sex")%>',
                                '班级': '<%#Eval("classname")%>',
                                '班级编号': '<%#Eval("classid")%>',
                                '学院': '<%#Eval("academy")%>',
                                '学院编号': '<%#Eval("academyid")%>',
                                '身份证': '<%#Eval("identication")%>',
                                '入学时间': '<%#Eval("enrollment_year")%>',
                                '专业': '<%#Eval("profession")%>',
                                '专业编号': '<%#Eval("professionid")%>',
                            })
                        </script>
                    </ItemTemplate>
                    <FooterTemplate>
                        <table class="layui-hide" id="demo" lay-filter="test"></table>
                        <script type="text/html" id="tbToolBar" >            <%--自定义左边添加按钮--%>
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
                                    var bak = datas;
                                    form.render();
                                    table.render({
                                        elem: '#demo'
                                        , title: '用户数据表'
                                        , toolbar: '#tbToolBar'
                                        , cols: [[
                                            { type: 'checkbox', fixed: 'left' },  //左边选中框
                                            { field: '学号', width: 120, title: '学号', sort: true, totalRowText: '合计' },
                                            { field: '姓名', width: 100, title: '姓名', sort: true },
                                            { field: '性别', width: 100, title: '性别', sort: true },
                                            { field: '班级', width: 100, title: '班级', sort: true },
                                            { field: '班级编号', title: '班级编号', sort: true, style: 'display:none' },
                                            { field: '学院', width: 160, title: '学院', sort: true },
                                            { field: '学院编号', title: '学院编号', sort: true, style: 'display:none' },
                                            { field: '身份证', width: 160, title: '身份证', sort: true },
                                            { field: '入学时间', width: 130, title: '入学时间', sort: true },
                                            { field: '专业', title: '专业', width: 160, sort: true },
                                            { field: '专业编号', title: '专业编号', sort: true, style: 'display:none' },
                                            { fixed: 'right', title: '操作', toolbar: '#barDemo', width: 220 }
                                        ]]
                                        , data: datas
                                        , page: true
                                        , limits: [10, 20, 25, 30, 35]
                                        , limit: 10,
                                        done: function () {
                                            //隐藏 学院编号、课程类型编号 两列
                                            //$("[data-field='班级']").css('display', 'none');
                                            //$("[data-field='学院']").css('display', 'none');
                                            //$("[data-field='专业']").css('display', 'none');

                                            $("[data-field='学院编号']").css('display', 'none');
                                            $("[data-field='班级编号']").css('display', 'none');
                                            $("[data-field='专业编号']").css('display', 'none');
                                            
                                        }
                                    });

                                    table.on('toolbar(test)', function (obj) {     //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                                        console.log(obj);
                                        var checkStatus = table.checkStatus(obj.config.id)
                                            , data = checkStatus.data; //获取选中的数据
                                        var oldData = obj.config.data;
                                        switch (obj.event) {
                                            case 'add':
                                                layer.open({
                                                    title: '添加学生',
                                                    type: 2,
                                                    area: ['800px', '500px'],
                                                    content: 'add_student.aspx',
                                                    btn: '添加',
                                                    success: function (layero, index) {
                                                        iframeWindow = layero.find('iframe')[0].contentWindow;
                                                    },    // success
                                                    yes: function (index) {
                                                        var body = layui.layer.getChildFrame('body', index);

                                                        var _sno = iframeWindow.document.getElementById("tb_sno").value;
                                                        var _sname = iframeWindow.document.getElementById("tb_sname").value;
                                                        var _password = iframeWindow.document.getElementById("tb_password").value;
                                                        var sex = iframeWindow.document.getElementById("sex").value;
                                                      

                                                        var classname = iframeWindow.document.getElementById("classname");
                                                        var index1 = classname.selectedIndex;
                                                        var _classname = classname.options[index1].value;
                                                        var classvalue = classname.options[index1].text;

                                                        var academy = iframeWindow.document.getElementById("academy");
                                                        var index2 = academy.selectedIndex;
                                                        var _academy = academy.options[index2].value;
                                                        var academyvalue = academy.options[index2].text;

                                                        var _identication = iframeWindow.document.getElementById("tb_identication").value;
                                                        var _enrollment_year = iframeWindow.document.getElementById("tb_enrollment_year").value;

                                                        var profession = iframeWindow.document.getElementById("profession");
                                                        var index3 = profession.selectedIndex;
                                                        var _profession = profession.options[index3].value;
                                                        var professionvalue = profession.options[index3].text;

                                                        $.ajax({
                                                            type: 'post',
                                                            url: "add_student.ashx",
                                                            data: {
                                                                sno: _sno,
                                                                sname: _sname,
                                                                password: _password,
                                                                sex: sex,
                                                                classname: _classname,
                                                                academy: _academy,
                                                                identication: _identication,
                                                                enrollment_year: _enrollment_year,
                                                                profession: _profession
                                                            },
                                                            success: function (result) {
                                                                layer.alert("添加成功", { icon: 1 }, function (index) {
                                                                    var dataBak = [];
                                                                    for (var i = 0; i < oldData.length; i++) {
                                                                        dataBak.push(oldData[i]);
                                                                    }
                                                                    dataBak.push({
                                                                        学号: _sno,
                                                                        姓名: _sname,
                                                                        密码: _password,
                                                                        性别: _sex,
                                                                        班级: classvalue,
                                                                        班级编号: _classname,
                                                                        学院: academyvalue,
                                                                        学院编号: _academy,
                                                                        身份证: _identication,
                                                                        入学时间: _enrollment_year,
                                                                        专业: professionvalue,
                                                                        专业编号: _profession
                                                                    });
                                                                    bak = dataBak;
                                                                    table.reload("demo", { data: dataBak });
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
                                                    var _sno = [];
                                                    for (var o in data) {
                                                        _sno.push(data[o].学号);
                                                    }
                                                    var dataBak = [];
                                                    for (var o in oldData) {
                                                        flag = true;
                                                        for (var v in data) {
                                                            if (oldData[o].学号 == data[v].学号) {
                                                                flag = false;
                                                            }
                                                        }
                                                        if (flag) {
                                                            dataBak.push(oldData[o]);
                                                        }
                                                    }
                                                    bak = dataBak;
                                                    $.ajax({
                                                        type: 'post',
                                                        url: 'del_student_many.ashx',
                                                        data: {
                                                            sno: _sno
                                                        },
                                                        success: function (res) {
                                                            layer.alert("删除成功", { icon: 1 }, function (index) {
                                                                table.reload("demo", {
                                                                    data: dataBak
                                                                });
                                                                layer.closeAll();
                                                            });
                                                        },
                                                        error: function () {
                                                            alert("删除失败");
                                                        }
                                                    });
                                                   
                                                });                                          
                                        };
                                    });

                                    table.on('tool(test)', function (obj) {
                                        data = obj.data;   //获取选中的数据
                                        layEvent = obj.event;
                                        if (layEvent == "edit") {
                                            layer.open({
                                                title: '学生信息修改',
                                                type: 2,
                                                area: ['800px', '500px'],
                                                content: 'edit_student.aspx',
                                                btn: '修改',
                                                success: function (layero, index) {
                                                    console.log(data);
                                                    iframeWindow = layero.find('iframe')[0].contentWindow;
                                                    var body = layui.layer.getChildFrame('body', index);
                                                    body.find("#tb_sno").val(data.学号);
                                                    body.find("#tb_sname").val(data.姓名);
                                                    body.find("#tb_password").val(data.密码);
                                                   
                                                    if (data.性别 == "男") {
                                                        body.find("#sex").val(1);
                                                    }
                                                    else {
                                                        body.find("#sex").val(2);
                                                    }
                                                    body.find("#classname").val(data.班级编号);
                                                    body.find("#academy").val(data.学院编号);
                                                    body.find("#tb_identication").val(data.身份证);
                                                    body.find("#tb_enrollment_year").val(data.入学时间);
                                                    body.find("#profession").val(data.专业编号);
                                                  
                                                    // 记得重新渲染表单 *** 很重要
                                                    iframeWindow.layui.form.render();
                                                    

                                                },    // success
                                                yes: function (index) {
                                                    var body = layui.layer.getChildFrame('body', index);
                                                    var _sno = iframeWindow.document.getElementById("tb_sno").value;
                                                    var _sname = iframeWindow.document.getElementById("tb_sname").value;
                                                    var _password = iframeWindow.document.getElementById("tb_password").value;
                                                    var sex = iframeWindow.document.getElementById("sex");
                                                    var index = sex.selectedIndex;
                                                    var _sex = sex.options[index].value;
                                                    var sexvalue = sex.options[index].text;

                                                    var classname = iframeWindow.document.getElementById("classname");
                                                    var index2 = classname.selectedIndex;
                                                    var _classname = classname.options[index2].value;
                                                    var classnamevalue = classname.options[index2].text;

                                                    var academy = iframeWindow.document.getElementById("academy");
                                                    var index1 = academy.selectedIndex;
                                                    var _academy = academy.options[index1].value;

                                                    var academyvalue = academy.options[index1].text;

                                                    var profession = iframeWindow.document.getElementById("profession");
                                                    var index2 = profession.selectedIndex;
                                                    var _profession = profession.options[index2].value;
                                                    var professionvalue = profession.options[index2].text;

                                                    var _enrollment_year = iframeWindow.document.getElementById("tb_enrollment_year").value;
                                                    var _identication = iframeWindow.document.getElementById("tb_identication").value;
                                                  
                                                    $.ajax({
                                                        type: 'post',
                                                        url: "edit_student.ashx",
                                                        data: {
                                                            sno: _sno,
                                                            sname: _sname,
                                                            password: _password,
                                                            sex: _sex,
                                                            classname: _classname,
                                                            academy: _academy,
                                                            identication: _identication,
                                                            enrollment_year: _enrollment_year,
                                                            profession: _profession
                                                        },
                                                        success: function (result) {
                                                            layer.alert("修改成功", { icon: 1 }, function (index) {

                                                                obj.update({
                                                                    '学号': _sno,
                                                                    '姓名': _sname,
                                                                    '性别': sexvalue,
                                                                    '班级': classnamevalue,
                                                                    '班级编号': _classname,
                                                                    '学院': academyvalue,
                                                                    '学院编号': _academy,
                                                                    '身份证': _identication,
                                                                    '入学时间': _enrollment_year,
                                                                    '专业': professionvalue,
                                                                    '专业编号': _profession
                                                                });

                                                                //table.reload("demo");
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
                                                var _sno = data["学号"];
                                                //将要删除的一行的cid传到del_course.ashx里
                                                $.ajax({
                                                    type: 'post',
                                                    url: "del_student.ashx",
                                                    data: {
                                                        sno: _sno
                                                    },
                                                    success: function (result) {
                                                        layer.alert("删除成功", { icon: 1 }, function (index) {
                                                            obj.del();
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
                                                content: 'detail_student.aspx',
                                                btn: '关闭',
                                                success: function (layero, index) {
                                                    iframeWindow = layero.find('iframe')[0].contentWindow;
                                                    var body = layui.layer.getChildFrame('body', index);
                                                    body.find("#tb_sno").val(data.学号);
                                                    body.find("#tb_sname").val(data.姓名);
                                                    body.find("#tb_password").val(data.密码);
                                                    body.find("#sex").val(data.性别);
                                                    body.find("#classname").val(data.班级);
                                                    body.find("#academy").val(data.学院);
                                                    body.find("#tb_identication").val(data.身份证);
                                                    body.find("#tb_enrollment_year").val(data.入学时间);
                                                    body.find("#profession").val(data.专业);
                                                 

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

     <script type="text/javascript">
         layui.use(['element','form'], function () {
             var element = layui.element,
             form = layui.form;
         });
     </script>
</body>
</html>
