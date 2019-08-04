using System.Collections.Generic;
using System.Threading.Tasks;
using Ace.Core.Page;
using Ace.Dto;

namespace Ace.Service.Role
{
    public interface IRoleService
    {
        Task<List<RoleDto>> GetListAsnyc();

        Task<PageResult> GetPageListAsync(PageOption pageOption, string strSearch = null);
        Task<PageResult> GetUserPageListAsync(int roleId, PageOption pageOption, string strSearch = null, bool except = false);
        void AddRoleUser(int roleId, int[] userIdList);
        void DeleteRoleUser(int roleId, int[] userIdList);
        IRoleService Init(int roleId);
        RoleDto Data { get; set; }
        Task Delete(int roleId);
    }
}