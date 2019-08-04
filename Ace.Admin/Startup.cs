using System.Threading.Tasks;
using Ace.Admin.Models;
using Ace.Core.Cache;
using Ace.Core.Http;
using Ace.Core.Service;
using Ace.Entity;
using Ace.Framework.Filter;
using Ace.Framework.Ioc;
using Ace.UnitOfWork;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json.Serialization;

namespace Ace.Admin
{
    public class Startup
    {
        public Startup(IConfiguration configuration, IHostingEnvironment env)
        {
            Configuration = configuration;
            HostingEnvironment = env;
        }

        public IConfiguration Configuration { get; }
        public IHostingEnvironment HostingEnvironment { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //配置EF的连接字符串
            //services.AddDbContext<EfDbContext>(options => options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));

            //Migration
            //services.AddDbContext<EfDbContext>(options => options.UseMySql(Configuration.GetConnectionString("DefaultConnection"), b => b.MigrationsAssembly("Ace.Admin")));
            services.AddDbContext<EfDbContext>(options => options.UseMySql(Configuration.GetConnectionString("DefaultConnection")));

            //使用UnitOfWork代替Repository，在UnitOfWork中直接new Repository，不在这里依赖注入了
            //services.AddScoped(typeof(IRepository<>), typeof(EfRespository<>));
            services.AddScoped(typeof(IUnitOfWork), typeof(EfUnitOfWork));

            //内存缓存单例模式
            services.AddSingleton<ICacheManager, CacheManager>();
            //动态注册IOC
            services.BatchAddScoped("Ace.Service");

            services.AddSession();
            services.AddHttpContextAccessor();

            LogService.Info("系统重启");
            services.Configure<ProjectSetting>(Configuration.GetSection("ProjectSetting"));
            services.AddMemoryCache();//启用内存缓存
            services.AddMvc(options =>
            {
                options.Filters.Add<GlobalExceptionFilter>();//异常过滤器
                options.Filters.Add(typeof(GlobalAuthorizeFilter));//权限过滤器
            }).AddJsonOptions(options =>
            {
                options.SerializerSettings.ContractResolver = new DefaultContractResolver();//取消驼峰命名
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            app.UseStaticHttpContext();
            if (env.IsDevelopment())//开发环境，使用异常页面显示异常
            {
                app.UseDeveloperExceptionPage();
                // app.UseExceptionHandler(builder => builder.Run(async context => await ErrorEvent(context)));
            }
            else
            {
                // app.UseExceptionHandler("/Home/Error");
                app.UseExceptionHandler(builder => builder.Run(async context => await ErrorEvent(context)));
            }
            app.UseStaticFiles();
            app.UseSession();
            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "area",
                    template: "{area:exists}/{controller}/{action=Index}/{id?}");
                routes.MapRoute(
                    name: "login",
                    template: "{controller=Account}/{action=Login}");
                routes.MapRoute(
                    name: "default",
                    template: "{controller}/{action=Index}/{id?}");
            });
        }
        public Task ErrorEvent(Microsoft.AspNetCore.Http.HttpContext context)
        {
            var feature = context.Features.Get<IExceptionHandlerFeature>();
            var error = feature?.Error;
            var path = ((ExceptionHandlerFeature)feature).Path;
            LogService.Info(path + "，错误信息:" + error.Message);
            throw error;
        }
    }
}
