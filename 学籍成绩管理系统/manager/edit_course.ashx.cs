using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace 学籍成绩管理系统.manager
{
    /// <summary>
    /// edit_course1 的摘要说明
    /// </summary>
    public class edit_course1 : IHttpHandler
    {

        CourseBll courseBll = new CourseBll();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string cid = context.Request.Params["cid"].ToString();
            string cname = context.Request.Params["cname"].ToString();
            int credit = Convert.ToInt32(context.Request.Params["credit"]);
            int hour = Convert.ToInt32(context.Request.Params["hour"]);
            int academyid = Convert.ToInt32(context.Request.Params["academy"]);
            int typeid = Convert.ToInt32(context.Request.Params["type"]);
            string begintime = context.Request.Params["begintime"].ToString();
            string endtime = context.Request.Params["endtime"].ToString();
            
            string img = context.Request.Params["img"].ToString();
            if (!img.Contains("imgs"))
            {
                img = "imgs/" + img;
            }           
            Course course = courseBll.selectCourseByid1(cid)[0];
            course.cid = cid;
            course.cname = cname;
            course.credit = credit;
            course.hour = hour;
            course.begintime = begintime;
            course.endtime = endtime;
            course.typeid = typeid;
            course.academyid = academyid;
            course.img = img;
            if (courseBll.EditCourse(course))
            {
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