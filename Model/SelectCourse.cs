using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    class SelectCourse
    {
        public string sno { get; set; }

        public string cid { get; set; }
        public string tid { get; set; }
        public string tname { get; set; }
        public string cname { get; set; }
        public string sname { get; set; }
        public int classid { get; set; }
        public string classname { get; set; }
        public int academyid { get; set; }
        public string academy { get; set; }
       
        public float grade { get; set; }
        public float usual_grade { get; set; }
        public float midterm_grade { get; set; }
        public float final_grade { get; set; }
        public string time { get; set; }
      
    }
}
