using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 学籍成绩管理系统.manager
{
    public partial class teacher_manage : System.Web.UI.Page
    {
        TeacherBll teacherBll = new TeacherBll();

        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater1.DataSource = teacherBll.GetTeachers();
            Repeater1.DataBind();
        }

        protected void btn_search_Click1(object sender, EventArgs e)
        {
            int type = Convert.ToInt32(Request["list"]);
            string search = Request["search"].ToString();


            if (type == 0)
            {
                List<string> list = new List<string>();
                list.Add("tid");
                list.Add("tname");
                list.Add("academy");
                Repeater1.DataSource = teacherBll.selectTeacherByInfo(list, search);
                Repeater1.DataBind();
            }
            else if (type == 1)
            {
                Repeater1.DataSource = teacherBll.selectTeacherByid(search);
                Repeater1.DataBind();
            }
            else if (type == 2)
            {
                Repeater1.DataSource = teacherBll.selectTeacherByName(search);
                Repeater1.DataBind();
            }
            else
            {
                Repeater1.DataSource = teacherBll.selectTeacherByInfo("academy", search);
                Repeater1.DataBind();
            }
        }
    }
}