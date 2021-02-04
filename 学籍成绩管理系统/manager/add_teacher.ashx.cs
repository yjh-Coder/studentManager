using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 学籍成绩管理系统.manager
{
    /// <summary>
    /// add_teacher1 的摘要说明
    /// </summary>
    public class add_teacher1 : IHttpHandler
    {
        TeacherBll teacherBll = new TeacherBll();
        AdminBll adminBll = new AdminBll();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string tid = context.Request.Params["tid"];
            string tname = context.Request.Params["tname"];
            string password = context.Request.Params["password"];
            string sex = context.Request.Params["sex"];
            int academyid = Convert.ToInt32(context.Request.Params["academy"]);
            int titleid = Convert.ToInt32(context.Request.Params["type"]);
            Teacher teacher = new Teacher()
            {
                tid = tid,
                tname = tname,
                password = password,
                sex = sex,
                academyid = academyid,
                titleid = titleid
            };
            if (teacherBll.AddTeacher(teacher))
            {
                Admin admin = new Admin();
                admin.admin = tid;
                admin.password = password;
                admin.identify = 1;
                adminBll.AddAdmin(admin);
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