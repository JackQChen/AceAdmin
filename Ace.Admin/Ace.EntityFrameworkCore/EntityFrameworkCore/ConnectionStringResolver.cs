using System;
using System.Collections.Concurrent;
using System.IO;
using Abp.Configuration.Startup;
using Abp.Domain.Uow;
using Ace.Configuration;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;

namespace Ace.EntityFrameworkCore
{
    public class ConnectionStringResolver : DefaultConnectionStringResolver
    {
        ConcurrentDictionary<Type, string> dicConnection = new ConcurrentDictionary<Type, string>();

        public ConnectionStringResolver(
            IAbpStartupConfiguration configuration,
            IHostingEnvironment env)
            : base(configuration)
        {
            var configurationRoot = AppConfigurations.Get(Path.Combine(env.ContentRootPath, "Configuration"));
            dicConnection.TryAdd(typeof(AceDbContext), configurationRoot.GetConnectionString(AceConsts.ConnectionStringName));
        }

        public override string GetNameOrConnectionString(ConnectionStringResolveArgs args)
        {
            var connectString = string.Empty;
            if (dicConnection.TryGetValue(args["DbContextConcreteType"] as Type, out connectString))
            {
                return connectString;
            }
            return base.GetNameOrConnectionString(args);
        }
    }
}
