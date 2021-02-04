using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 学籍成绩管理系统.manager
{
    /// <summary>
    /// del_teacher_many 的摘要说明
    /// </summary>
    public class del_teacher_many : IHttpHandler
    {
        TeacherBll teacherBll = new TeacherBll();
        AdminBll adminBll = new AdminBll();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string tid = context.Request.Params["tid[]"];
            string[] tids = tid.Split(',');
            foreach(string t in tids)
            {
                teacherBll.DeleteTeacher(t);
                adminBll.DeleteAdmin(t);       //对应删除admin表的内容
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