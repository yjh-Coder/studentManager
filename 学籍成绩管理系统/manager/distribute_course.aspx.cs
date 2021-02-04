using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 学籍成绩管理系统.manager
{
    public partial class distribute_course : System.Web.UI.Page
    {
        TeacherBll teacherBll = new TeacherBll();
        TeachesBll teachesBll = new TeachesBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ddlAcademy.Items.Insert(0,"全部");
                Repeater1.DataSource = teacherBll.GetTeachers();
                Repeater1.DataBind();
            }        
        }


        protected void ddlAcademy_SelectedIndexChanged(object sender, EventArgs e)
        {
            string academy = ddlAcademy.SelectedItem.Text;
            if (academy == "全部")
            {
                Repeater1.DataSource = teacherBll.GetTeachers();
                Repeater1.DataBind();
            }
            else 
            {
                Repeater1.DataSource = teacherBll.selectTeacherByInfo("academy",academy);
                Repeater1.DataBind();
            }
            
        }

        
        public void btnDeleteRow_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            string[] str = button.CommandArgument.ToString().Split(',');
            string tid = str[0];
            string cid = str[1];
            string classid = str[2];
            teachesBll.deleteRecord(tid,cid,classid);
            GridView1.DataBind();
        }

    }
}