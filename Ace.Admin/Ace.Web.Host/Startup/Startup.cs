using System;
using System.IO;
using System.Linq;
using System.Reflection;
using Abp.AspNetCore;
using Abp.AspNetCore.SignalR.Hubs;
using Abp.Castle.Logging.Log4Net;
using Abp.Dependency;
using Abp.Extensions;
using Abp.PlugIns;
using Ace.Configuration;
using Ace.Identity;
using Ace.Web.Host.Filters;
using Castle.Facilities.Logging;
using Castle.MicroKernel.ModelBuilder.Inspectors;
using Castle.MicroKernel.SubSystems.Conversion;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Cors.Internal;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Swashbuckle.AspNetCore.Swagger;

namespace Ace.Web.Host.Startup
{
    public class Startup
    {
        private const string _defaultCorsPolicyName = "localhost";

        private readonly IConfigurationRoot _appConfiguration;

        public Startup(IHostingEnvironment env)
        {
            _appConfiguration = env.GetAppConfiguration();
        }

        public IServiceProvider ConfigureServices(IServiceCollection services)
        {
            // MVC
            services.AddMvc(
                options =>
                {
                    options.Filters.Add(new CorsAuthorizationFilterFactory(_defaultCorsPolicyName));
                    options.Filters.AddService(typeof(HttpGlobalExceptionFilter), order: 1);
                }
            )
            .AddJsonOptions(options =>
            {
                options.SerializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";
            })
            .SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
            services.Configure<FormOptions>(x =>
            {
                x.ValueLengthLimit = int.MaxValue;
                x.MultipartBodyLengthLimit = int.MaxValue;
            });

            IdentityRegistrar.Register(services);
            AuthConfigurer.Configure(services, _appConfiguration);

            //SignalR
            services.AddSignalR();

            // Configure CORS for angular2 UI
            services.AddCors(
                options => options.AddPolicy(
                    _defaultCorsPolicyName,
                    builder => builder
                        //.WithOrigins(
                        //    // App:CorsOrigins in appsettings.json can contain more than one address separated by comma.
                        //    _appConfiguration["App:CorsOrigins"]
                        //        .Split(",", StringSplitOptions.RemoveEmptyEntries)
                        //        .Select(o => o.RemovePostFix("/"))
                        //        .ToArray()
                        //)
                        .AllowAnyOrigin()
                        .AllowAnyHeader()
                        .AllowAnyMethod()
                        .AllowCredentials()
                )
            );

            // Swagger - Enable this line and the related lines in Configure method to enable swagger UI
            services.AddSwaggerGen(options =>
            {
                options.SwaggerDoc("v1", new Info { Title = "Ace API", Version = "v1" });
                options.DocInclusionPredicate((docName, description) => true);

                // Define the BearerAuth scheme that's in use
                options.AddSecurityDefinition("bearerAuth", new ApiKeyScheme()
                {
                    Description = "JWT Authorization header using the Bearer scheme. Example: \"Authorization: Bearer {token}\"",
                    Name = "Authorization",
                    In = "header",
                    Type = "apiKey"
                });
                //将注释添加到Swagger文档中
                var xmlPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Ace.Application.xml");
                if (File.Exists(xmlPath))
                    options.IncludeXmlComments(xmlPath, true);
                //添加插件模块文档描述
                var pluginPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "PlugIns");
                foreach (var path in Directory.GetFiles(pluginPath, "*.xml", SearchOption.AllDirectories))
                {
                    options.IncludeXmlComments(xmlPath, true);
                }
            });

            // Configure Abp and Dependency Injection
            return services.AddAbp<AceWebHostModule>(
                bootstrapper =>
                {
                    //Configure Log4Net logging
                    bootstrapper.IocManager.IocContainer.AddFacility<LoggingFacility>(f => f.UseAbpLog4Net().WithConfig($"Configuration{Path.DirectorySeparatorChar}log4net.config"));
                    //添加插件
                    var path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "PlugIns");
                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);
                    bootstrapper.PlugInSources.AddFolder(path, SearchOption.AllDirectories);
                    //处理调试时循环引用错误
                    var propInjector = bootstrapper.IocManager.IocContainer.Kernel.ComponentModelBuilder
                    .Contributors
                    .OfType<PropertiesDependenciesModelInspector>()
                    .Single();
                    bootstrapper.IocManager.IocContainer.Kernel.ComponentModelBuilder.RemoveContributor(propInjector);
                    bootstrapper.IocManager.IocContainer.Kernel.ComponentModelBuilder.AddContributor(new AbpPropertiesDependenciesModelInspector(new DefaultConversionManager()));
                }
            );
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            app.UseAbp(options => { options.UseAbpRequestLocalization = false; }); // Initializes ABP framework.

            app.UseCors(_defaultCorsPolicyName); // Enable CORS!

            app.UseStaticFiles();

            app.UseAuthentication();

            app.UseAbpRequestLocalization();

            app.UseSignalR(routes =>
            {
                routes.MapHub<AbpCommonHub>("/signalr");
            });

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "defaultWithArea",
                    template: "{area}/{controller=Home}/{action=Index}/{id?}");

                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });

            // Enable middleware to serve generated Swagger as a JSON endpoint
            app.UseSwagger();
            // Enable middleware to serve swagger-ui assets (HTML, JS, CSS etc.)
            app.UseSwaggerUI(options =>
            {
                options.SwaggerEndpoint(_appConfiguration["App:ServerRootAddress"].EnsureEndsWith('/') + "swagger/v1/swagger.json", "Ace API V1");
                options.IndexStream = () => Assembly.GetExecutingAssembly()
                    .GetManifestResourceStream("Ace.Web.Host.wwwroot.swagger.ui.index.html");
            }); // URL: /swagger
        }
    }
}
