using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 学籍成绩管理系统.manager
{
    /// <summary>
    /// edit_teacher1 的摘要说明
    /// </summary>
    public class edit_teacher1 : IHttpHandler
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
            Teacher teacher = teacherBll.selectTeacherByid1(tid)[0];
            teacher.tid = tid;
            teacher.tname = tname;
            teacher.password = password;
            teacher.sex = sex;
            teacher.academyid = academyid;
            teacher.titleid = titleid;
            if(teacherBll.EditTeacher(teacher))
            {
                Admin admin = new Admin();
                admin.admin = tid;
                admin.password = password;
                admin.identify = 1;
                adminBll.UpdateAdmin(admin);
                context.Response.Write("修改成功！");
            }
            else
            {
                context.Response.Write("修改失败！");
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