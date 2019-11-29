using Abp.Authorization;
using Ace.Authorization.Roles;
using Ace.Authorization.Users;

namespace Ace.Authorization
{
    public class PermissionChecker : PermissionChecker<Role, User>
    {
        public PermissionChecker(UserManager userManager)
            : base(userManager)
        {
        }
    }
}
