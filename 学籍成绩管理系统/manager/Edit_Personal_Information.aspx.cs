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
    public partial class Edit_Personal_Information : System.Web.UI.Page
    {
        AdminBll adminBll = new AdminBll();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [Obsolete]
        protected void btn_confirm_Click(object sender, EventArgs e)
        {
            string password = this.tb_old_password.Text.Trim();
            string newpassword =  this.tb_new_password.Text.Trim();
            Admin admin =adminBll.selectAdmin(Session["username"].ToString())[0];
            if (admin.password == password)
            {
                if(password == newpassword)
                {
                    Page.RegisterStartupScript("js", "<script>warn();</script>");
                }
                else
                {
                    admin.password = newpassword;
                    if (adminBll.UpdateAdmin(admin))
                    {
                        Page.RegisterStartupScript("js", "<script>success();</script>");
                    }
                    else
                    {
                        Page.RegisterStartupScript("js", "<script>error();</script>");
                    }
                }
                
            }
            else
            {
                Page.RegisterStartupScript("js", "<script>error();</script>");
            }
        }
        
    }
}