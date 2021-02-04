<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="学籍成绩管理系统.main.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <link href="layui/css/layui.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
</head>
<script src="layui/layui.js"></script>
<body class="bgc">
    <div class="layui-row">
        <div class="head">
            <div class="logo">
                <img src="images/head.png" />
                <a href="../Login/About.aspx" style="position:absolute;right:200px;top:30px" >关于</a>
            </div>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-col-md3">&nbsp;</div>
        <div class="layui-col-md6">
            <div class="layui-row ">
                <ul class="layui-nav  nav_bgc" lay-filter="">

                    <div class="layui-col-md3">
                        <li class="layui-nav-item"><a class="color" href="">湖大新闻</a></li>
                    </div>
                    <div class="layui-col-md3">
                        <li class="layui-nav-item layui-this"><a class="color" href="">课程详情</a></li>
                    </div>
<%--                    <div class="layui-col-md3">
                        <li class="layui-nav-item"><a class="color" href="">大数据</a></li>
                    </div>

                    <div class="layui-col-md3">
                        <li class="layui-nav-item"><a class="color" href="">社区</a></li>
                    </div>--%>
                </ul>
            </div>
        </div>

        <div class="layui-col-md1">&nbsp;</div>
        <div class="btn_login layui-col-md2 " style="padding:10px">
            <button class="layui-btn" type="button"> <a href="../Login/ManagerLogin.aspx" >登录</a></button>
        </div>

        
    </div>
    <div class="layui-row">
        <div class="layui-carousel" id="test1">
            <div carousel-item>
                <div>
                    <img src="images/lb_1.jpg" class="lb_img" />
                </div>
                <div>
                    <img src="images/lb_2.jpg" class="lb_img" />
                </div>
                <div>
                    <img src="images/lb_3.jpg" class="lb_img" />
                </div>
            </div>
        </div>
    </div>
    <!-- 条目中可以是任意内容，如：<img src=""> -->


    <script>
        layui.use('carousel', function () {
            var carousel = layui.carousel;
            //建造实例
            carousel.render({
                elem: '#test1'
                , width: '100%' //设置容器宽度
                , arrow: 'always' //始终显示箭头
                //,anim: 'updown' //切换动画方式
            });
        });
    </script>
    <div class="layui_row">&nbsp;</div>
    <div class="layui-row">
        <div class="main ">
            <div class="layui-col-md2">&nbsp;</div>
            <div class="layui-col-md8">
                <div class="layui-row">
                    <span class="text_kecheng">全部课程</span>

                </div>

                <div class="layui-row">
                    <div class="layui-row ">
                        <div class="layui-col-md3 ">
                            <div class="layui-row ">
                                <div class="layui-col-md11">
                                    <div class="layui-row border">
                                        <div class="layui-col-md7 book_h">


                                            <a class="text_book" href="Course_Info.aspx?cid=hd201902005">离散数学</a>


                                        </div>
                                        <div class="layui-col-md5 book_h">
                                            <img src="../manager/imgs/离散数学.jpg" class="book_img" />
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-md1"></div>

                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="layui-row ">
                                <div class="layui-col-md11">
                                    <div class="layui-row border">
                                        <div class="layui-col-md7">
                                            <a class="text_book" href="Course_Info.aspx?cid=hd201902003">概率论与数理统计</a>
                                        </div>
                                        <div class="layui-col-md5">
                                            <img src="../manager/imgs/概率论与数理统计.jpg" class="book_img" />
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-md1"></div>

                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="layui-row ">
                                <div class="layui-col-md11">
                                    <div class="layui-row border">
                                        <div class="layui-col-md7">
                                            <a class="text_book" href="Course_Info.aspx?cid=hd201802004">计算机导论</a>
                                        </div>
                                        <div class="layui-col-md5">
                                            <img src="images/23549233-1_b_1.jpg" class="book_img" />
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-md1"></div>

                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="layui-row ">
                                <div class="layui-col-md11">
                                    <div class="layui-row border">
                                        <div class="layui-col-md7">
                                            <a class="text_book" href="Course_Info.aspx?cid=hd202002003">大数据分析与应用</a>
                                        </div>
                                        <div class="layui-col-md5">
                                            <img src="images/23955035-1_b_6.jpg" class="book_img" />
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-md1"></div>

                            </div>
                        </div>
                    </div>
                    <div class="layui-row">&nbsp;</div>
                    <div class="layui-row ">
                        <div class="layui-col-md3 ">
                            <div class="layui-row ">
                                <div class="layui-col-md11">
                                    <div class="layui-row border">
                                        <div class="layui-col-md7 book_h">


                                            <a class="text_book" href="Course_Info.aspx?cid=hd201902009">数字逻辑</a>


                                        </div>
                                        <div class="layui-col-md5 book_h">
                                            <img src="images/24021200-1_b_5.jpg" class="book_img" />
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-md1"></div>

                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="layui-row ">
                                <div class="layui-col-md11">
                                    <div class="layui-row border">
                                        <div class="layui-col-md7">
                                            <a class="text_book" href="Course_Info.aspx?cid=hd201902015">线性代数</a>
                                        </div>
                                        <div class="layui-col-md5">
                                            <img src="images/24175222-1_b_1.jpg" class="book_img" />
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-md1"></div>

                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="layui-row ">
                                <div class="layui-col-md11">
                                    <div class="layui-row border">
                                        <div class="layui-col-md7">
                                            <a class="text_book" href="Course_Info.aspx?cid=hd202002007">计算机组成原理</a>
                                        </div>
                                        <div class="layui-col-md5">
                                            <img src="../manager/imgs/计算机组成原理.jpg" class="book_img" />
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-md1"></div>

                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="layui-row ">
                                <div class="layui-col-md11">
                                    <div class="layui-row border">
                                        <div class="layui-col-md7">
                                            <a class="text_book" href="Course_Info.aspx?cid=hd201902017">大数据导论</a>
                                        </div>
                                        <div class="layui-col-md5">
                                            <img src="../manager/imgs/大数据导论.jpg" class="book_img" />
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-md1"></div>

                            </div>
                        </div>
                    </div>
                    <div class="layui-row">&nbsp;</div>

                    <div class="layui-row">
                        <div class="layui-col-md3">
                            <div class="layui-row ">
                                <div class="layui-col-md11">
                                    <div class="layui-row border book_h">
                                        <div class="layui-col-md4">&nbsp;</div>
                                        <div class="link">
                                            <a href="#">>>更多课程</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-md1"></div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md3">&nbsp;</div>
                    <div class="layui-col-md3">&nbsp;</div>
                    <div class="layui-col-md3">&nbsp;</div>
                </div>


            </div>
        </div>

        <div class="layui-col-md2">&nbsp;</div>

    </div>
    
    <div class="layui-row">
        <div class="foot-link">
            <div class="foot-link-1 f_14">
                <ul>
                    <li><a href="http://news.hubu.edu.cn/">
                        <img src="images/link-1.png" /><br/>
                        湖大新闻</a>

                    </li>
                    <li><a href="http://media.hubu.edu.cn/index/hddst.htm">
                        <img src="images/link-2.png" /><br/>
                        广播电视</a>

                    </li>
                    <li><a href="http://hubu.cuepa.cn/">
                        <img src="images/link-3.png" /><br/>
                        电子校报</a>

                    </li>
                    <li><a href="http://mailbox.hubu.edu.cn/">
                        <img src="images/link-4.png" /><br/>
                        校务信箱</a>

                    </li>

                </ul>


            </div>
        </div>
    </div>
    <div class="layui-row">
        <div class="bq ">
            <p>&nbsp; &nbsp;&nbsp;super.six.plus.one.com - 非常六加一团队制作</p>
        </div>
    </div>
</body>
</html>
