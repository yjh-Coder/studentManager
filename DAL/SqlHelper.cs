using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class SqlHelper
    {


        private static readonly string conString = ConfigurationManager.ConnectionStrings["sqlserver"].ConnectionString;

        public static int ExecuteNonQuery(string sql, CommandType type, params SqlParameter[] sp)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlCommand sc = new SqlCommand(sql, conn))
                {
                    sc.CommandType = type;
                    if (sp != null)
                    {
                        sc.Parameters.AddRange(sp);
                    }
                    conn.Open();
                    return sc.ExecuteNonQuery();
                }
            }
        }

        public static object ExecuteScalar(string sql, CommandType type, params SqlParameter[] sp)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlCommand sc = new SqlCommand(sql, conn))
                {
                    sc.CommandType = type;
                    if (sp != null)
                    {
                        sc.Parameters.AddRange(sp);
                    }
                    conn.Open();
                    return sc.ExecuteScalar();
                }
            }
        }

        public static SqlDataReader ExecuteReader(string sql, CommandType type, params SqlParameter[] sp)
        {
            SqlConnection conn = new SqlConnection(conString);
            using (SqlCommand sc = new SqlCommand(sql, conn))
            {
                sc.CommandType = type;
                if (sp != null)
                {
                    sc.Parameters.AddRange(sp);
                }
                try
                {
                    conn.Open();
                    return sc.ExecuteReader(CommandBehavior.CloseConnection);
                }
                catch
                {
                    conn.Close();
                    conn.Dispose();
                    throw;
                }
            }
        }

        public static DataSet ExecuteAdater(string sql, params SqlParameter[] sp)
        {
            SqlConnection conn = new SqlConnection(conString);

            using (SqlCommand com = new SqlCommand(sql, conn))
            {
                com.Parameters.AddRange(sp);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                DataSet ds = new DataSet();
                adapter.Fill(ds, "a");
                return ds;
            }
        }
    }
}
