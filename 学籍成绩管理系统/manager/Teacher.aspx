<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="学籍成绩管理系统.user.Teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link href="../layui/css/layui.css" rel="stylesheet" />


    <link href="../Scripts/layui/css/layui.css" rel="stylesheet" />
      <%--<script type="text/javascript" src="../manager/layui/dist/layui.js" />--%>
    <script type="text/javascript" src='<%=ResolveUrl("../lib/list.js")%>'></script>
    <script type="text/javascript" src='<%=ResolveUrl("../layui/layui.js")%>'></script>
     <script type="text/javascript">
         layui.use('element', function () {
             var $ = layui.jquery
                 , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
             var arry = new ArrayList();
            
             var url1 = "../admin_manager.aspx"
             var url2 ="../Edit_Personal_Information.aspx"
             //触发事件
             var active = {
                 tabAdd1: function () {
                     //新增一个Tab项
                     if (arry.find(11).value != 11) {
                         element.tabAdd('demo', {
                             title: '打分' //用于演示
                             , content: "<iframe src='" + url1
                                 + "' frameborder='0' style='width:100%;height:600px;'></iframe>"
                             , id: 11 //实际使用一般是规定好的id，这里以时间戳模拟下
                         });
                         arry.append(11);
                     }
                 },

                 tabAdd2: function () {
                     //新增一个Tab项
                     if (arry.find(22).value != 22) {
                         element.tabAdd('demo', {
                             title: '修改个人信息' //用于演示
                             , content: "<iframe src='" + url2
                                 + "' frameborder='0' style='width:100%;height:600px;'></iframe>"
                             , id: 22 //实际使用一般是规定好的id，这里以时间戳模拟下
                         });
                         arry.append(22);
                     }
                 },
                 tabAdd3: function () {
                     //新增一个Tab项
                     if (arry.find(33).value != 33) {
                         element.tabAdd('demo', {
                             title: '查看课程' //用于演示
                             , content: 'sdfsdfsdf'
                             , id: 33 //实际使用一般是规定好的id，这里以时间戳模拟下
                         });
                         arry.append(33);
                     }
                 },
                 
                 


             };

             $('.site-demo-active').on('click', function () {
                 var othis = $(this), type = othis.data('type');
                 active[type] ? active[type].call(this, othis) : '';
             });
             //监听选项卡是否被删除
             element.on('tabDelete', function (data) {
                 arry.removeAt(data.id);
             });



         });
     </script>
   
</head>
<body>
 
        <div>
             <div class="layui-layout layui-layout-admin">
            <div class="layui-header ">
                <div class="layui-logo">湖北大学学生成绩管理系统</div>
                <ul class="layui-nav layui-layout-right layui-bg-green">
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <img src="~/manager/imgs/logo.png" class="layui-nav-img" runat="server" />
                            非常6+1
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="">基本资料</a></dd>
                            <dd><a href="">安全设置</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item"><a href="../../Login/ManagerLogin.aspx">退出</a></li>
                </ul>
            </div>

            <div class="layui-side layui-bg-black" >
                <div class="layui-side-scroll">
                    <ul class="layui-nav layui-nav-tree" lay-filter="test">
                        <li class="layui-nav-item layui-nav-itemed">
                            <a href="javascript:;">教师</a>
                            <dl class="layui-nav-child">
                                <dd ><button class="layui-btn site-demo-active layui-bg-black" data-type="tabAdd1" style="width:100%" ><i class="iconfont icon-dafen">打分</i></button></dd>
                                <dd><button class="layui-btn site-demo-active layui-bg-black" data-type="tabAdd2"  style="width:100%"  ><i class="iconfont icon-xiugai-copy">修改个人信息</i></button></dd>
                                <dd><button class="layui-btn site-demo-active layui-bg-black" data-type="tabAdd3"style="width:100%"  ><i class="iconfont icon-chakan">查看课程</i></button></dd>
                               
                            </dl>
                        </li>
                    </ul>
                </div>
            </div>


            <!-- 主体部分   -->

    <div class="layui-body">
       <div class="layui-tab" lay-filter="demo" lay-allowclose="true">
    <ul class="layui-tab-title">
        <li class="layui-this" lay-id="11">网站设置</li>
        
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
           <img src="../../Login/images/老师.jpg" style="width:100%;height:530px;" />
        </div>
      
    </div>
</div>
</div>

            <div class="layui-footer">
                <!-- 底部固定区域 -->
                super.six.plus.one.com - 非常六加一团队制作
            </div>

        </div>
  </div>
   
   
</body>
</html>
