using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 学籍成绩管理系统.manager
{
    public partial class admin_manager : System.Web.UI.Page
    {
        CourseBll courseBll = new CourseBll();

        protected void Page_Load(object sender, EventArgs e)         
        {         
            Repeater1.DataSource = courseBll.GetCourses1();
            Repeater1.DataBind();
        }


        protected void btn_search_Click1(object sender, EventArgs e)
        {
            int type =   Convert.ToInt32(Request["list"]);
            string search = Request["search"].ToString();
                  
            if(type == 0)
            {
                List<string> list = new List<string>();
                list.Add("cid");
                list.Add("cname");
                list.Add("coursetype");
                Repeater1.DataSource = courseBll.selectCourseByInfo(list, search);
                Repeater1.DataBind();
            }
            else if(type == 1)
            {
                Repeater1.DataSource = courseBll.selectCourseByid(search);
                Repeater1.DataBind();
            }
            else if(type == 2)
            {
                Repeater1.DataSource = courseBll.selectCourseByName(search);
                Repeater1.DataBind();
            }
            else
            {
                Repeater1.DataSource = courseBll.selectCourseByInfo("coursetype", search);
                Repeater1.DataBind();
            }
        }
    }
}