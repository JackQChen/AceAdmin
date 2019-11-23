using Abp.Application.Services;
using Abp.Application.Services.Dto;
using Ace.MultiTenancy.Dto;

namespace Ace.MultiTenancy
{
    public interface ITenantAppService : IAsyncCrudAppService<TenantDto, int, PagedTenantResultRequestDto, CreateTenantDto, TenantDto>
    {
    }
}

