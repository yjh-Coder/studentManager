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
    public class TeacherBll
    {
        TeacherDal teacherDal = new TeacherDal();

        public DataSet GetTeachers()
        {
            return teacherDal.GetTeachers();
        }

        public List<Teacher> selectTeacherByid1(string tid)
        {
            return teacherDal.selectTeacherByid1(tid);
        }


        /// <summary>
        /// 模糊查询
        /// </summary>
        /// <param name="tid"></param>
        /// <returns></returns>
        public DataSet selectTeacherByid(string tid)
        {
            return teacherDal.selectTeacherByid(tid);
        }

        public DataSet selectTeacherByName(string tname)
        {
            return teacherDal.selectTeacherByName(tname);
        }

        public DataSet selectTeacherByInfo(string A, string B)
        {
            return teacherDal.selectTeacherByInfo(A, B);
        }

        public DataSet selectTeacherByInfo(List<string> list, string B)
        {
            return teacherDal.selectTeacherByInfo(list, B);
        }

        public bool AddTeacher(Teacher t)
        {
            return teacherDal.AddTeacher(t) > 0;
        }

        public bool EditTeacher(Teacher t)
        {
            return teacherDal.EditTeacher(t)>0;
        }

        public bool DeleteTeacher(string tid)
        {
            return teacherDal.DeleteTeacher(tid) > 0;
        }

    }
}
