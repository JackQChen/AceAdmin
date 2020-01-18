using System.Collections.Generic;
using System.Threading.Tasks;
using Abp.Application.Services;
using Ace.Menus.Dto;
using Ace.Sessions.Dto;

namespace Ace.Sessions
{
    public interface ISessionAppService : IApplicationService
    {
        Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformations();
        Task<List<MenuNodeDto>> GetMenuTree(int? parentId);
    }
}
