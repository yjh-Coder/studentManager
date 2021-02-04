using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace 学籍成绩管理系统.manager
{
    /// <summary>
    /// del_course_many 的摘要说明
    /// </summary>
    public class del_course_many : IHttpHandler
    {
        CourseBll courseBll = new CourseBll();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string cid = context.Request.Params["cid[]"];        //%5B和%5D代表 [ 和 ]
            string[] cids = cid.Split(',');
            foreach (string c in cids)
            {
                courseBll.DeleteCourse(c);
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