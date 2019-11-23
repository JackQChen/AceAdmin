using System.Threading;
using System.Threading.Tasks;
using Abp;
using Abp.Authorization.Roles;
using Abp.Domain.Repositories;
using Abp.Domain.Uow;
using Ace.Authorization.Users;

namespace Ace.Authorization.Roles
{
    public class RoleStore : AbpRoleStore<Role, User>
    {
        private readonly IRepository<Role> _roleRepository;
        public RoleStore(
            IUnitOfWorkManager unitOfWorkManager,
            IRepository<Role> roleRepository,
            IRepository<RolePermissionSetting, long> rolePermissionSettingRepository)
            : base(
                unitOfWorkManager,
                roleRepository,
                rolePermissionSettingRepository)
        {
            _roleRepository = roleRepository;
        }

        public override Task<Role> FindByNameAsync(string normalizedName, CancellationToken cancellationToken = default(CancellationToken))
        {
            cancellationToken.ThrowIfCancellationRequested();
            Check.NotNull(normalizedName, nameof(normalizedName));
            return _roleRepository.FirstOrDefaultAsync(r => r.Name == normalizedName);
        }
    }
}
