using System.Threading.Tasks;
using Abp.Application.Services;
using Ace.Authorization.Accounts.Dto;

namespace Ace.Authorization.Accounts
{
    public interface IAccountAppService : IApplicationService
    {
        Task<IsTenantAvailableOutput> IsTenantAvailable(IsTenantAvailableInput input);

        Task<RegisterOutput> Register(RegisterInput input);
    }
}
