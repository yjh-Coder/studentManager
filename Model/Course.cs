using System;
using System.Collections.Generic;
using System.Text;

namespace Model
{
    public class Course
    {
        public string cid { get; set; }

        public string cname { get; set; }

        public int credit { get; set; }

        public int hour { get; set; }

        public string begintime { get; set; }

        public string endtime { get; set; }

        public int typeid { get; set; }

        public int academyid { get; set; }

        public string img { get; set; }

        public bool is_teach { get; set; }
    }
}
