using System.Data.Common;
using Abp.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Ace.EntityFrameworkCore
{
    public static class DbContextConfigurer
    {
        //public static readonly LoggerFactory LoggerFactory = new LoggerFactory(new ILoggerProvider[] { new EFLoggerProvider() });

        public static void Configure<T>(DbContextOptionsBuilder<T> builder, string connectionString) where T : AbpDbContext
        {
            //builder.UseLoggerFactory(LoggerFactory); 
            builder.UseMySql(connectionString);
        }

        public static void Configure<T>(DbContextOptionsBuilder<T> builder, DbConnection connection) where T : AbpDbContext
        {
            builder.UseMySql(connection);
        }
    }
}
