using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class SystemswitchBll
    {
        SystemswitchDal systemswitchDal = new SystemswitchDal();

        public List<System_Switch> getSwitch()
        {
            return systemswitchDal.getSwitch();
        }

        public bool update(System_Switch system_switch)
        {
            return systemswitchDal.update(system_switch) > 0;
        }

    }
}
