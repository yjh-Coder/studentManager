using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 学籍成绩管理系统.manager
{
    /// <summary>
    /// del_teacher 的摘要说明
    /// </summary>
    public class del_teacher : IHttpHandler
    {
        TeacherBll teacherBll = new TeacherBll();
        AdminBll adminBll = new AdminBll();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string tid = context.Request.Params["tid"];
            if(teacherBll.DeleteTeacher(tid))
            {
                adminBll.DeleteAdmin(tid);
                context.Response.Write("删除成功！");
            }
            else
            {
                context.Response.Write("删除失败！");
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