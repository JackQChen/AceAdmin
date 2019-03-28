using System.Collections.Generic;
using Ace.Dto;

namespace Ace.Service.Menu
{
    public interface IMenuService
    {
        int MenuID { get; set; }
        MenuDto Data { get; set; }
        void GetMenuByParentId(List<MenuDto> menuList, int parentId);
    }
}