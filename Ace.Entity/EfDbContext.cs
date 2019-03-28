using Ace.Core.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Reflection;

namespace Ace.Entity
{
    public class EfDbContext : DbContext
    {
        public EfDbContext(DbContextOptions<EfDbContext> options) : base(options)
        {
        }
        //配置数据库连接
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            // optionsBuilder.UseSqlServer("xxxx connection string");
            base.OnConfiguring(optionsBuilder);
        }

        //第一次使用EF功能时执行一次，以后不再执行
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //获取当前程序集中有基类并且基类是泛型的类
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
