using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class AcademyDal
    {
        public List<Academy> GetAcademies()
        {
            string sql = "select * from academy";
            List<Academy> list = new List<Academy>();
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text);
            while (reader.Read())
            {
                Academy academy = new Academy();
                academy.academyid = reader.GetString(0);
                academy.academy = reader.GetString(1);
                list.Add(academy);
            }
            return list;
        }

        public DataSet GetAcademies1()
        {
            string sql = "select academyid,academy from academy";
            return SqlHelper.ExecuteAdater(sql);
        }
    }
}
