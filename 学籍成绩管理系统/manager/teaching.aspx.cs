using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 学籍成绩管理系统.manager
{
    public partial class teaching : System.Web.UI.Page
    {
        TeachesDal teachesDal = new TeachesDal();
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater1.DataSource = teachesDal.getTeaches();
            Repeater1.DataBind();
        }

        protected void btn_search_Click1(object sender, EventArgs e)
        {

        }
    }
}