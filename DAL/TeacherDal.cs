using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL
{
    public class TeacherDal
    {
        /// <summary>
        /// 获取全部老师
        /// </summary>
        /// <returns></returns>
        public DataSet GetTeachers()
        {
            string sql = @"select tid,tname,password,sex,academy,title,teacher.academyid as academyid,teacher.titleid as titleid 
                           from teacher inner join academy on academy.academyid = teacher.academyid inner join  
                            title on teacher.titleid = title.titleid";
            return SqlHelper.ExecuteAdater(sql);
        }

        /// <summary>
        /// 根据教师编号查询
        /// </summary>
        /// <param name="tid"></param>
        /// <returns></returns>
        public List<Teacher> selectTeacherByid1(string tid)
        {
            string sql = @"select tid,tname,password,sex,academyid,titleid from teacher where tid=@tid";
            SqlParameter[] sp =
            {
                new SqlParameter("@tid",tid)
            };
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text, sp: sp);
            List<Teacher> list = new List<Teacher>();
            while (reader.Read())
            {
                Teacher t = new Teacher();
                t.tid = reader.GetString(0);
                t.tname = reader.GetString(1);
                t.password = reader.GetString(2);
                t.sex = reader.GetString(3);
                t.academyid = reader.GetInt32(4);
                t.titleid = reader.GetInt32(5);
                list.Add(t);
            }
            reader.Close();
            return list;
        }

        /// <summary>
        /// 根据教师编号模糊查询
        /// </summary>
        /// <param name="tid"></param>
        /// <returns></returns>
        public DataSet selectTeacherByid(string tid)
        {
            string sql = string.Format(@"select tid,tname,password,sex,academy,title,teacher.academyid as academyid,teacher.titleid as titleid
                           from teacher inner join academy on academy.academyid = teacher.academyid inner join  
                            title on teacher.titleid = title.titleid where tid like '%{0}%'",tid);
            return SqlHelper.ExecuteAdater(sql);
        }

        public DataSet selectTeacherByName(string tname)
        {
            string sql = string.Format(@"select tid,tname,password,sex,academy,title,teacher.academyid as academyid,teacher.titleid as titleid
                           from teacher inner join academy on academy.academyid = teacher.academyid inner join  
                            title on teacher.titleid = title.titleid where tname like '%{0}%'", tname);
            return SqlHelper.ExecuteAdater(sql);
        }

        /// <summary>
        /// 根据表中某个字段查询
        /// </summary>
        /// <param name="A"></param>
        /// <param name="B"></param>
        /// <returns></returns>
        public DataSet selectTeacherByInfo(string A,string B)
        {
            string sql = string.Format(@"select tid,tname,password,sex,academy,title,teacher.academyid as academyid,teacher.titleid as titleid
                           from teacher inner join academy on academy.academyid = teacher.academyid inner join  
                            title on teacher.titleid = title.titleid where {0} like '%{1}%'", A, B);
            return SqlHelper.ExecuteAdater(sql);
        }


        /// <summary>
        /// 根据表中全部表中全部字段信息查询课程
        /// </summary>
        /// <param name="list"></param>
        /// <param name="B"></param>
        /// <returns></returns>
        public DataSet selectTeacherByInfo(List<string> list,string B) 
        {
            string sql = "";
            for (int i = 0; i < list.Count; i++)
            {
                if(i != list.Count-1)
                {
                    sql += string.Format(@"select tid,tname,password,sex,academy,title,teacher.academyid as academyid,teacher.titleid as titleid
                           from teacher inner join academy on academy.academyid = teacher.academyid inner join  
                            title on teacher.titleid = title.titleid where {0} like '%{1}%' union ",list[i],B);
                }
                else
                {
                    sql += string.Format(@"select tid,tname,password,sex,academy,title,teacher.academyid as academyid,teacher.titleid as titleid
                           from teacher inner join academy on academy.academyid = teacher.academyid inner join  
                            title on teacher.titleid = title.titleid where {0} like '%{1}%'", list[i], B);
                }
            }
            return SqlHelper.ExecuteAdater(sql);
        }

        /// <summary>
        /// 增加老师
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public int AddTeacher(Teacher t)
        {
            string sql = @"insert into teacher values (@tid,@tname,@password,@sex,@academyid,@titleid,null,null,null,null)";
            SqlParameter[] sp =
            {
               new SqlParameter("@tid",t.tid),
               new SqlParameter("@tname",t.tname),
               new SqlParameter("@password",t.password),
               new SqlParameter("@sex",t.sex),
               new SqlParameter("@academyid",t.academyid),
               new SqlParameter("@titleid",t.titleid)
            };
            return SqlHelper.ExecuteNonQuery(sql,CommandType.Text,sp:sp);
        }

        /// <summary>
        /// 修改老师信息
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public int EditTeacher(Teacher t)
        {
            string sql = @"update teacher set tname=@tname,password=@password,sex=@sex,academyid=@academyid,titleid=@titleid where tid=@tid";
            SqlParameter[] sp =
            {
               new SqlParameter("@tid",t.tid),
               new SqlParameter("@tname",t.tname),
               new SqlParameter("@password",t.password),
               new SqlParameter("@sex",t.sex),
               new SqlParameter("@academyid",t.academyid),
               new SqlParameter("@titleid",t.titleid)
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp: sp);
        }

        /// <summary>
        /// 删除老师
        /// </summary>
        /// <param name="tid"></param>
        /// <returns></returns>
        public int DeleteTeacher(string tid)
        {
            string sql = @"delete from teacher where tid=@tid";
            SqlParameter[] sp =
            {
                new SqlParameter("@tid",tid)
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp: sp);
        }


    }
}
