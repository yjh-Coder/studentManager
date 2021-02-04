using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 学籍成绩管理系统.manager
{
    public partial class Student_Manage : System.Web.UI.Page
    {
        StudentBll studentBll = new StudentBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater1.DataSource = studentBll.GetStudents();
            Repeater1.DataBind();

        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            int type = Convert.ToInt32(Request["list"]);
            string search = Request["search"].ToString();
            if (type == 0)
            {
                List<string> list = new List<string>();
                list.Add("sno");
                list.Add("sname");
                Repeater1.DataSource = studentBll.getStudentByInfo(list, search);
                Repeater1.DataBind();
                
            }
            else if (type == 1)
            {
                Repeater1.DataSource = studentBll.getStudentsById(search);
                Repeater1.DataBind();
            }
            else
            {
                Repeater1.DataSource = studentBll.getStudentsByName(search);
                Repeater1.DataBind();
            }
        }
    }
}