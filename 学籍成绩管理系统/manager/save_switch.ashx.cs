using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 学籍成绩管理系统.manager
{
    /// <summary>
    /// save_switch 的摘要说明
    /// </summary>
    public class save_switch : IHttpHandler
    {

        System_Switch system_Switch = new System_Switch();
        SystemswitchBll systemswitchBll = new SystemswitchBll();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hello World");
            system_Switch.id = 1;
            system_Switch.system = Convert.ToBoolean(context.Request.Params["system"]);
            system_Switch.select_course = Convert.ToBoolean(context.Request.Params["select_course"]);
            system_Switch.drop_course = Convert.ToBoolean(context.Request.Params["drop_course"]);
            system_Switch.give_score = Convert.ToBoolean(context.Request.Params["give_score"]);
            systemswitchBll.update(system_Switch);          
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