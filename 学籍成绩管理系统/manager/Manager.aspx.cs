using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 学籍成绩管理系统.user
{
    public partial class Manager : System.Web.UI.Page
    {
        CourseBll courseBll = new CourseBll();

        protected void Page_Load(object sender, EventArgs e)
        {        
            if (Session["username"] == null)
            {
                Response.Redirect("../Login/ManagerLogin.aspx");
            }
        }

      
    }
}