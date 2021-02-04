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
    public partial class system_switch : System.Web.UI.Page
    {
        System_Switch system = new System_Switch();
        SystemswitchBll systemswitchBll = new SystemswitchBll();

        protected void Page_Load(object sender, EventArgs e)
        {
            system = systemswitchBll.getSwitch()[0];
            Session["system"] = system.system == true? "true":"false";
            Session["select_course"] = system.select_course == true ? "true" : "false";
            Session["drop_course"] = system.drop_course == true ? "true" : "false";
            Session["give_score"] = system.give_score == true ? "true" : "false";

        }
    }
}