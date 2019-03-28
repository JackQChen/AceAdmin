using Ace.Core.Page;
using Ace.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Ace.Service.Role
{
    public interface IRoleService
    {
        RoleDto Info { get; set; }
        Task<List<RoleDto>> GetListAsnyc();

        Task Delete();
        Task<PageResult<RoleDto>> GetRolePageListAsync(int pageIndex, int pageSze, string roleName = null);
        IRoleService Init(int roleId, int accountId = 0);
        Task<List<int>> GetRoleModuleIdList(int roleId);
        Task RoleModuleSave(int roleId, List<int> moduleIdList);
    }
}