using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class TeachesDal
    {
        public DataSet getTeaches()
        {
            string sql = "select tid,cid,tname,cname,titleid,title,academyid,academy,classid,classname from teaches";
            return SqlHelper.ExecuteAdater(sql);
        }

        /// <summary>
        /// 根据教师编号查询
        /// </summary>
        /// <param name="tid"></param>
        /// <returns></returns>
        public DataSet selectRecordByTid(string tid)
        {
            string sql = string.Format(@"select tid,cid,tname,cname,titleid,title,academyid,academy,classid,classname 
                                        from teaches where tid like '%{0}%'",tid);
            return SqlHelper.ExecuteAdater(sql);
        }

        /// <summary>
        /// 根据课程编号查询
        /// </summary>
        /// <param name="tid"></param>
        /// <returns></returns>
        public DataSet selectRecordByCid(string cid)
        {
            string sql = string.Format(@"select tid,cid,tname,cname,titleid,title,academyid,academy,classid,classname 
                                        from teaches where cid like '%{0}%'", cid);
            return SqlHelper.ExecuteAdater(sql);
        }

        public DataSet selectRecordByInfo(string A,string B)
        {
            string sql = string.Format(@"select tid,cid,tname,cname,titleid,title,academyid,academy,classid,classname 
                                        from teaches where {0} like '%{1}%'",A,B);
            return SqlHelper.ExecuteAdater(sql);
        }

        public DataSet selectRecordByInfo(List<string> list,string B)
        {
            string sql = "";
            for (int i = 0; i < list.Count; i++)
            {
                if(i != list.Count-1)
                {
                    sql += string.Format(@"select tid,cid,tname,cname,titleid,title,academyid,academy,classid,classname 
                                        from teaches where {0} like '%{1}%' union",list[i],B);
                }
                else
                {
                    sql += string.Format(@"select tid,cid,tname,cname,titleid,title,academyid,academy,classid,classname 
                                        from teaches where {0} like '%{1}%'", list[i], B);
                }
            }
            return SqlHelper.ExecuteAdater(sql);
        }

        /// <summary>
        /// 添加记录
        /// </summary>
        /// <param name="th"></param>
        /// <returns></returns>
        public int addRecord(Teaches th)
        {
            string sql = @"insert into teaches (tid,cid,tname,cname,credit,titleid,title,typeid,coursetype,academyid,academy,professionid,profession,classid,classname,count) values (@tid,@cid,@tname,@cname,@titleid,@title,@typeid,@coursetype,@academyid,@academy,@professionid,@profession,@classid,@classname,@count)";
            SqlParameter[] sp =
            {
                new SqlParameter("@tid",th.tid),
                new SqlParameter("@cid",th.cid),
                new SqlParameter("@tname",th.tname),
                new SqlParameter("@cname",th.cname),
                new SqlParameter("@credit",th.credit),
                new SqlParameter("@titleid",th.titleid),
                new SqlParameter("@title",th.title),
                new SqlParameter("@typeid",th.typeid),
                new SqlParameter("@coursetype",th.coursetype),
                new SqlParameter("@academyid",th.academyid),
                new SqlParameter("@academy",th.academy),
                new SqlParameter("@professionid",th.professionid),
                new SqlParameter("@profession",th.profession),
                new SqlParameter("@classid",th.classid),
                new SqlParameter("@classname",th.classname),
                new SqlParameter("@count",th.count)
            };
            return SqlHelper.ExecuteNonQuery(sql,CommandType.Text,sp:sp);
        }

        /// <summary>
        /// 更新记录
        /// </summary>
        /// <param name="th"></param>
        /// <returns></returns>
        public int updateRecord(Teaches th)
        {
            string sql = @"update teaches set tid=@tid,tname=@tname,titleid=@titleid,title=@title,academyid=@academyid,academy=@academy,classid=@classid,classname=@classname where cid=@cid";
            SqlParameter[] sp =
            {
                new SqlParameter("@tid",th.tid),
                new SqlParameter("@cid",th.cid),
                new SqlParameter("@tname",th.tname),
                new SqlParameter("@titleid",th.titleid),
                new SqlParameter("@title",th.title),
                new SqlParameter("@academyid",th.academyid),
                new SqlParameter("@academy",th.academy),
                new SqlParameter("@classid",th.classid),
                new SqlParameter("@classname",th.classname)
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp: sp);
        }

        /// <summary>
        /// 删除记录
        /// </summary>
        /// <param name="tid"></param>
        /// <param name="cid"></param>
        /// <param name="classid"></param>
        /// <returns></returns>
        public int deleteRecord(string tid,string cid,string classid)
        {
            string sql = @"delete from teaches where tid=@tid and cid=@cid and classid=@classid";
            SqlParameter[] sp =
            {
                new SqlParameter("@tid",tid),
                new SqlParameter("@cid",cid),
                new SqlParameter("@classid",classid)
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp: sp);
        }

    }
}
