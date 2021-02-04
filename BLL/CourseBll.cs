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
    public class CourseBll
    {
        CourseDal courseDal = new CourseDal();

        public List<NewCourse> GetCourses()
        {
            return courseDal.GetCourses();
        }

        public DataSet GetCourses1()
        {
            return courseDal.GetCourses1();
        }

        public List<Course> selectCourseByid1(string courseid)
        {
            return courseDal.selectCourseByid1(courseid);
        }

        public List<NewCourse> selectCourseByid2(string courseid)
        {
            return courseDal.selectCourseByid2(courseid);
        }

        public DataSet selectCourseByid(string courseid)
        {
            return courseDal.selectCourseByid(courseid);
        }

        public DataSet selectCourseByAcademyAndType(string academy, string type)
        {
            return courseDal.selectCourseByAcademyAndType(academy, type);
        }

        public DataSet selectCourseByName(string coursename)
        {
            return courseDal.selectCourseByName(coursename);
        }

        public DataSet selectCourseByInfo(string A,string B)
        {
            return courseDal.selectCourseByInfo(A, B);
        }

        
        public DataSet selectCourseByInfo(List<string> list,string B)
        {
            return courseDal.selectCourseByInfo(list, B);
        }

        public bool AddCourse(Course course)
        {
            return courseDal.AddCourse(course) > 0;
        }

        public bool EditCourse(Course course)
        {
            return courseDal.EditCourse(course)>0;
        }

        public bool DeleteCourse(string courseid)
        {
            return courseDal.DeleteCourse(courseid) > 0;
        }

    }
}
