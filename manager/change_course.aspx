<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="change_course.aspx.cs" Inherits="学籍成绩管理系统.manager.change_course" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>课程修改</title>
    <link href="layui/css/layui.css" rel="stylesheet" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="../Content/Site.css" rel="stylesheet" />
    <link href="../Login/mdialogjs/mdialog.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.js" type="text/javascript"></script>
    <script src="../Login/layui/layui.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Login/mdialogjs/zepto.min.js"></script>
    <script type="text/javascript" src="../Login/mdialogjs/mdialog.js"></script>


    <style>
        .layui-form-label {
            width: 110px;
        }
    </style>


    <script>
        function error() {
            new TipBox({ type: 'error', str: '修改失败！', hasBtn: true });
        }

        function success() {
            new TipBox({ type: 'success', str: '修改成功！', hasBtn: true });
        }

    </script>



</head>
<body>
    <form class="layui-form" id="form1" runat="server">

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
                <asp:TextBox ID="tb_cname" runat="server" name="cname" lay-verify="required" autocomplete="off" placeholder="请输入课程名" class="layui-input"></asp:TextBox>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">课程学分:</label>
            <div class="layui-input-block" style="width: 300px;">
                <asp:TextBox ID="tb_credit" runat="server" name="credit" lay-verify="required" placeholder="请输入课程学分" autocomplete="off" class="layui-input"></asp:TextBox>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">课程学时:</label>
            <div class="layui-input-block" style="width: 300px;">
                <asp:TextBox ID="tb_hour" runat="server" lay-verify="required" name="hour" placeholder="请输入课程学时" autocomplete="off" class="layui-input"></asp:TextBox>
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">课程类型:</label>
            <div class="layui-input-block" style="width: 300px;">
                <select name="select_type" class="select_type" lay-filter="aihao">
                    <option>请选择</option>
                    <option value="1">专业必修课</option>
                    <option value="2">公共选修课</option>
                    <option value="3">专业选修课</option>
                    <option value="4">通识教育平台必修课</option>
                    <option value="5">学科大类课</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学院:</label>
            <div class="layui-input-block" style="width: 300px;">
                <select name="select_academy" class="select_academy" lay-filter="aihao">
                    <option>请选择</option>
                    <option value="1">计算机与信息工程学院</option>
                    <option value="2">数学与统计学院</option>
                    <option value="3">体育学院</option>
                    <option value="4">文学院</option>
                    <option value="5">教育学院</option>
                    <option value="6">艺术学院</option>
                    <option value="7">材料科学与工程学院</option>
                    <option value="8">生命科学学院</option>
                    <option value="9">新闻传播学院</option>
                    <option value="10">历史文化学院</option>
                    <option value="11">经济学院</option>
                    <option value="12">商学院</option>
                    <option value="13">政法学院</option>
                    <option value="14">外国语学院</option>
                    <option value="15">哲学</option>
                    <option value="16">物理与电子科学学院</option>
                    <option value="17">化学化工学院</option>
                    <option value="18">资源环境学院</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">开课时间:</label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="tb_begintime" runat="server" class="layui-input" name="begin_time" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">结课时间:</label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="tb_endtime" runat="server" class="layui-input" name="end_time" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off"></asp:TextBox>
                </div>
            </div>
        </div>

<%--        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">课程封面:</label>
            <div class="imgCard layui-input-block">
                <div class="imgWrap">
                    <div class="uploadText">
                        <input type="file" name="img" class="inputImg" accept="image/*" onchange="uploadImg(this)" />
                    </div>

                    <img src="" class="img" alt="" />
                </div>
                <button class="layui-btn delete" onclick="deletePic(this)">删除</button>

            </div>
        </div>--%>
<%--        <div class="layui-form-item layui-form-text" style="margin-left: 120px; padding-top: 50px;">

            <asp:Button ID="btn_submit" runat="server" Text="提交" OnClick="btn_submit_Click" class="layui-btn" />
            <button type="reset" class="layui-btn" style="position: relative; left: 200px;">重置</button>
        </div>
        <input type="hidden" value="" id="hidden_academy" />
        <input type="hidden" value="" id="hidden_type" />--%>

        <script src="layui/layui.js" type="text/javascript"></script>
<%--        <script>
            function uploadImg(obj) {          //上传图片
                var file = obj.files[0];
                var obj = $(obj);
                var img = obj.parent().next();
                var uploadBtn = obj.next();
                console.log(file);
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
            }--%>

<%--            function deletePic(obj) {
                var obj = $(obj);
                console.log(obj);
                var img = obj.siblings('.imgWrap').children('img');
                var uploadBtn = obj.siblings('.imgWrap').find('button');
                img.attr('src', ' ');
                uploadBtn.show();
            }--%>

<%--</script>--%>
        <script>
            layui.use(['form', 'layedit', 'laydate'], function () {
                var form = layui.form
                    , layer = layui.layer
                    , layedit = layui.layedit
                    , laydate = layui.laydate;

                //墨绿主题
                laydate.render({
                    elem: '#tb_begintime'
                    , theme: 'molv'
                });
                laydate.render({
                    elem: '#tb_endtime'
                    , theme: 'molv'
                });


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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=.;Initial Catalog=asp.student;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [cid], [cname], [credit], [hour], [begintime], [endtime], [academyid], [typeid], [img] FROM [course] WHERE ([cid] = @cid)">
            <SelectParameters>
                <asp:QueryStringParameter Name="课程号" QueryStringField="cid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>


    </form>
</body>
</html>

