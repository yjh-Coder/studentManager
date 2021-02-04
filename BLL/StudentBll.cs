using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Model;

namespace BLL
{
   public class StudentBll
    {

        StudentDal studentDal = new StudentDal();
        public DataSet GetStudents()
        {
            return studentDal.GetStudents();
        }

        public List<New_Student> getStudentById(string sno)
        {
            return studentDal.getStudentById(sno);

        }

        public DataSet getStudentsById(string sname)
        {
            return studentDal.getStudentsById(sname);
        }

        public DataSet getStudentsByInfo(string a,string b)
        {
            return studentDal.getStudentsByInfo(a, b);
        }

        public DataSet getStudentByInfo(List<string> list,string b)
        {
            return studentDal.getStudentByInfo(list, b);
        }

        public int AddStudent(Student s)
        {
            return studentDal.AddStudent(s);
        }

        public int EditStudent(Student s)
        {
            return studentDal.EditStudent(s);
        }

        public int DeleteStudent(string sno)
        {
            return studentDal.DeleteStudent(sno);
        }

        public DataSet getStudentsByName(string name)
        {
            return studentDal.getStudentsByName(name);
        }

       
    }
}
