using System.Linq;
using System.Linq.Dynamic.Core;
using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Application.Services.Dto;
using Abp.Auditing;
using Abp.Authorization;
using Abp.Domain.Repositories;
using Abp.Extensions;
using Abp.Linq.Extensions;
using Ace.AuditLogs.Dto;
using Ace.Authorization;
using Microsoft.EntityFrameworkCore;

namespace Ace.AuditLogs
{
    /// <summary>
    /// 审计日志
    /// </summary>
    [DisableAuditing]
    [AbpAuthorize(PermissionNames.Admin_AuditLog)]
    public class AuditLogAppService : ApplicationService
    {
        IRepository<AuditLog, long> _repository;

        public AuditLogAppService(
            IRepository<AuditLog, long> repository)
        {
            _repository = repository;
        }

        public async Task<PagedResultDto<AuditLogDto>> GetAll(AuditLogQuery input)
        {
            var query = _repository.GetAll()
                   .WhereIf(input.UserId.HasValue, p => p.UserId == input.UserId)
                   .WhereIf(!input.ClientIpAddress.IsNullOrWhiteSpace(), p => p.ClientIpAddress.Contains(input.ClientIpAddress))
                   .WhereIf(!input.Keyword.IsNullOrWhiteSpace(), p => p.ServiceName.Contains(input.Keyword) || p.MethodName.Contains(input.Keyword))
                   .WhereIf(input.StartTime.HasValue, x => x.ExecutionTime > input.StartTime)
                   .WhereIf(input.EndTime.HasValue, x => x.ExecutionTime < input.EndTime)
                   ;
            var totalCount = await query.CountAsync();
            if (!input.Sorting.IsNullOrWhiteSpace())
                query = query.OrderBy(input.Sorting);
            query = query.Skip(input.SkipCount).Take(input.MaxResultCount);
            var entities = await query.ToListAsync();
            return new PagedResultDto<AuditLogDto>(
                totalCount,
                entities.Select(s => ObjectMapper.Map<AuditLogDto>(s)).ToList()
            );
        }
    }
}
