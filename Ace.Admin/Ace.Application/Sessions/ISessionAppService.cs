using System.Threading.Tasks;
using Abp.Application.Services;
using Ace.Sessions.Dto;

namespace Ace.Sessions
{
    public interface ISessionAppService : IApplicationService
    {
        Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformations();
    }
}
