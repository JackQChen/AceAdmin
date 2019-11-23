using System;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using Abp.Application.Services;
using Abp.AspNetCore;
using Abp.AspNetCore.Configuration;
using Abp.AspNetCore.SignalR;
using Abp.Modules;
using Abp.Reflection.Extensions;
using Abp.Zero.Configuration;
using Ace.Authentication.JwtBearer;
using Ace.Configuration;
using Ace.EntityFrameworkCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace Ace
{
    [DependsOn(
        typeof(AceApplicationModule),
        typeof(AceEntityFrameworkModule),
        typeof(AbpAspNetCoreModule),
        typeof(AbpAspNetCoreSignalRModule)
     )]
    public class AceWebCoreModule : AbpModule
    {
        private readonly IHostingEnvironment _env;
        private readonly IConfigurationRoot _appConfiguration;

        public AceWebCoreModule(IHostingEnvironment env)
        {
            _env = env;
            _appConfiguration = env.GetAppConfiguration();
        }

        public override void PreInitialize()
        {
            Configuration.DefaultNameOrConnectionString = _appConfiguration.GetConnectionString(AceConsts.ConnectionStringName);

            // Use database for language management
            Configuration.Modules.Zero().LanguageManagement.EnableDbLocalization();

            var config = Configuration.Modules.AbpAspNetCore();
            //添加默认控制器
            config.CreateControllersForAppServices(typeof(AceApplicationModule).GetAssembly());
            //获取包含实现IApplicationService接口的程序集
            var path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "PlugIns");
            var plugins = Directory.GetFiles(path, "*.dll", SearchOption.AllDirectories)
                .Select(s => Assembly.LoadFile(s))
                .Where(p => p.GetTypes().Any(t => t.GetInterface(nameof(IApplicationService)) != null))
                .ToArray();
            //为插件模块生成控制器
            foreach (var plugin in plugins)
            {
                config.CreateControllersForAppServices(plugin);
            }

            ConfigureTokenAuth();
        }

        private void ConfigureTokenAuth()
        {
            IocManager.Register<TokenAuthConfiguration>();
            var tokenAuthConfig = IocManager.Resolve<TokenAuthConfiguration>();

            tokenAuthConfig.SecurityKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(_appConfiguration["Authentication:JwtBearer:SecurityKey"]));
            tokenAuthConfig.Issuer = _appConfiguration["Authentication:JwtBearer:Issuer"];
            tokenAuthConfig.Audience = _appConfiguration["Authentication:JwtBearer:Audience"];
            tokenAuthConfig.SigningCredentials = new SigningCredentials(tokenAuthConfig.SecurityKey, SecurityAlgorithms.HmacSha256);
            tokenAuthConfig.Expiration = TimeSpan.FromDays(1);
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(AceWebCoreModule).GetAssembly());
        }
    }
}
