using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 学籍成绩管理系统.manager
{
    public partial class ManagerTest : System.Web.UI.Page
    {
        CourseBll courseBll = new CourseBll();

        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater1.DataSource = courseBll.GetCourses1();
            Repeater1.DataBind();
        }

    }
}