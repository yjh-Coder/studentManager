<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="学籍成绩管理系统.user.Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../Scripts/layui/css/layui.css" rel="stylesheet" />

    <link href="//at.alicdn.com/t/font_2115812_f44qzlk6wtm.css" rel="stylesheet" />
    <%--<script type="text/javascript" src="../manager/layui/dist/layui.js" />--%>
    <script type="text/javascript" src='<%=ResolveUrl("lib/list.js")%>'></script>
    <script type="text/javascript" src='<%=ResolveUrl("layui/layui.js")%>'></script>
    <script type="text/javascript" src='<%=ResolveUrl("../Scripts/jquery-3.4.1.min.js")%>'></script>

    <script type="text/javascript">

        $(function () {
            arry = new ArrayList();
            arry.append(11);
        });

        function exit() {
            $.ajax({
                url: 'exit.ashx',
                type: 'post',
                success: function (data) {
                    window.location.replace("../Login/ManagerLogin.aspx");
                },
                error: function (data) {
                    alert("服务器出错");
                    window.location.replace("../Login/ManagerLogin.aspx");
                }
            })
        }
    </script>
    <script type="text/javascript">
        layui.use('element', function () {
            var $ = layui.jquery
                , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

            var url1 = "course_manager.aspx";
            var url2 = "Edit_Personal_Information.aspx";
            var url3 = "teacher_manage.aspx";
            var url4 = "Student_Manage.aspx";
            var url5 = "distribute_course.aspx";
            var url6 = "system_switch";
            //触发事件
            var active = {
                tabAdd1: function () {
                    //新增一个Tab项
                    if (arry.find(11).value != 11) {
                        element.tabAdd('demo', {
                            title: '管理课程' //用于演示
                            , content: "<iframe src='" + url1
                                + "' frameborder='0' style='width:100%;height:700px;'></iframe>"
                            , id: 11 //实际使用一般是规定好的id，这里以时间戳模拟下
                        });
                        arry.append(11);
                        element.tabChange('demo', '11');
                    }
                },

                tabAdd2: function () {
                    //新增一个Tab项
                    if (arry.find(22).value != 22) {
                        element.tabAdd('demo', {
                            title: '修改个人信息' //用于演示
                            , content: "<iframe src='" + url2
                                + "' frameborder='0' style='width:100%;height:700px;'></iframe>"
                            , id: 22 //实际使用一般是规定好的id，这里以时间戳模拟下
                        });
                        arry.append(22);
                        element.tabChange('demo', '22');
                    }
                },
                tabAdd3: function () {
                    //新增一个Tab项
                    if (arry.find(33).value != 33) {
                        element.tabAdd('demo', {
                            title: '管理老师' //用于演示
                            , content: "<iframe src='" + url3
                                + "' frameborder='0' style='width:100%;height:700px;'></iframe>"
                            , id: 33 //实际使用一般是规定好的id，这里以时间戳模拟下
                        });
                        arry.append(33);
                        element.tabChange('demo', '33')
                    }
                },
                tabAdd4: function () {
                    //新增一个Tab项
                    if (arry.find(44).value != 44) {
                        element.tabAdd('demo', {
                            title: '管理学生' //用于演示
                            , content: "<iframe src='" + url4
                                + "' frameborder='0' style='width:100%;height:700px;'></iframe>"
                            , id: 44 //实际使用一般是规定好的id，这里以时间戳模拟下
                        });
                        arry.append(44);
                        element.tabChange('demo', '44')
                    }
                },
                tabAdd5: function () {
                    //新增一个Tab项
                    if (arry.find(55).value != 55) {
                        element.tabAdd('demo', {
                            title: '分配课程' //用于演示
                            , content: "<iframe src='" + url5
                                + "' frameborder='0' style='width:100%;height:700px;'></iframe>"
                            , id: 55 //实际使用一般是规定好的id，这里以时间戳模拟下
                        });
                        arry.append(55);
                        element.tabChange('demo', '55')
                    }
                },
                tabAdd6: function () {
                    //新增一个Tab项
                    if (arry.find(66).value != 66) {
                        element.tabAdd('demo', {
                            title: '系统开关' //用于演示
                            , content: "<iframe src='" + url6
                                + "' frameborder='0' style='width:100%;height:700px;'></iframe>"
                            , id: 66 //实际使用一般是规定好的id，这里以时间戳模拟下
                        });
                        arry.append(66);
                        element.tabChange('demo', '66')
                    }
                }

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

        function modal1(data) {
            layui.use('layer', function () {
                var layer = layui.layer;
                layer.open({
                    title: '选择课程',
                    type: 2,
                    area: ['900px', '550px'],
                    content: "distribute.aspx?data=" + escape(JSON.stringify(data)),
                    btn: ['分配'],
                    success: function (layero, index) {
                        iframeWindow = layero.find('iframe')[0].contentWindow;
                        
                    },
                    yes: function (index) {
                        var body = layui.layer.getChildFrame('body', index);
                        iframeWindow.document.getElementById("btnDistribute").click();
                    }
                });
            });
        }

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
                    <li class="layui-nav-item"><a href="javascript:exit()" rel="external nofollow">退出</a></li>
                </ul>
            </div>

            <div class="layui-side layui-bg-black">
                <div class="layui-side-scroll">
                    <ul class="layui-nav layui-nav-tree" lay-filter="test">
                        <li class="layui-nav-item layui-nav-itemed">
                            <a href="javascript:;">课程管理</a>
                            <dl class="layui-nav-child">
                                <dd>
                                    <button class="layui-btn site-demo-active layui-bg-black" data-type="tabAdd1" style="width: 100%"><i class="iconfont icon-guanli"></i><span>课程管理</span></button>

                                </dd>
                                <dd>
                                    <button class="layui-btn site-demo-active layui-bg-black" data-type="tabAdd5" style="width: 100%"><i class="iconfont icon-kechengbiao"></i><span>分配课程</span></button>
                                </dd>

                            </dl>
                        </li>
                        <li class="layui-nav-item layui-nav-itemed">
                            <a href="javascript:;">管理用户</a>
                            <dl class="layui-nav-child">
                                <dd>
                                    <button class="layui-btn site-demo-active layui-bg-black" data-type="tabAdd2" style="width: 100%"><i class="iconfont icon-xiugai-copy"></i><span>修改个人信息</span></button>

                                </dd>

                                <dd>
                                    <button class="layui-btn site-demo-active layui-bg-black" data-type="tabAdd3" style="width: 100%"><i class="iconfont icon-jiaolian1"></i><span>老师管理</span></button>
                                </dd>
                                <dd>
                                    <button class="layui-btn site-demo-active layui-bg-black" data-type="tabAdd4" style="width: 100%"><i class="iconfont icon-xuesheng"></i><span>学生管理</span></button>
                                </dd>
                                <dd>
                                    <button class="layui-btn site-demo-active layui-bg-black" data-type="tabAdd6" style="width: 100%"><i class="iconfont icon-B"></i><span>系统开关</span></button>
                                </dd>
                            </dl>
                        </li>
                    </ul>
                </div>
            </div>


            <!-- 主体部分   -->

            <div class="layui-body">
                <div class="layui-tab" lay-filter="demo" lay-allowclose="true">
                    <ul class="layui-tab-title">
                        <li class="layui-this" lay-id="11" id="11">管理课程</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <iframe src="course_manager.aspx" frameborder="0" style='width: 100%; height: 700px;'></iframe>
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
