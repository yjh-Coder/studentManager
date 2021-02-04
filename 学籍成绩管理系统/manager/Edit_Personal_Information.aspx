<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit_Personal_Information.aspx.cs" Inherits="学籍成绩管理系统.manager.Edit_Personal_Information" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../Scripts/layui/css/layui.css" rel="stylesheet" />
    <link href="../Login/mdialogjs/mdialog.css" rel="stylesheet" />
    <script src="../Scripts/layui/layui.js"></script>
    <script type="text/javascript" src="../Login/mdialogjs/zepto.min.js"></script>
    <script type="text/javascript" src="../Login/mdialogjs/mdialog.js"></script>
    <style>
        .change_password {
            align-content: center;
            width: 800px;
            height: 320px;
            min-height: 320px;
            max-height: 320px;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            margin: auto;
        }

        .layui-input, .layui-textarea {
            display: block;
            width: 80%;
            padding-left: 10px;
        }
    </style>

    <script>
        function success() {
            new TipBox({ type: 'success', str: '修改成功！', hasBtn: true });
        };

        function error() {
            new TipBox({ type: 'error', str: '修改失败！', hasBtn: true });
        };

        function warn() {
            new TipBox({ type: 'error', str: '修改后的密码不能与修改前一致！', hasBtn: true });
        };

    </script>

</head>
<body>
    <form id="form1" class="layui-form" runat="server">
        <div class="change_password">
            <div class="layui-form-item">
                <label class="layui-form-label" style="width: 120px;">
                    旧密码:
                </label>
                <div class="layui-input-block" style="width: 300px;">
                    <asp:TextBox ID="tb_old_password" runat="server" type="password" name="old_password" required lay-verify="required" autocomplete="off" class="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="width: 120px;">
                    新密码:
                </label>
                <div class="layui-input-block" style="width: 300px;">
                    <asp:TextBox ID="tb_new_password" runat="server" type="password" name="new_password" required lay-verify="required" autocomplete="off" class="layui-input"></asp:TextBox>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-row">
                    <label class="layui-form-label" style="width: 120px;">
                        再次输入新密码:
                    </label>

                    <div class="layui-input-block" style="width: 480px;">

                        <div class="layui-col-xs6 layui-col-md6">
                            <asp:TextBox ID="tb_new_password_confirm" runat="server" type="password" name="new_password1" required lay-verify="required" autocomplete="off" class="layui-input" style="width:100%;"></asp:TextBox>
                        </div>
                        <div class="layui-col-xs6 layui-col-md5" style="margin-top:10px;">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次输入密码不一致" ControlToCompare="tb_new_password" ControlToValidate="tb_new_password_confirm" ForeColor="Red" ></asp:CompareValidator>
                        </div>
                    </div>

                </div>
            </div>
            <div class="">
                <asp:Button ID="btn_confirm" runat="server" Text="确认" lay-submit lay-filter="setmypass" class="layui-btn layui-btn-warm" Style="position: relative; left: 20%" OnClick="btn_confirm_Click" />
                <asp:Button ID="Button2" runat="server" Text="重置" class="layui-btn layui-btn-warm" Style="position: relative; left: 35%" />

            </div>
        </div>
    </form>
</body>
</html>
