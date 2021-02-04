using Common;
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
    public class AdminDal
    {

        //获取所有的用户
        public DataSet GetAdmins()
        {
            string sql = @"select * from Admin";
            return SqlHelper.ExecuteAdater(sql);
        }

        //
        public DataSet Login(Admin admin)
        {
            string sql = @"select * from Admin where admin=@admin and password=@password";
            SqlParameter[] sp =
            {
                new SqlParameter("@admin",admin.admin),
                new SqlParameter("@password",admin.password)
            };
            return SqlHelper.ExecuteAdater(sql, sp: sp);
        }

        public int AddAdmin(Admin admin)
        {
            string sql = "insert into Admin select @admin,@password,@identify";
            admin.password = Md5Helper.GetMd5(admin.password);        //进行md5加密
            SqlParameter[] sp ={
                                new SqlParameter("@admin",admin.admin),
                                new SqlParameter("@password",admin.password),
                                new SqlParameter("@identify",admin.identify)
                              };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp: sp);
        }

        public int UpdateAdmin(Admin admin)
        {
            string sql = "update admin set password=@password where admin=@admin";
            admin.password = Md5Helper.GetMd5(admin.password);      //重新输入密码后进行md5加密
            SqlParameter[] sp ={
                                new SqlParameter("@admin",admin.admin),
                                new SqlParameter("@password",admin.password)
                              };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp: sp);
        }


        public List<Admin> selectAdmin(string admin)
        {
            string sql = @"select * from admin where admin=@admin";
            SqlParameter[] sp =
            {
                new SqlParameter("@admin",admin)
            };
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text, sp: sp);
            List<Admin> list = new List<Admin>();
            while (reader.Read())
            {
                Admin a = new Admin();
                a.admin = reader.GetString(0);
                a.password = reader.GetString(1);
                a.identify = reader.GetInt32(2);
                list.Add(a);
            }
            reader.Close();
            return list;
        }

        public int DeleteAdmin(string admin)
        {
            string sql = @"delete from admin where admin=@admin";
            SqlParameter[] sp =
            {
                new SqlParameter("@admin",admin)
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp: sp);
        }

        //public int Scalar(Admin a)
        //{
        //    string sql = "select COUNT(*) from Admin where admin=@admin and password=@password";
        //    SqlParameter[] sp ={
        //                        new SqlParameter("@LoginId",a.LoginId),
        //                        new SqlParameter("@LoginPwd",a.LoginPwd)
        //                      };
        //    return SqlHelper.ExecuteScalar(sql, sp);
        //}


    }
}
