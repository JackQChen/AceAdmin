using System;
using System.Linq;
using System.Reflection;
using Ace.Core.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace Ace.Entity
{
    public class EfDbContext : DbContext
    {
        public static readonly LoggerFactory LoggerFactory = new LoggerFactory(new[] { new EFLoggerProvider() });
        public EfDbContext(DbContextOptions<EfDbContext> options) : base(options)
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseLoggerFactory(LoggerFactory);
            base.OnConfiguring(optionsBuilder);
        }

        //首次执行
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //获取当前程序集中基类为泛型的类
            var typesToRegister = Assembly.GetExecutingAssembly().GetTypes().Where(c => c.BaseType != null && c.BaseType.IsGenericType).ToList();
            foreach (var type in typesToRegister)
            {
                //泛型定义相同
                if (type.BaseType.GetGenericTypeDefinition() == typeof(EntityTypeConfiguration<>))
                {
                    dynamic configurationInstance = Activator.CreateInstance(type);
                    modelBuilder.ApplyConfiguration(configurationInstance);
                }
            }
            base.OnModelCreating(modelBuilder);
        }
    }
}
