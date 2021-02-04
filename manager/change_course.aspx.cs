using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 学籍成绩管理系统.manager
{
    public partial class change_course : System.Web.UI.Page
    {
        CourseBll courseBll = new CourseBll();

        [Obsolete]
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.RegisterStartupScript("js", "<script>success();</script>");
            }

        }


        //string cid,string cname,int credit,int hour,string begintime,string endtime,int academyid
        [WebMethod]
        public bool change_course_ajax()
        {
            string cid = Request["cid"].ToString();
            Course c = courseBll.selectCourseByid(cid)[0];
            string cname = Request["cname"].ToString();
            int credit = Convert.ToInt32(Request["credit"]);
            int hour = Convert.ToInt32(Request["hour"]);
            string begintime = Request["begintime"];
            string endtime = Request["endtime"];
            int typeid = Convert.ToInt32(Request["typeid"]);
            int academyid = Convert.ToInt32(Request["academyid"]);
            string img = Request["img"].ToString();
            c.cid = cid;
            c.cname = cname;
            c.credit = credit;
            c.hour = hour;
            c.begintime = begintime;
            c.endtime = endtime;
            c.typeid = typeid;
            c.academyid = academyid;
            if (courseBll.EditCourse(c))
            {
                return true;
                //Page.RegisterStartupScript("js", "<script>success();</script>");
            }
            else
            {
                return false;
                //Page.RegisterStartupScript("js", "<script>error();</script>");
            }
        }

        //[Obsolete]
        //protected void btn_submit_Click(object sender, EventArgs e)
        //{
        //    string cid = Request["cid"].ToString();
        //    Course c = courseBll.selectCourseByid(cid)[0];
        //    string cname = Request["cname"].ToString();
        //    int credit = Convert.ToInt32(Request["credit"]);
        //    int hour = Convert.ToInt32(Request["hour"]);
        //    string begintime = Request["begin_time"];
        //    string endtime = Request["end_time"];
        //    int typeid = Convert.ToInt32(Request["typeid"]);
        //    int academyid = Convert.ToInt32(Request["academyid"]);
        //    string img = Request["img"].ToString();
        //    c.cid = cid;
        //    c.cname = cname;
        //    c.credit = credit;
        //    c.hour = hour;
        //    c.begintime = begintime;
        //    c.endtime = endtime;
        //    c.typeid = typeid;
        //    c.academyid = academyid;
        //    c.img = img;
        //    if (courseBll.EditCourse(c))
        //    {
        //        Page.RegisterStartupScript("js", "<script>success();</script>");
        //    }
        //    else
        //    {
        //        Page.RegisterStartupScript("js", "<script>error();</script>");
        //    }
        //}
    }
}