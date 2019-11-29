using System.Linq;
using Abp.Authorization;
using Abp.Localization;

namespace Ace.Authorization
{
    public class AceAuthorizationProvider : AuthorizationProvider
    {
        public override void SetPermissions(IPermissionDefinitionContext context)
        {
            var permissionNames = typeof(PermissionNames).GetFields().Select(s => s.Name).ToArray();
            BuildPermissionTree(context, null, permissionNames, 1);
        }

        /// <summary>
        /// 构建权限树
        /// </summary>
        /// <param name="context"></param>
        /// <param name="parent"></param>
        /// <param name="permissionNames"></param>
        /// <param name="level"></param>
        private void BuildPermissionTree(IPermissionDefinitionContext context, Permission parent, string[] permissionNames, int level)
        {
            foreach (var permissionName in permissionNames.Where(p => p.Count(c => c == '_') == level && p.StartsWith(parent == null ? "" : parent.Name)))
            {
                Permission permission = null;
                if (parent == null)
                {
                    permission = context.CreatePermission(permissionName, L(permissionName));
                }
                else
                {
                    permission = parent.CreateChildPermission(permissionName, L(permissionName));
                }
                BuildPermissionTree(context, permission, permissionNames, level + 1);
            }
        }

        private static ILocalizableString L(string name)
        {
            return new LocalizableString(name, AceConsts.LocalizationSourceName);
        }
    }
}
