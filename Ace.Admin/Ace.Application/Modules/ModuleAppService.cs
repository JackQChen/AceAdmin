using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Authorization;
using Abp.Domain.Repositories;
using Ace.Authorization;
using Ace.Common.Dto;
using Ace.Modules.Dto;
using Microsoft.EntityFrameworkCore;

namespace Ace.Modules
{
    /// <summary>
    /// 模块管理
    /// </summary>
    [AbpAuthorize(PermissionNames.Admin_Modules)]
    public class ModuleAppService : AsyncCrudAppService<Module, ModuleDto, int, CommonRequestDto>
    {
        public ModuleAppService(
            IRepository<Module> repository)
            : base(repository)
        {
        }

        public async Task<List<ModuleDto>> GetModuleTree(int? parentId)
        {
            var menuList = await Repository.GetAll().ToListAsync();
            return menuList
                .Where(p => p.ParentId == parentId)
                .Select(s => ObjectMapper.Map<ModuleDto>(s)).ToList();
        }
    }
}
