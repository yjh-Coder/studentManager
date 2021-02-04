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
    public class SystemswitchDal
    {
        public List<System_Switch> getSwitch()
        {
            string sql = @"select system,select_course,drop_course,give_score from system_switch";
            List<System_Switch> list = new List<System_Switch>();
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text);
            while (reader.Read())
            {
                System_Switch system = new System_Switch();
                system.system = reader.GetBoolean(0);
                system.select_course = reader.GetBoolean(1);
                system.drop_course = reader.GetBoolean(2);
                system.give_score = reader.GetBoolean(3);
                list.Add(system);
            }
            reader.Close();
            return list;
        }

        public int update(System_Switch system_switch)
        {
            string sql = @"update system_switch set system=@system,select_course=@select_course,drop_course=@drop_course
                            ,give_score=@give_score where id = 1";
            SqlParameter[] sp =
            {
                new SqlParameter("@system",system_switch.system),
                new SqlParameter("@select_course",system_switch.select_course),
                new SqlParameter("@drop_course",system_switch.drop_course),
                new SqlParameter("@give_score",system_switch.give_score)
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,sp:sp);
        }
    }
}
