using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class AdminBll
    {
        AdminDal admin = new AdminDal();

        public bool AddAdmin(Admin a)
        {
            return admin.AddAdmin(a) > 0;
        }

        public DataSet GetAdmins()
        {
            return admin.GetAdmins();
        }

        public bool Login(Admin a)
        {
            DataSet ds = admin.Login(a);
            DataTable dataTable = ds.Tables[0];
            if (!(dataTable.Rows.Count == 0))
            {
                return true;
            }
            else
                return false;
        }

        public bool UpdateAdmin(Admin a)
        {
            return admin.UpdateAdmin(a) > 0;
        }


        public List<Admin> selectAdmin(string a)
        {
            return admin.selectAdmin(a);
        }

        public bool DeleteAdmin(string a)
        {
            return admin.DeleteAdmin(a) > 0;
        }

    }
}
