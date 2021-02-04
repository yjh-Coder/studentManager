using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class NewCourse
    {
        public string cid { get; set; }

        public string cname { get; set; }

        public int credit { get; set; }

        public int hour { get; set; }

        public string begintime { get; set; }

        public string endtime { get; set; }

        public string coursetype { get; set; }

        public string academy { get; set; }

        public string img { get; set; }
        public int typeid { get; set; }
        public int academyid { get; set; }
    }
}
