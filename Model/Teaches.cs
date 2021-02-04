using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Teaches
    {
        public string tid { get; set; }
        public string cid { get; set; }
        public string tname { get; set; }
        public string cname { get; set; }
        public string hour { get; set; }
        public double credit { get; set; }

        public int typeid { get; set; }
        public string coursetype { get; set; }
        public int titleid { get; set; }
        public string title { get; set; }
        public string academyid { get; set; }
        public string academy { get; set; }
        public string professionid { get; set; }
        public string profession { get; set; }

        public string classid { get; set; }
        public string classname { get; set; }
        public int count { get; set; }
        public int selected { get; set; }

    }
}
