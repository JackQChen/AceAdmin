using System.Collections.Generic;
using System.Threading.Tasks;
using Ace.Core.Page;
using Ace.Dto;

namespace Ace.Service.Menu
{
    public interface IMenuService
    {
        Task<List<MenuDto>> GetListAsnyc();
        void GetMenuByParentId(List<MenuDto> menuList, int parentId);
        Task<PageResult> GetPageListAsync(PageOption pageOption, string strSearch = null);
        IMenuService Init(int menuId);
        MenuDto Data { get; set; }
        Task Delete(int menuId);
    }
}