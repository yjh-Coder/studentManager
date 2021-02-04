using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace 学籍成绩管理系统.manager
{
    /// <summary>
    /// exit 的摘要说明
    /// </summary>
    public class exit : IHttpHandler, IRequiresSessionState         //必须继承IRequiresSessionState ,否则会出现 未将对象引用设置到对象的实例           //https://q.cnblogs.com/q/99212/
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Session.Abandon();                        //将当前会话取消
            //context.Response.Redirect("http://www.baidu.com");
            //context.Response.Redirect("../Login/ManagerLogin.aspx");
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