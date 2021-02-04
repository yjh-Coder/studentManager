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
    public class CourseTypeBll
    {
        CourseTypeDal courseTypeDal = new CourseTypeDal();

        public List<CourseType> GetCourseTypes()
        {
            return courseTypeDal.GetCourseType();
        }

        public DataSet GetCourseType1()
        {
            return courseTypeDal.GetCourseType1();
        }

    }
}
