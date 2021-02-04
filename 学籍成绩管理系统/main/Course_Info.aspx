<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course_Info.aspx.cs" Inherits="学籍成绩管理系统.main.Course_Info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>课程详情</title>
    <link href="../Scripts/layui/css/layui.css" rel="stylesheet" />
    <link href="../Content/Site.css" rel="stylesheet" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.js" type="text/javascript"></script>
    <script src="../Scripts/layui/layui.js"></script>
    <link href="css/main.css" rel="stylesheet" />

    <style>
        .layui-form-label {
            width: 120px;
        }

        body {
            padding-top: 0px;
            padding-bottom: 0px;
        }

        #course {
            background-color: white;
            align-content: center;
            /*            margin-left: 35%;
            margin-top: 20%;*/
            width: 900px;
            height: 500px;
            position: absolute;
            top: 20%;
            left: 0;
            bottom: 0;
            right: 0;
            margin: auto;
            padding: 20px;
            z-index: 130;
            border-radius: 20px;
            background-color: #fff;
            box-shadow: 0 3px 18px rgba(100, 0, 0, .5);
            font-size: 16px
        }

        .img {
        }
    </style>
</head>
<body class="">


    <form id="form1" class="layui-form" runat="server">

        <div class="layui-row">
            <div class="head">
                <div class="logo">
                    <img src="images/head.png" />

                </div>
            </div>
        </div>


        <div class="layui-row" id="course">
            <div class="lauui-col-xs12 layui-col-md6">
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        课程号:
                    </label>
                    <div class="layui-input-block" style="width: 300px;">
                        <asp:TextBox ID="tb_cid" runat="server" name="cid" lay-verify="required" autocomplete="off" ReadOnly class="layui-input"></asp:TextBox>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">
                        课程名:
                    </label>
                    <div class="layui-input-block" style="width: 300px;">
                        <asp:TextBox ID="tb_cname" runat="server" name="cname" lay-verify="required" autocomplete="off" ReadOnly placeholder="请输入课程名" class="layui-input"></asp:TextBox>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">课程学分:</label>
                    <div class="layui-input-block" style="width: 300px;">
                        <asp:TextBox ID="tb_credit" runat="server" name="credit" lay-verify="required" placeholder="请输入课程学分" ReadOnly autocomplete="off" class="layui-input"></asp:TextBox>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">课程学时:</label>
                    <div class="layui-input-block" style="width: 300px;">
                        <asp:TextBox ID="tb_hour" runat="server" lay-verify="required" name="hour" placeholder="请输入课程学时" ReadOnly autocomplete="off" class="layui-input"></asp:TextBox>
                    </div>

                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">课程类型:</label>
                    <asp:TextBox ID="type" runat="server" autocomplete="off" ReadOnly class="layui-input"></asp:TextBox>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">学院:</label>
                    <div class="layui-input-block" style="width: 300px;">
                        <asp:TextBox ID="academy" runat="server" lay-verify="required" name="academy" ReadOnly autocomplete="off" class="layui-input"></asp:TextBox>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">开课时间:</label>
                    <div class="layui-input-block" style="width: 300px;">
                        <asp:TextBox ID="tb_begintime" runat="server" class="layui-input" ReadOnly name="begin_time" placeholder="yyyy-MM-dd" autocomplete="off"></asp:TextBox>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">结课时间:</label>
                    <div class="layui-input-block" style="width: 300px;">
                        <asp:TextBox ID="tb_endtime" runat="server" class="layui-input" ReadOnly name="end_time" placeholder="yyyy-MM-dd" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="layui-col-xs6 layui-col-md6">
                <div class="layui-form-item layui-form-text" style="margin-top:30%;">
                    <div class="imgCard layui-input-block">
                        <div class="imgWrap">
                            <%-- <div class="uploadText">
                        <input type="file" name="img" class="inputImg" accept="imgs/*" onchange="uploadImg(this)" />
                    </div>--%>

                            <asp:Image ID="image" runat="server" />
                        </div>
                        <%--                <button class="layui-btn delete" onclick="deletePic(this)">删除</button>--%>
                    </div>
                </div>
            </div>



        </div>


        <script>
            function uploadImg(obj) {          //上传图片
                var file = obj.files[0];
                var obj = $(obj);
                var img = obj.parent().next();
                var uploadBtn = obj.next();
                console.log(file);
                document.getElementById("img_name").value = file["name"];
                console.log(file["name"]);
                // console.log("file.size:"+file.size);
                var reader = new FileReader();
                reader.onloadstart = function (e) {

                }
                reader.onload = function (e) {
                    console.log(this);
                    uploadBtn.hide();
                    img.attr('src', e.target.result);
                }
                reader.readAsDataURL(file);
            }

            function deletePic(obj) {
                var obj = $(obj);
                console.log(obj);
                var img = obj.siblings('.imgWrap').children('img');
                var uploadBtn = obj.siblings('.imgWrap').find('button');
                img.attr('src', ' ');
                uploadBtn.show();
            }

        </script>


        <script>
            layui.use(['form', 'layedit', 'laydate'], function () {
                var form = layui.form
                    , layer = layui.layer
                    , layedit = layui.layedit
                    , laydate = layui.laydate;

                ////墨绿主题
                //laydate.render({
                //    elem: '#tb_begintime'
                //    , theme: 'molv'
                //});
                //laydate.render({
                //    elem: '#tb_endtime'
                //    , theme: 'molv'
                //});


                //创建一个编辑器
                var editIndex = layedit.build('LAY_demo_editor');

                //自定义验证规则
                form.verify({
                    title: function (value) {
                        if (value.length < 5) {
                            return '标题至少得5个字符啊';
                        }
                    }
                    , pass: [/(.+){6,12}$/, '密码必须6到12位']
                    , content: function (value) {
                        layedit.sync(editIndex);
                    }
                });
                form.render();
            });
        </script>
    </form>
</body>
</html>
