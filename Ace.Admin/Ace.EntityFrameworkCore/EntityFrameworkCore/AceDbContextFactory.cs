using System.IO;
using Abp.Reflection.Extensions;
using Ace.Configuration;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;

namespace Ace.EntityFrameworkCore
{
    /* This class is needed to run "dotnet ef ..." commands from command line on development. Not used anywhere else */
    public class AceDbContextFactory : IDesignTimeDbContextFactory<AceDbContext>
    {
        public AceDbContext CreateDbContext(string[] args)
        {
            var builder = new DbContextOptionsBuilder<AceDbContext>();
            var configPath = new DirectoryInfo(typeof(AceEntityFrameworkModule).GetAssembly().Location).Parent.FullName + "\\Configuration";
            var configuration = AppConfigurations.Get(configPath);
            DbContextConfigurer.Configure(builder, configuration.GetConnectionString(AceConsts.ConnectionStringName));
            return new AceDbContext(builder.Options);
        }
    }
}
