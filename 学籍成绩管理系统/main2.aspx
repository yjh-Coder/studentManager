<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main2.aspx.cs" Inherits="学籍成绩管理系统.main.main2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="main/layui/css/layui.css" rel="stylesheet" />
    <link href="main/css/main.css" rel="stylesheet" />
    <link href="//at.alicdn.com/t/font_2115812_zma02o8mnz.css" rel="stylesheet" />
    <script src="Scripts/layui/layui.js"></script>
    <style>
        li {
            margin-top: 15px;
        }
    </style>
</head>
<body class="bgc">

    <div class="head" style="height: 90px">
        <div class="logo">
            <img src="main/images/head.png" />
        </div>
    </div>

    <div class="layui-container main-bg">
        <div>
            <div style="margin-top: 2px;">
                <span class="layui-breadcrumb" lay-separator="|">
                    <a href="" style="margin-top: 20px;">湖大新闻</a>
                    <a href="" style="margin-top: 20px;">课程详情</a>


                </span>
                <button class="layui-btn layui-btn-radius layui-btn-normal" type="button" style="float: right; margin-right: 5%; margin-bottom: 2px;"><a href="../Login/About.aspx"><i class="iconfont icon-guanyu"></i><span>关于</span></a></button>
                <button class="layui-btn layui-btn-radius layui-btn-normal" type="button" style="float: right; margin-right: 1%; margin-bottom: 2px;"><a href="../Login/ManagerLogin.aspx"><i class="iconfont icon-icon"></i><span>登录</span></a></button>

            </div>


        </div>
        <div class="layui-row">
            <div class="layui-carousel" id="test1">
                <div carousel-item>
                    <div>
                        <img src="main/images/lb_1.jpg" class="lb_img" />
                    </div>
                    <div>
                        <img src="main/images/lb_2.jpg" class="lb_img" />
                    </div>
                    <div>
                        <img src="main/images/lb_3.jpg" class="lb_img" />
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
        <div class="layui-row">&nbsp;</div>
        <div class="main">
            <div class="layui-row">


                <div class="layui-col-md7 layui-col-sm7 news">
                    <div class="layui-row">
                        <div class="layui-col-md4 layui-col-sm4 tit_bgc">
                            <div class="u_tit">新闻动态</div>
                        </div>
                        <div class="u_more_new layui-col-md8 layui-col-sm8">
                            <a class="u_more" href="index/xwdt.htm">更多&gt;&gt;</a>
                        </div>
                    </div>
                    <div class="layui-row">
                        <div class="layui-col-md4 layui-col-sm4">
                            <img src="main/images/news.png" class="new_img" />
                        </div>
                        <div class="layui-col-md8 layui-col-sm8">
                            <ul class="m_list_box">
                                <li>
                                    <a title="重庆社会问题研究所一行来访进行座谈" class="list_a" href="info/1117/6402.htm" target="_blank">重庆社会问题研究所一行来访进行座谈</a>
                                    <span class="list_date">[2020-10-26]</span>
                                </li>

                                <li>
                                    <a title="中国社会科学院拉美所研究员徐世澄举行线上讲座" class="list_a" href="info/1117/6401.htm" target="_blank">中国社会科学院拉美所研究员徐世澄举行线上讲座</a>
                                    <span class="list_date">[2020-10-26]</span>
                                </li>

                                <li>
                                    <a title="我院周德钧教授在《湖北日报》撰文被“学习强国”湖北学习平台收录" class="list_a" href="info/1117/6391.htm" target="_blank">我院周德钧教授在《湖北日报》撰文被“学习强...</a>
                                    <span class="list_date">[2020-10-16]</span>
                                </li>

                                <li>
                                    <a title="历史文化学院研究生新生见面会举行" class="list_a" href="info/1117/6389.htm" target="_blank">历史文化学院研究生新生见面会举行</a>
                                    <span class="list_date">[2020-10-15]</span>
                                </li>

                                <li>
                                    <a title="“荆楚卓越教师协同育人计划”训练营教学技能比赛圆满举行" class="list_a" href="info/1117/6392.htm" target="_blank">“荆楚卓越教师协同育人计划”训练营教学技能...</a>
                                    <span class="list_date">[2020-10-14]</span>
                                </li>

                                <li>
                                    <a title="熊兴老师获批亚洲基金会2020年度东亚合作系列讲座计划项目" class="list_a" href="info/1117/6383.htm" target="_blank">熊兴老师获批亚洲基金会2020年度东亚合作系列...</a>
                                    <span class="list_date">[2020-10-08]</span>
                                </li>

                                <li>
                                    <a title="四川师范大学历史文化与旅游学院院长汪洪亮一行来访" class="list_a" href="info/1117/6381.htm" target="_blank">四川师范大学历史文化与旅游学院院长汪洪亮一...</a>
                                    <span class="list_date">[2020-10-02]</span>
                                </li>

                                <li>
                                    <a title="文博专业师生学习习近平总书记在中央政治局第二十三次集体学习的重要讲话" class="list_a" href="info/1117/6382.htm" target="_blank">文博专业师生学习习近平总书记在中央政治局第...</a>
                                    <span class="list_date">[2020-10-02]</span>
                                </li>

                            </ul>
                        </div>

                    </div>
                </div>

                <div class="layui-col-md5  layui-col-sm5 corse">
                    <div class="layui-row">
                        <div class="layui-row">
                            <div class="u_tz_tit">
                                课程
                            </div>
                        </div>
                        <div class="layui-row">
                            <div class="layui-row">
                                <div class="layui-col-md4 layui-col-sm4">
                                    <div class="layui-row book">
                                        <div class="layui-row book_h">
                                            <img src="../manager/imgs/离散数学.jpg" class="book_img" />
                                        </div>
                                        <div class="layui-row book_text">

                                            <div class="text_book">
                                                <a href="Course_Info.aspx?cid=hd201902005">离散数学</a>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                                <div class="layui-col-md4 layui-col-sm4">
                                    <div class="layui-row book">
                                        <div class="layui-row book_h">
                                            <img src="../manager/imgs/计算机导论.jpg" class="book_img" />

                                        </div>
                                        <div class="layui-row book_text">

                                            <div class="text_book">
                                                <a class="text_book" href="Course_Info.aspx?cid=hd201802004">计算机导论</a>

                                            </div>

                                        </div>

                                    </div>
                                </div>
                                <div class="layui-col-md4 layui-col-sm4">
                                    <div class="layui-row book">
                                        <div class="layui-row book_h">
                                            <img src="../manager/imgs/概率论与数理统计.jpg" class="book_img" />

                                        </div>
                                        <div class="layui-row book_text">
                                            <div class="text_book">
                                                <a class="text_book" href="Course_Info.aspx?cid=hd201902003">概率论与数理统计</a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="layui-row">

                                <div class="layui-col-md4 layui-col-sm4">
                                    <div class="layui-row book">
                                        <div class="layui-row book_h">
                                            <img src="../manager/imgs/大数据分析与应用.jpg" class="book_img" />

                                        </div>
                                        <div class="layui-row book_text">

                                            <div class="text_book">
                                                <a class="text_book" href="Course_Info.aspx?cid=hd202002003">大数据分析与应用</a>

                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <div class="layui-col-md4 layui-col-sm4">&nbsp;</div>
                                <div class="layui-col-md4 layui-col-sm4" style="left: 100px; top: 60px;">
                                    <div class="more">
                                        <a>更多>></a>

                                    </div>
                                </div>



                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
    <div class="layui_row">&nbsp;</div>


    <div class="layui-row">
        <div class="bq ">
            <p>&nbsp; &nbsp;&nbsp;super.six.plus.one.com - 非常六加一团队制作</p>
        </div>
    </div>
    <script>
        layui.use('element', function () {
            var element = layui.element;
        });
    </script>
</body>
</html>
