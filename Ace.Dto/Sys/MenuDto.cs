using System;
using System.Collections.Generic;
using System.Text;

namespace Ace.Dto
{
    public class MenuDto
    {
        public int MenuID { get; set; }
        public string MenuName { get; set; }
        public int ParentID { get; set; }
        public string URL { get; set; }
        public int Sort { get; set; }
        public string Icon { get; set; }
    }
}
