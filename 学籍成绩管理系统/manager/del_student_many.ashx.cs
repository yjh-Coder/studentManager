using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BLL;

namespace 学籍成绩管理系统.manager
{
    /// <summary>
    /// del_student_many 的摘要说明
    /// </summary>
    public class del_student_many : IHttpHandler
    {
        StudentBll studentBll = new StudentBll();
        AdminBll adminBll = new AdminBll();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string sno=context.Request.Params["sno[]"];
            string[] snos = sno.Split(',');
            foreach (string s in snos)
            {
                studentBll.DeleteStudent(s);
                adminBll.DeleteAdmin(s);
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