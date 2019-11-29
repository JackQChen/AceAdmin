using System.Collections.Generic;
using Abp.Configuration;
using Abp.Localization;
using Abp.Zero.Configuration;

namespace Ace.Configuration
{
    public class AppSettingProvider : SettingProvider
    {
        public override IEnumerable<SettingDefinition> GetSettingDefinitions(SettingDefinitionProviderContext context)
        {
            return new[]
            {
                       new SettingDefinition(
                           AbpZeroSettingNames.UserManagement.UserLockOut.IsEnabled,
                           "true",
                           new FixedLocalizableString("Is user lockout enabled."),
                           scopes: SettingScopes.Application | SettingScopes.Tenant,
                           clientVisibilityProvider: new VisibleSettingClientVisibilityProvider()
                           ),
                       new SettingDefinition(
                           AbpZeroSettingNames.UserManagement.PasswordComplexity.RequiredLength,
                           "1",
                           new FixedLocalizableString("Required length."),
                           scopes: SettingScopes.Application | SettingScopes.Tenant,
                           clientVisibilityProvider: new VisibleSettingClientVisibilityProvider()
                           )
            };
        }
    }
}
