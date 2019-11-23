using Abp.AspNetCore.Configuration;
using Abp.Modules;
using Abp.Reflection.Extensions;
using Ace.Configuration;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;

namespace Ace.Web.Host.Startup
{
    [DependsOn(
       typeof(AceWebCoreModule))]
    public class AceWebHostModule : AbpModule
    {
        private readonly IHostingEnvironment _env;
        private readonly IConfigurationRoot _appConfiguration;

        public AceWebHostModule(IHostingEnvironment env)
        {
            _env = env;
            _appConfiguration = env.GetAppConfiguration();
        }

        public override void Initialize()
        {
            Configuration.Modules.AbpAspNetCore().UseMvcDateTimeFormatForAppServices = true;
            IocManager.RegisterAssemblyByConvention(typeof(AceWebHostModule).GetAssembly());
        }
    }
}
