<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="distribute.aspx.cs" Inherits="学籍成绩管理系统.manager.distribute" %>

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
        .selectData {
            height: 30px;
            width:150px;
            -webkit-border-radius: 0.5rem;
            border-radius: 0.5rem;
            background-color: #003366;
        }
        select {
            border: none;
            outline: none;
            line-height: 0.40rem;
            padding-left: 0.1rem;
            background: none;
            color: #ffffff;
            font-style: normal;
            font-weight: bold;
        }

        option {
            border: none;
            outline: none;
            background-color: #003366;
            color: #ffffff;
            font-weight: bold;
        }

         .hidden { display:none;}

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <label style="margin-left: 16%;margin-top:15px;">学院：</label>
        <asp:DropDownList ID="ddlAcademy" class="selectData" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="sdsAcademy" DataTextField="academy" DataValueField="academy" OnSelectedIndexChanged="ddlAcademy_SelectedIndexChanged"></asp:DropDownList>
        <asp:SqlDataSource ID="sdsAcademy" runat="server" ConnectionString="<%$ ConnectionStrings:asp.studentConnectionString %>" SelectCommand="SELECT [academy] FROM [academy]"></asp:SqlDataSource>
        <label style="margin-left: 5%;margin-top:15px;">课程类型：</label>
        <asp:DropDownList ID="ddlCourseType" class="selectData"  runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="sdsCourseType" DataTextField="coursetype" DataValueField="coursetype" OnSelectedIndexChanged="ddlCourseType_SelectedIndexChanged"></asp:DropDownList>
        <asp:SqlDataSource ID="sdsCourseType" runat="server" ConnectionString="<%$ ConnectionStrings:asp.studentConnectionString3 %>" SelectCommand="SELECT [coursetype] FROM [coursetype]"></asp:SqlDataSource>
        <br />
        <h1 style="color: turquoise; margin: 0px auto; text-align: center;">请选择课程</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cid" DataSourceID="sdsCourse" class="layui-table" AllowPaging="True" PageSize="5" Width="95%" Style="margin: 0px auto; margin-top: 4px;" ForeColor="#333333" CellPadding="4" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="cid" HeaderText="课程编号" ReadOnly="True" SortExpression="cid" />
                <asp:BoundField DataField="cname" HeaderText="课程名称" SortExpression="cname" />
                <asp:BoundField DataField="coursetype" HeaderText="课程类型" SortExpression="coursetype" />
                <asp:BoundField DataField="typeid" HeaderText="课程类型编号" SortExpression="typeid"  ItemStyle-CssClass="hidden" ShowHeader="False" HeaderStyle-CssClass="hidden" />
                <asp:BoundField DataField="credit" HeaderText="学分" SortExpression="credit" />
                <asp:BoundField DataField="academy" HeaderText="开设学院" SortExpression="academy" />
                <asp:TemplateField HeaderText="选择">
                    <ItemTemplate>
                    <asp:Button ID="btnSelectRow" class="layui-btn layui-btn-xs" runat="server" CommandArgument='<%# Eval("cid") %>' OnClick="btnSelectRow_Click" Text="选择" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" BorderColor="#9999FF" BorderStyle="Groove" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="sdsCourse" runat="server" ConnectionString="<%$ ConnectionStrings:asp.studentConnectionString %>" SelectCommand="select  cid,cname,coursetype,course.typeid as typeid,credit,academy
                            from course inner join 
                            coursetype on course.typeid = coursetype.typeid inner join 
                            academy on academy.academyid = course.academyid"></asp:SqlDataSource>
        <label style="margin-left: 1%;margin-top:15px;">选择待分配的专业：</label>
        <asp:DropDownList ID="ddlProfession" runat="server" style="margin-top:10px;" class="selectData" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="sdsProfession" DataTextField="profession" DataValueField="professionid" OnSelectedIndexChanged="ddlProfession_SelectedIndexChanged"></asp:DropDownList>
        <asp:SqlDataSource ID="sdsProfession" runat="server" ConnectionString="<%$ ConnectionStrings:asp.studentConnectionString %>" SelectCommand="SELECT [profession], [professionid] FROM [profession]"></asp:SqlDataSource>
        <label style="margin-left: 2%;margin-top:15px;">选择待分配的班级：</label>
        <asp:DropDownList ID="ddlClass" runat="server" style="margin-top:10px;" class="selectData" DataSourceID="sdsClass" DataTextField="classname" DataValueField="classid" AppendDataBoundItems="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="sdsClass" runat="server" ConnectionString="<%$ ConnectionStrings:asp.studentConnectionString %>" SelectCommand="SELECT [classname], [classid] FROM [class]"></asp:SqlDataSource>
         <label>请输入最多人数：</label><asp:TextBox ID="txtCount" runat="server" style="width:150px;"></asp:TextBox>
        <br />
       
        
        <asp:Button ID="btnDistribute" runat="server" Text="分配"  style="display:none;" OnClick="btnDistribute_Click" />
    </form>

    <script>
        function RequestParameter() {
            var url = window.location.search; //获取url中"?"符后的字串
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                var strs = str.split("&");
                for (var i = 0; i < strs.length; i++) {
                    theRequest[strs[i].split("=")[0]] = (strs[i].split("=")[1]);
                }
            }
            return theRequest;
        }

        var data = RequestParameter()["data"];
        var dd = JSON.parse(unescape(data));
        console.log(dd);
    </script>

</body>
</html>
