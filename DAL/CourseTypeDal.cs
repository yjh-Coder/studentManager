using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DAL
{
    public class CourseTypeDal
    {
        /// <summary>
        /// 查询所有课程类型
        /// </summary>
        /// <returns></returns>
        public List<CourseType> GetCourseType()
        {
            string sql = "select * from coursetype";
            List<CourseType> list = new List<CourseType>();
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text);
            while (reader.Read())
            {
                CourseType type = new CourseType();
                type.typeid = reader.GetInt32(0);
                type.coursetype = reader.GetString(1);
                list.Add(type);
            }
            return list;
        }



        public DataSet GetCourseType1()
        {
            string sql = "select typeid,coursetype from coursetype";
            return SqlHelper.ExecuteAdater(sql);
        }

        //public int AddCourseType()
        //{
        //    string sql = @""
        //}


    }
}
