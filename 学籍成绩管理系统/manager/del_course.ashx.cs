using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 学籍成绩管理系统.manager
{
    /// <summary>
    /// del_course 的摘要说明
    /// </summary>
    public class del_course : IHttpHandler
    {
        CourseBll courseBll = new CourseBll();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string cid = context.Request.Params["cid"];
            if (courseBll.DeleteCourse(cid))
            {
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