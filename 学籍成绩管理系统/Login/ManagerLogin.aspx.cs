using BLL;
using Model;
using System;
using System.Threading;

namespace 学籍成绩管理系统.Login
{
    public partial class ManagerLogin : System.Web.UI.Page
    {

        static AdminBll adminBll = new AdminBll();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [Obsolete]
        protected void btn_login_Click(object sender, EventArgs e)
        {
            string username = Request["username"];
            string password = Request["password"];
            Admin admin = new Admin
            {
                admin = username,
                password = password,
            };

            try
            {
                if (adminBll.Login(admin))
                {
                    Admin a = adminBll.selectAdmin(username)[0];
                    if (a.identify == 2)
                    {
                        Session["username"] = username;         //保存用户信息
                        Session["password"] = password;
                        Response.Redirect("../manager/Manager.aspx");
                    }

                    //Page.RegisterStartupScript("js", "<script>success();window.location.href='../manager/admin_manager.aspx';</script>");
                    //Response.Write("< script language='text/javascript'>fun();window.location.href='../manager/admin_manager.aspx';</script>");
                    //Session["username"] = username;
                    //Response.End();
                    else if(a.identify == 0)
                    {
                        Session["username"] = username;
                        Session["password"] = password;
                        Response.Redirect("../student/Student.aspx");
                    }
                    else
                    {
                        Session["username"] = username;
                        Session["password"] = password;
                        Response.Redirect("../manager/Teacher.aspx");
                    }
                }
                else
                {
                    Page.RegisterStartupScript("js", "<script>error();</script>");
                    //Response.Write("<script>error();/script>");
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}