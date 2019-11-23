using Abp.Application.Services;
using Abp.Authorization;
using Abp.Domain.Repositories;
using Ace.Authorization;
using Ace.Common.Dto;
using Ace.Modules.Dto;

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
    }
}
