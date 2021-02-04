using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 学籍成绩管理系统.manager
{
    /// <summary>
    /// del_student 的摘要说明
    /// </summary>
    public class del_student : IHttpHandler
    {
        StudentBll studentBll = new StudentBll();
        AdminBll adminBll = new AdminBll();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string sno = context.Request.Params["sno"];
            if (studentBll.DeleteStudent(sno) > 0)
            {
                adminBll.DeleteAdmin(sno);
                context.Response.Write("删除成功!");
            }
            else
            {
                context.Response.Write("删除失败!");
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