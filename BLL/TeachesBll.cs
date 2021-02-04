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
    public class TeachesBll
    {
        TeachesDal th = new TeachesDal();
        public DataSet getTeaches()
        {
            return th.getTeaches();
        }

        public DataSet selectRecordByTid(string tid)
        {
            return th.selectRecordByTid(tid);
        }

        public DataSet selectRecordByCid(string cid)
        {
            return th.selectRecordByCid(cid);
        }

        public DataSet selectRecordByInfo(string A, string B)
        {
            return th.selectRecordByInfo(A, B);
        }

        public DataSet selectRecordByInfo(List<string> list, string B)
        {
            return th.selectRecordByInfo(list, B);
        }

        public bool addRecord(Teaches teaches)
        {
            return th.addRecord(teaches) > 0;
        }

        public bool updateRecord(Teaches teaches)
        {
            return th.updateRecord(teaches) > 0;
        }

        public bool deleteRecord(string tid, string cid, string classid)
        {
            return th.deleteRecord(tid, cid, classid) > 0;
        }
    }

}
