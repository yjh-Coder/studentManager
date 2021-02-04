using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class CourseDal
    {

        /// <summary>
        ///   查询课程表
        /// </summary>
        /// <returns>课程表的集合</returns>
        public List<NewCourse> GetCourses()
        {
            string sql = @"select  cid,cname,credit,hour,begintime,endtime,coursetype,academy,img 
                            from course inner join 
                            coursetype on course.typeid = coursetype.typeid inner join 
                            academy on academy.academyid = course.academyid";
            List<NewCourse> list = new List<NewCourse>();
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text);
            while (reader.Read())
            {
                NewCourse c = new NewCourse();
                c.cid = reader.GetString(0);
                c.cname = reader.GetString(1);
                c.credit = reader.GetInt32(2);
                c.hour = reader.GetInt32(3);
                c.begintime = reader.GetString(4);
                c.endtime = reader.GetString(5);
                c.coursetype = reader.GetString(6);
                c.academy = reader.GetString(7);
                c.img = reader.GetString(8);
                list.Add(c);
            }
            return list;
        }


        public DataSet GetCourses1()
        {
            string sql = @"select cid,cname,credit,hour,begintime,endtime,coursetype,academy,img,course.typeid as typeid,course.academyid as academyid 
                            from course inner join 
                            coursetype on course.typeid = coursetype.typeid inner join 
                            academy on academy.academyid = course.academyid";
            return SqlHelper.ExecuteAdater(sql);
        }


        //根据课程编号查询新课程信息
        public List<NewCourse> selectCourseByid2(string courseid)
        {
            string sql = @"select cid,cname,credit,hour,begintime,endtime,coursetype,academy,img,course.typeid as typeid,course.academyid as academyid 
                            from course inner join 
                            coursetype on course.typeid = coursetype.typeid inner join 
                            academy on academy.academyid = course.academyid where cid=@courseid";
            SqlParameter[] sp =
            {
                new SqlParameter("@courseid",courseid)
            };
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text, sp: sp);
            List<NewCourse> list = new List<NewCourse>();
            while (reader.Read())
            {
                NewCourse c = new NewCourse();
                c.cid = reader.GetString(0);
                c.cname = reader.GetString(1);
                c.credit = reader.GetInt32(2);
                c.hour = reader.GetInt32(3);
                c.begintime = reader.GetString(4);
                c.endtime = reader.GetString(5);
                c.coursetype = reader.GetString(6);
                c.academy = reader.GetString(7);
                c.img = reader.GetString(8);
                list.Add(c);
            }
            reader.Close();
            return list;
        }


        public List<Course> selectCourseByid1(string courseid)
        {
            string sql = @"select cid,cname,credit,hour,begintime,endtime,typeid,academyid,img from course where cid=@courseid";
            SqlParameter[] sp =
            {
                new SqlParameter("@courseid",courseid)
            };
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text, sp: sp);
            List<Course> list = new List<Course>();
            while (reader.Read())
            {
                Course c = new Course();
                c.cid = reader.GetString(0);
                c.cname = reader.GetString(1);
                c.credit = reader.GetInt32(2);
                c.hour = reader.GetInt32(3);
                c.begintime = reader.GetString(4);
                c.endtime = reader.GetString(5);
                c.typeid = reader.GetInt32(6);
                c.academyid = reader.GetInt32(7);
                c.img = reader.GetString(8);
                list.Add(c);
            }
            reader.Close();
            return list;
        }

        /// <summary>
        ///  根据courseid查询课程
        /// </summary>
        /// <param name="courseid"></param>
        /// <returns></returns>
        public DataSet selectCourseByid(string courseid)
        {
            string sql = string.Format(@"select cid,cname,credit,hour,begintime,endtime,coursetype,academy,img,course.typeid as typeid,course.academyid as academyid 
                        from course inner join coursetype on course.typeid = coursetype.typeid inner join 
                            academy on academy.academyid = course.academyid where cid like '%{0}%'",courseid);
            //SqlParameter[] sp =
            //{
            //    new SqlParameter("@courseid",courseid)
            //};
            //SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text, sp: sp);
            //List<Course> list = new List<Course>();
            //while (reader.Read())
            //{
            //    Course c = new Course();
            //    c.cid = reader.GetString(0);
            //    c.cname = reader.GetString(1);
            //    c.credit = reader.GetInt32(2);
            //    c.hour = reader.GetInt32(3);
            //    c.begintime = reader.GetString(4);
            //    c.endtime = reader.GetString(5);
            //    c.typeid = reader.GetInt32(6);
            //    c.academyid = reader.GetInt32(7);
            //    c.img = reader.GetString(8);
            //    list.Add(c);
            //}
            //reader.Close();
            return SqlHelper.ExecuteAdater(sql);
        }


        /// <summary>
        /// 按课程姓名查找
        /// </summary>
        /// <param name="coursename"></param>
        /// <returns></returns>
        public DataSet selectCourseByName(string coursename)
        {
            string sql = string.Format(@"select cid,cname,credit,hour,begintime,endtime,coursetype,academy,img,course.typeid as typeid,course.academyid as academyid 
                            from course inner join 
                            coursetype on course.typeid = coursetype.typeid inner join 
                            academy on academy.academyid = course.academyid where cname like '%{0}%'", coursename);
            return SqlHelper.ExecuteAdater(sql);
        }


        /// <summary>
        /// 根据表中某个字段查询
        /// </summary>
        /// <param name="A"></param>
        /// <param name="B"></param>
        /// <returns></returns>
        public DataSet selectCourseByInfo(string A, string B)
        {
            string sql = string.Format(@"select cid,cname,credit,hour,begintime,endtime,coursetype,academy,img,course.typeid as typeid,course.academyid as academyid 
                            from course inner join 
                            coursetype on course.typeid = coursetype.typeid inner join 
                            academy on academy.academyid = course.academyid where {0} like '%{1}%'", A, B);
            return SqlHelper.ExecuteAdater(sql);
        }

        public DataSet selectCourseByAcademyAndType(string academy,string type)
        {
            string sql = string.Format(@"select cid,cname,credit,hour,begintime,endtime,coursetype,academy,img,course.typeid as typeid,course.academyid as academyid 
                            from course inner join 
                            coursetype on course.typeid = coursetype.typeid inner join 
                            academy on academy.academyid = course.academyid where academy = '{0}' and coursetype = '{1}'", academy, type);
            return SqlHelper.ExecuteAdater(sql);
        }

        /// <summary>
        /// 根据表中全部表中全部字段信息查询课程
        /// </summary>
        /// <param name="A"></param>
        /// <param name="B"></param>
        /// <returns></returns>
        public DataSet selectCourseByInfo(List<string> list, string B)
        {
            string sql = "";
            for (int i = 0; i < list.Count; i++)
            {
                if (i != list.Count - 1)
                {
                    sql += string.Format(@"select cid,cname,credit,hour,begintime,endtime,coursetype,academy,img,course.typeid as typeid,course.academyid as academyid 
                            from course inner join 
                            coursetype on course.typeid = coursetype.typeid inner join 
                            academy on academy.academyid = course.academyid where {0} like '%{1}%' union ", list[i], B);
                }
                else
                {
                    sql += string.Format(@"select cid,cname,credit,hour,begintime,endtime,coursetype,academy,img,course.typeid as typeid,course.academyid as academyid 
                            from course inner join 
                            coursetype on course.typeid = coursetype.typeid inner join 
                            academy on academy.academyid = course.academyid where {0} like '%{1}%'", list[i], B);
                }
            }
            return SqlHelper.ExecuteAdater(sql);
        }


        /// <summary>
        /// 添加课程信息
        /// </summary>
        /// <param name="course"></param>
        /// <returns></returns>
        public int AddCourse(Course course)
        {
            string sql = @"insert into course values (@cid,@cname,@credit,@hour,@begintime,@endtime,@typeid,@academyid,@img,@is_teach,null,null,null,null,null,null)";
            SqlParameter[] sp =
            {
                 new SqlParameter("@cid", course.cid),
                 new SqlParameter("@cname", course.cname),
                 new SqlParameter("@credit", course.credit),
                 new SqlParameter("@hour", course.hour),
                 new SqlParameter("@begintime", course.begintime),
                 new SqlParameter("@endtime", course.endtime),
                 new SqlParameter("@typeid", course.typeid),
                 new SqlParameter("@academyid", course.academyid),
                 new SqlParameter("@img", course.img),
                 new SqlParameter("@is_teach",false)
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp: sp);
        }

        /// <summary>
        /// 修改课程信息
        /// </summary>
        /// <param name="course"></param>
        /// <returns></returns>
        public int EditCourse(Course course)
        {
            string sql = @"update course set cname=@cname,credit=@credit,hour=@hour,begintime=@begintime,endtime=@endtime,typeid=@typeid,academyid=@academyid,img=@img where cid=@cid";
            SqlParameter[] sp =
            {
                new SqlParameter("@cid",course.cid),
                 new SqlParameter("@cname", course.cname),
                 new SqlParameter("@credit", course.credit),
                 new SqlParameter("@hour", course.hour),
                 new SqlParameter("@begintime", course.begintime),
                 new SqlParameter("@endtime", course.endtime),
                 new SqlParameter("@typeid", course.typeid),
                 new SqlParameter("@academyid", course.academyid),
                 new SqlParameter("@img", course.img)
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp: sp);
        }


        /// <summary>
        /// 删除课程
        /// </summary>
        /// <param name="courseid"></param>
        /// <returns></returns>
        public int DeleteCourse(string courseid)
        {
            string sql = @"delete from course where cid=@courseid";
            SqlParameter[] sp =
            {
                new SqlParameter("@courseid",courseid)
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp: sp);
        }
    }


}

