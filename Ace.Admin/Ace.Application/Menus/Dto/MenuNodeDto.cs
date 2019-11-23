using System.Collections.Generic;
using Abp.AutoMapper;

namespace Ace.Menus.Dto
{
    [AutoMapFrom(typeof(MenuDto))]
    public class MenuNodeDto
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Icon { get; set; }

        public string Url { get; set; }

        public List<MenuNodeDto> Children { get; set; }

        public string CustomData { get; set; }

    }
}
