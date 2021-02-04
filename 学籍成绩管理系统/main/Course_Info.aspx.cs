using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 学籍成绩管理系统.main
{
    public partial class Course_Info : System.Web.UI.Page
    {
        CourseBll courseBll = new CourseBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            string cid = Request.QueryString["cid"];
            NewCourse c = courseBll.selectCourseByid2(cid)[0];
            this.tb_cid.Text = cid.Trim();
            this.tb_cname.Text = c.cname;
            this.tb_credit.Text = c.credit.ToString();
            this.tb_hour.Text = c.hour.ToString();
            this.tb_begintime.Text = c.begintime;
            this.tb_endtime.Text = c.endtime;
            this.academy.Text = c.academy;
            this.type.Text = c.coursetype;
            this.image.ImageUrl = "../manager/" + c.img;
        }
    }
}