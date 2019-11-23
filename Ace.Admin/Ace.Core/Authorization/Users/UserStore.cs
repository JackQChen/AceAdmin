using System;
using System.Globalization;
using System.Threading;
using System.Threading.Tasks;
using Abp;
using Abp.Authorization.Users;
using Abp.Domain.Repositories;
using Abp.Domain.Uow;
using Abp.Linq;
using Abp.Organizations;
using Ace.Authorization.Roles;

namespace Ace.Authorization.Users
{
    public class UserStore : AbpUserStore<Role, User>
    {
        private readonly IRepository<Role> _roleRepository;
        public UserStore(
            IUnitOfWorkManager unitOfWorkManager,
            IRepository<User, long> userRepository,
            IRepository<Role> roleRepository,
            IAsyncQueryableExecuter asyncQueryableExecuter,
            IRepository<UserRole, long> userRoleRepository,
            IRepository<UserLogin, long> userLoginRepository,
            IRepository<UserClaim, long> userClaimRepository,
            IRepository<UserPermissionSetting, long> userPermissionSettingRepository,
            IRepository<UserOrganizationUnit, long> userOrganizationUnitRepository,
            IRepository<OrganizationUnitRole, long> organizationUnitRoleRepository)
            : base(
                unitOfWorkManager,
                userRepository,
                roleRepository,
                asyncQueryableExecuter,
                userRoleRepository,
                userLoginRepository,
                userClaimRepository,
                userPermissionSettingRepository,
                userOrganizationUnitRepository,
                organizationUnitRoleRepository)
        {
            _roleRepository = roleRepository;
        }

        public override async Task AddToRoleAsync(User user, string normalizedRoleName, CancellationToken cancellationToken = default(CancellationToken))
        {
            cancellationToken.ThrowIfCancellationRequested();
            Check.NotNull(user, nameof(user));
            Check.NotNull(normalizedRoleName, nameof(normalizedRoleName));
            if (await IsInRoleAsync(user, normalizedRoleName, cancellationToken))
            {
                return;
            }
            var role = await _roleRepository.FirstOrDefaultAsync(r => r.Name == normalizedRoleName);
            if (role == null)
            {
                throw new InvalidOperationException(string.Format(CultureInfo.CurrentCulture, "Role {0} does not exist!", normalizedRoleName));
            }
            await UserRepository.EnsureCollectionLoadedAsync(user, u => u.Roles, cancellationToken);
            user.Roles.Add(new UserRole(user.TenantId, user.Id, role.Id));
        }
    }
}
