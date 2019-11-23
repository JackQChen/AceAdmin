using Abp.Configuration;
using Abp.Zero.EntityFrameworkCore;
using Ace.Authorization.Roles;
using Ace.Authorization.Users;
using Ace.Menus;
using Ace.Modules;
using Ace.MultiTenancy;
using Microsoft.EntityFrameworkCore;

namespace Ace.EntityFrameworkCore
{
    public class AceDbContext : AbpZeroDbContext<Tenant, Role, User, AceDbContext>
    {
        /* Define a DbSet for each entity of the application */
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<Module> Departments { get; set; }

        public AceDbContext(DbContextOptions<AceDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            //index length limit
            modelBuilder.Entity<Setting>()
                .Property(p => p.Name)
                .HasMaxLength(190);
            AbpZeroDbModelBuilderExtensions.ChangeAbpTablePrefix<Tenant, Role, User>(modelBuilder, "Sys_");
            //menu
            modelBuilder.Entity<Menu>()
                .HasMany(e => e.Children)
                .WithOne(e => e.Parent)
                .HasForeignKey(e => e.ParentId)
                .OnDelete(DeleteBehavior.ClientSetNull);
            //user
            modelBuilder.Entity<User>()
                .Property(p => p.EmailAddress)
                .IsRequired(false);
            modelBuilder.Entity<User>()
                .Ignore(p => p.Surname)
                .Ignore(p => p.NormalizedEmailAddress);
            //role
            modelBuilder.Entity<Role>()
                .Ignore(p => p.DisplayName)
                .Ignore(p => p.NormalizedName);
        }
    }
}
