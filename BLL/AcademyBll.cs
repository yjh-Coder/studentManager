using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class AcademyBll
    {
        AcademyDal academyDal = new AcademyDal();

        public List<Academy> GetAcademies()
        {
            return academyDal.GetAcademies();
        }

        public DataSet GetAcademies1()
        {
            return academyDal.GetAcademies1();
        }


    }
}
