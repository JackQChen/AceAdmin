using Abp.AutoMapper;
using Abp.Modules;
using Abp.Reflection.Extensions;
using Ace.Authorization;

namespace Ace
{
    [DependsOn(
        typeof(AceCoreModule), 
        typeof(AbpAutoMapperModule))]
    public class AceApplicationModule : AbpModule
    {
        public override void PreInitialize()
        {
            Configuration.Authorization.Providers.Add<AceAuthorizationProvider>();
        }

        public override void Initialize()
        {
            var thisAssembly = typeof(AceApplicationModule).GetAssembly();

            IocManager.RegisterAssemblyByConvention(thisAssembly);

            Configuration.Modules.AbpAutoMapper().Configurators.Add(
                // Scan the assembly for classes which inherit from AutoMapper.Profile
                cfg => cfg.AddMaps(thisAssembly)
            );
        }
    }
}
