using Abp.Configuration.Startup;
using Abp.Domain.Uow;
using Abp.EntityFrameworkCore;
using Abp.EntityFrameworkCore.Configuration;
using Abp.Modules;
using Abp.Reflection.Extensions;
using Abp.Zero.EntityFrameworkCore;

namespace Ace.EntityFrameworkCore
{
    [DependsOn(
        typeof(AceCoreModule),
        typeof(AbpZeroCoreEntityFrameworkCoreModule))]
    public class AceEntityFrameworkModule : AbpModule
    {

        public override void PreInitialize()
        {
            Configuration.ReplaceService<IConnectionStringResolver, ConnectionStringResolver>();
            AddDbContext<AceDbContext>(); 
        }

        private void AddDbContext<TDbContext>() where TDbContext : AbpDbContext
        {
            Configuration.Modules.AbpEfCore().AddDbContext<TDbContext>(options =>
            {
                if (options.ExistingConnection != null)
                {
                    DbContextConfigurer.Configure(options.DbContextOptions, options.ExistingConnection);
                }
                else
                {
                    DbContextConfigurer.Configure(options.DbContextOptions, options.ConnectionString);
                }
            });
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(AceEntityFrameworkModule).GetAssembly());
        }
    }
}
