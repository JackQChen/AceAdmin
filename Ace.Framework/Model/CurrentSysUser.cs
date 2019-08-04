using System;
using System.Collections.Generic;

namespace Ace.Framework.Model
{
    [Serializable]
    public class CurrentSysUser
    {
        public int UserID { get; set; }
        public string LoginName { get; set; }
        public string UserName { get; set; }
        public List<CurrentSysUserMenu> MenuList { get; set; }
    }
}
