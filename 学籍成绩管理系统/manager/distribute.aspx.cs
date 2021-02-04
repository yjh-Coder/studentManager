using BLL;
using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ThirdParty.Json.LitJson;

namespace 学籍成绩管理系统.manager
{
    public partial class distribute : System.Web.UI.Page
    {
        TeachesBll teachesBll = new TeachesBll();
        CourseBll courseBll = new CourseBll();
        Teaches teaches = new Teaches();
        bool flag = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCourseType.Items.Insert(0, "全部");
                ddlAcademy.Items.Insert(0, "全部");
                ddlProfession.Items.Insert(0, new ListItem("全部","0"));
                ddlClass.Items.Insert(0, new ListItem("全部","0"));
                string json = HttpUtility.UrlDecode(Request.QueryString["data"],System.Text.Encoding.UTF8);
                JsonData data =JsonMapper.ToObject(json);
                teaches.tname = data["教师名称"].ToString();
                teaches.tid = data["教师编号"].ToString();
                teaches.academy = data["学院"].ToString();
                teaches.academyid = data["学院编号"].ToString();
                teaches.title = data["职称"].ToString();
                teaches.titleid = Convert.ToInt32(data["职称编号"].ToString());
            }
        }

        
        protected void btnSelectRow_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            if (button.Text.Equals("选择"))
            {
                button.Style.Add("color", "black");
                button.Style.Add("background-color", "Transparent");
                button.Style.Add(" border-style", "none");
                button.Text = "已选择";
                teaches.cid = row.Cells[0].Text;
                teaches.cname = row.Cells[1].Text;
                teaches.coursetype = row.Cells[2].Text;
                teaches.typeid = Convert.ToInt32(row.Cells[3].Text);
                teaches.credit = Convert.ToDouble(row.Cells[4].Text);
                flag = true;
            }  
            //row.Cells[0].Text
            //teachesBll.deleteRecord(tid, cid, classid);
            //GridView1.DataBind();
        }

        protected void ddlCourseType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string coursetype = ddlCourseType.SelectedItem.Text;
            string academy = ddlAcademy.SelectedItem.Text;
            if(coursetype == "全部" && academy == "全部")
            {
                string sql = string.Format(@"select cid,cname,coursetype,academy
                            from course inner join coursetype on course.typeid = coursetype.typeid inner
                            join academy on academy.academyid = course.academyid ");
                sdsCourse.SelectCommand = sql;                  
                GridView1.DataBind();
            }
            else if(coursetype == "全部")
            {
                sdsCourse.SelectCommand = string.Format(@"select cid,cname,coursetype,academy
                            from course inner join coursetype on course.typeid = coursetype.typeid inner
                            join academy on academy.academyid = course.academyid where academy = '{0}'", academy);
                GridView1.DataBind();
            }
            else if (academy == "全部")
            {
                sdsCourse.SelectCommand = string.Format(@"select cid,cname,coursetype,academy
                            from course inner join coursetype on course.typeid = coursetype.typeid inner
                            join academy on academy.academyid = course.academyid where  coursetype = '{0}'",  coursetype);
                GridView1.DataBind();
            }
            else
            {
                sdsCourse.SelectCommand = string.Format(@"select cid,cname,coursetype,academy
                            from course inner join coursetype on course.typeid = coursetype.typeid inner
                            join academy on academy.academyid = course.academyid where academy = '{0}' and coursetype = '{1}'", academy, coursetype);
                GridView1.DataBind();
            }
        }

        protected void ddlAcademy_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCourseType_SelectedIndexChanged(sender,e);
        }

        protected void ddlProfession_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string profession = ddlProfession.SelectedItem.Text;
            //sdsClass.SelectCommand = string.Format(@"select classid,classname from class where profession = '{0}'",profession);
            //ddlClass.DataBind();
        }

        protected void btnDistribute_Click(object sender, EventArgs e)
        {
            if (flag)
            {
                string profession = ddlProfession.SelectedItem.Text;
                string classname = ddlClass.SelectedItem.Text;
                string professionid = ddlProfession.SelectedItem.Value;
                string classid = ddlClass.SelectedItem.Value;
                int count = Convert.ToInt32(txtCount.Text);
                teaches.classname = classname;
                teaches.profession = profession;
                teaches.classid = classid;
                teaches.professionid = professionid;
                teaches.count = count;
                teachesBll.addRecord(teaches);
            }
        }
    }
}