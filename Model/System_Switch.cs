using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class System_Switch
    {
        public int id { get; set; }
        public bool system { get; set; }
        public bool select_course { get; set; }
        public bool give_score { get; set; }      
        
        public bool drop_course { get; set; }
        
    }
}
