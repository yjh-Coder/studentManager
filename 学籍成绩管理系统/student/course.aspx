<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="course.aspx.cs" Inherits="学籍成绩管理系统.student.course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="layui/css/layui.css" rel="stylesheet" />
    <script src="layui/layui.js"></script>

</head>

<body>
    <form id="form1" runat="server">
        <div>
            <div class="demoTable">
                <div class="layui-inline">
                    <input class="layui-input" name="id" />
                </div>
            </div>
            <!-- 方法渲染-->
            <table id="demo" lay-filter="test"></table>
            <script type="text/html" id="barDemo">

                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="choose">选课</a>


            </script>
            <%--   自动渲染
             
1) 带有 class="layui-table" 的 <table> 标签。
2) 对标签设置属性 lay-data="" 用于配置一些基础参数
3) 在 <th> 标签中设置属性lay-data=""用于配置表头信息
            --%>
            <%--  <table class="layui-table" lay-data="{height:315,  page:true, id:'test'}" lay-filter="test">
                <thead>
                    <tr>
                        <th lay-data="{field:'id', width:80, sort: true}">ID</th>
                        <th lay-data="{field:'username', width:80}">用户名</th>
                        <th lay-data="{field:'sex', width:80, sort: true}">性别</th>
                        <th lay-data="{field:'city'}">城市</th>
                        <th lay-data="{field:'sign'}">签名</th>
                        <th lay-data="{field:'experience', sort: true}">积分</th>
                        <th lay-data="{field:'score', sort: true}">评分</th>
                        <th lay-data="{field:'classify'}">职业</th>
                        <th lay-data="{field:'wealth', sort: true}">财富</th>
                    </tr>
                </thead>
            </table>--%>
            <%--转换静态表格--%>
            <%--假设你的页面已经存在了一段有内容的表格，它由原始的table标签组成，这时你需要赋予它一些动态元素，比如拖拽调整列宽？比如排序等等？那么你同样可以很轻松地去实现。如下所示：--%>
            <%--<div id="page"></div>--%>
            <%-- <table lay-filter="demo">
                <thead lay-filter="demo3">
                    <tr>
                        <th lay-data="{field:'username', width:100}">昵称</th>
                        <th lay-data="{field:'experience', width:80, sort:true}">积分</th>
                        <th lay-data="{field:'sign'}">签名</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>贤心1</td>
                        <td>66</td>
                        <td>人生就像是一场修行a</td>
                    </tr>
                    <tr>
                        <td>贤心2</td>
                        <td>88</td>
                        <td>人生就像是一场修行b</td>
                    </tr>
                    <tr>
                        <td>贤心3</td>
                        <td>33</td>
                        <td>人生就像是一场修行c</td>
                    </tr>
                </tbody>
            </table>--%>
        </div>
    </form>
</body>
</html>
<script>
    //加载laypage
    //layui.use("laypage", function () {
    //    var laypage = layui.laypage;
    //加载laypage实例

    //    laypage.render({
    //        elem: "#page",//elem属性绑定的是容器的id属性值，不需加#
    //        count: 100,//一般从服务器获取
    //        limit: 5,//每页显示的数量
    //        limits: [5, 10, 20, 30],//每页条数选择框
    //        layout: ['prev', 'page', 'next', 'limit', 'count'],//自定义排版
    //        groups: 10,//连续显示的页码数
    //        page: true,
    //        jump: function (obj, first) {
    //            //obj包含了当前分页的所有参数，比如：
    //            console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
    //            console.log(obj.limit); //得到每页显示的条数

    //            //首次不执行
    //            if (!first) {
    //                //do something
    //            }
    //        }
    //    });
    //});
    //加载table
    layui.use("table", function () {
        var table = layui.table;
        //加载table实例
        table.render({
            elem: '#demo',//绑定id
            url: "jscript/user.json",
            page: true,

            cols: [[//标头 filed字段与数据一致
                { field: 'aa', type: 'numbers' },
                { field: 'cid', title: '课程编号', sort: true, width: 180 },
                { field: 'cname', title: '课程名称', sort: true, width: 180 },
                { field: 'academy', title: '学院', sort: true, width: 180 },

                { field: 'tname', title: '授课老师', sort: true, width: 180 },
                //设置表头工具栏
                { filed: "操作", toolbar: "#barDemo" }

            ]],

        })
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var tr = obj.data;
            var eventname = obj.event;
            if (eventname == 'choose') {
                layer.confirm("确认选择课程吗", function (index) {
                    obj.choose();
                    layer.close(index);
                });
            }
        })
        //监听头工具事件
        table.on('toolbar(test)', function (obj) {
            console.log(obj);
            //obj.config对象中获取id属性值，即表示当前id属性值 demo
            //获取当前表格被选中记录对象 返回数据
            //获取时间名
            var eventname = obj.event;
            //判断事件名，执行对应代码
            switch (eventname) {
                case "getCheckData":
                    var arr = checkStatus.data;
                    layer.alert(JSON.stringify(arr));
                    break;
            }
        })
    })
    ////配置项
    //table.init('demo3',//指layfileter
    //    {
    //        height: 315
    //    })
</script>
<%--默认注释快捷组合键
注释：
Ctrl+K → 选定需要注释的代码段 →Ctrl+C

取消注释：
Ctrl+K → 选定需要取消注释的代码段 →Ctrl+U--%>
