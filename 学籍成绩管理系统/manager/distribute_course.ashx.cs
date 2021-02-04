using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 学籍成绩管理系统.manager
{
    /// <summary>
    /// distribute_course1 的摘要说明
    /// </summary>
    public class distribute_course1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            
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