using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 学籍成绩管理系统.manager
{
    /// <summary>
    /// edit_student1 的摘要说明
    /// </summary>
    public class edit_student1 : IHttpHandler
    {
        StudentBll studentBll = new StudentBll();
        AdminBll adminBll = new AdminBll();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string sno = context.Request.Params["sno"].ToString();
            string sname = context.Request.Params["sname"].ToString();
            string password = context.Request.Params["password"].ToString();
            string sex = context.Request.Params["sex"].ToString();
            if (sex == "1")
            {
                sex = "男";
            }
            else
            {
                sex = "女";
            }
            string classname = context.Request.Params["classname"].ToString();
            int academy = Convert.ToInt32(context.Request.Params["academy"].ToString());
            string identication = context.Request.Params["identication"].ToString();
            string enrollment_year = context.Request.Params["enrollment_year"];
            string profession = context.Request.Params["profession"].ToString();
            Student s = new Student()
            {
                sno = sno,
                sname = sname,
                password = password,
                sex = sex,
                classid = classname,
                academyid = academy,
                identication = identication,
                enrollment_year = enrollment_year,
                professionid = profession

            };
            if (studentBll.EditStudent(s) > 0)
            {
                Admin admin = new Admin();
                admin.admin = sno;
                admin.password = password;
                admin.identify = 0;
                adminBll.UpdateAdmin(admin);
                context.Response.Write("添加成功！");
            }
            else
            {
                context.Response.Write("添加失败！");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}