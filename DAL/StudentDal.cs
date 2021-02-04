using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.CodeAnalysis;
using System.IO.IsolatedStorage;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class StudentDal
    {

        // 获取所有 学生

        public DataSet GetStudents()
        {
            string sql = @"select sno,sname,password,classname,academy,student.classid as classid,student.academyid as academyid,identication,sex,enrollment_year,
                         student.professionid as professionid,profession from student inner join class on student.classid=class.classid inner join academy
                         on student.academyid=academy.academyid inner join profession on  student.professionid =profession.professionid";
            return SqlHelper.ExecuteAdater(sql);
        }
        //按sno 查询学生
        public List<New_Student> getStudentById(string sno)
        {
            string sql = @"select sno,sname,password,classid,academyid,identication,sex,enrollment_year,professionid from student where sno=@sno";
            SqlParameter[] sp =
            {
                new SqlParameter("@sno",sno)
            };
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text, sp: sp);
            List<New_Student> list = new List<New_Student>();
            while (reader.Read())
            {
                New_Student s = new New_Student();
                s.sno = reader.GetString(0);
                s.sname = reader.GetString(1);
                s.password = reader.GetString(2);
                s.classname = reader.GetString(3);
                s.academy = reader.GetString(4);
                s.identication = reader.GetString(5);
                s.sex = reader.GetString(6);
                s.enrollment_year = reader.GetString(7).Substring(0,10);
                s.professionid = reader.GetString(8);
                list.Add(s);

            }
            return list;
        }
        //模糊sno 查询 student

        public DataSet getStudentsById(string sno)
        {
            string sql = string.Format(@"select sno,sname,password,classname,academy,student.classid as classid,student.academyid as academyid,identication,sex,enrollment_year,
                         student.professionid as professionid,profession from student inner join class on student.classid=class.classid inner join academy
                         on student.academyid=academy.academyid inner join profession on  student.professionid =profession.professionid where sno like N'%{0}%'", sno);
            return SqlHelper.ExecuteAdater(sql);
        }
        //模糊sname 查询 student
        public DataSet getStudentsByName(string sname)
        {
            string sql = string.Format(@"select sno,sname,password,classname,academy,student.classid as classid,student.academyid as academyid,identication,sex,enrollment_year,
                         student.professionid as professionid,profession from student inner join class on student.classid=class.classid inner join academy
                         on student.academyid=academy.academyid inner join profession on  student.professionid =profession.professionid where sname like N'%{0}%'", sname);
            return SqlHelper.ExecuteAdater(sql);
        }

        //根据表格中某个字段查询

        public DataSet getStudentsByInfo(string a,string b)
        {
            string sql = string.Format(@"select sno,sname,password,student.classid as classid,student.academyid as academyid,identication,sex,enrollment_year,
                         student.professionid as professionid from student inner join class on student.classid=class.classid inner jion academy
                         on student.academyid=academy.academyid inner jion profession student.professiondi =profession.professionid where {0} like '%{1}%'", a,b);

            return SqlHelper.ExecuteAdater(sql);

        }

        //根据多个字段查询信息
        public DataSet getStudentByInfo(List<string> list,string b)
        {
            string sql = "";
            for (int i = 0; i < list.Count; i++)
            {
                if (i != list.Count - 1)
                {
                    sql+= string.Format(@"select sno, sname, password, classname, academy, student.classid as classid, student.academyid as academyid, identication, sex, enrollment_year,
                         student.professionid as professionid, profession from student inner join class on student.classid=class.classid inner join academy
                         on student.academyid=academy.academyid inner join profession on student.professionid = profession.professionid where {0} like N'%{1}%' union ", list[i], b);

                }
                else
                {
                    sql+= string.Format(@"select sno, sname, password, classname, academy, student.classid as classid, student.academyid as academyid, identication, sex, enrollment_year,
                         student.professionid as professionid, profession from student inner join class on student.classid=class.classid inner join academy
                         on student.academyid=academy.academyid inner join profession on student.professionid = profession.professionid where {0} like N'%{1}%'", list[i], b);

                }

            }
            return SqlHelper.ExecuteAdater(sql);
        }


        //增加学生
        public int AddStudent(Student s)
        {
            string sql = @"insert into student values(@sno,@sname,@password,@classid,@academyid,@identication,@sex,@enrollment_year,@professionid,null,null,null,null)";
            SqlParameter[] sp =
            {
                new SqlParameter("@sno",s.sno),
                new SqlParameter("@sname",s.sname),
                new SqlParameter("@password",s.password),
                new SqlParameter("@classid",s.classid),
                new SqlParameter("@academyid",s.academyid),
                new SqlParameter("@sex",s.sex),
                new SqlParameter("@enrollment_year",s.enrollment_year),
                new SqlParameter("@professionid",s.professionid),
                new SqlParameter("@identication",s.identication)


            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp: sp);
        }

        //修改学生
        public int EditStudent(Student s)
        {
            string sql = @"update student set sname=@sname,password=@password,classid=@classid,academyid=@academyid,sex=@sex,enrollment_year=@enrollment_year,professionid=@professionid where sno=@sno";
            SqlParameter[] sp =
            {
                new SqlParameter("@sno",s.sno),
                new SqlParameter("@sname",s.sname),
                new SqlParameter("@password",s.password),
                new SqlParameter("@classid",s.classid),
                new SqlParameter("@academyid",s.academyid),
                new SqlParameter("@sex",s.sex),
                new SqlParameter("@enrollment_year",s.enrollment_year),
                new SqlParameter("@professionid",s.professionid),



            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp: sp);
        }


        //删除教师
        public int DeleteStudent(string sno)
        {
            string sql = "delete from student where sno=@sno";
            SqlParameter[] sp =
            {
                new SqlParameter("@sno",sno)

             };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp: sp);

        }


    }
}
