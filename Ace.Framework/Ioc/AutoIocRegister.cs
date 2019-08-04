using System.Linq;
using System.Reflection;
using System.Runtime.Loader;
using System.Text;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyModel;

namespace Ace.Framework.Ioc
{
    public static class AutoIocRegister
    {
        /// <summary>
        /// 动态注入IOC，注意类和接口的命名规则，接口在类名前面加"I"
        /// </summary>
        /// <param name="services"></param>
        /// <param name="assemblyName">程序集名称</param>
        public static void BatchAddScoped(this IServiceCollection services, string assemblyName)
        {
            var libs = DependencyContext.Default.CompileLibraries;
            var serviceLib = libs.Where(c => c.Name.Contains(assemblyName)).FirstOrDefault();
            var assembly = AssemblyLoadContext.Default.LoadFromAssemblyName(new AssemblyName(serviceLib.Name));
            var serviceClassList = assembly.GetTypes().Where(c => c.IsClass).ToList();
            foreach (var item in serviceClassList)
            {
                var interfaceName = "I" + item.Name;
                var interfaceType = assembly.GetTypes().Where(c => c.IsInterface && c.Name == interfaceName).FirstOrDefault();
                if (interfaceType == null)
                    continue;
                services.AddScoped(interfaceType, item);
            }
        }
    }
}
