using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 学籍成绩管理系统.manager
{
    public partial class add_course : System.Web.UI.Page
    {
        CourseBll courseBll = new CourseBll();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [Obsolete]
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            string cid = Request["cid"].ToString();
            string cname = Request["cname"].ToString();
            int credit = Convert.ToInt32(Request["credit"]);
            int hour = Convert.ToInt32(Request["hour"]);
            string begintime = Request["begin_time"];
            string endtime = Request["end_time"];
            int typeid = Convert.ToInt32(Request["select_type"]);
            int academyid = Convert.ToInt32(Request["select_academy"]);
            string img = Request["img"];
            Course course = new Course()
            {
                cid = cid,
                cname = cname,
                credit = credit,
                hour = hour,
                begintime = begintime,
                endtime = endtime,
                typeid = typeid,
                academyid = academyid,
                img = img
            };
            if (courseBll.AddCourse(course))
            {
                Page.RegisterStartupScript("js", "<script>success();</script>");
            }
            else
            {
                Page.RegisterStartupScript("js", "<script>error();</script>");
            }
        }
    }
}