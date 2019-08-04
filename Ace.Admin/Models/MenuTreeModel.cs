using System.Collections.Generic;

namespace Ace.Admin.Models
{
    public class MenuTreeModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string URL { get; set; }
        public string Icon { get; set; }
        public List<MenuTreeModel> SubMenu { get; set; }
    }
}