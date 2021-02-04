using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 学籍成绩管理系统.manager
{
    /// <summary>
    /// add_course1 的摘要说明
    /// </summary>
    public class add_course1 : IHttpHandler
    {
        CourseBll courseBll = new CourseBll();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string cid = context.Request.Params["cid"];
            string cname = context.Request.Params["cname"].ToString();
            int credit = Convert.ToInt32(context.Request.Params["credit"]);
            int hour = Convert.ToInt32(context.Request.Params["hour"]);
            int academyid = Convert.ToInt32(context.Request.Params["academy"]);
            int typeid = Convert.ToInt32(context.Request.Params["type"]);
            string begintime = context.Request.Params["begintime"].ToString();
            string endtime = context.Request.Params["endtime"].ToString();
            string img = "imgs/" + context.Request.Params["img"].ToString();
            Course course = new Course()
            {
                cid = cid,
                cname = cname,
                credit = credit,
                hour = hour,
                academyid = academyid,
                typeid = typeid,
                begintime = begintime,
                endtime = endtime,
                img = img
            };

            if (courseBll.AddCourse(course))
            {
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