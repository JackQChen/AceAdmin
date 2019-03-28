using System.Collections.Generic;

namespace Ace.Boss.Models
{
    public class MenuViewModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string URL { get; set; }
        public string Icon { get; set; }
        public List<MenuViewModel> SubMenu { get; set; }
    }
}