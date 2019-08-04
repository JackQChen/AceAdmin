using Ace.Core.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Ace.Entity.Mapping
{
    public class Sys_AssetConfiguration : EntityTypeConfiguration<Sys_Asset>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_Asset> builder)
        {
            builder.ToTable("sys_asset");
            builder.HasKey(x => x.ID);
            base.RelyConfigure(builder);
        }
    }

    public class Sys_Info_LogConfiguration : EntityTypeConfiguration<Sys_Info_Log>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_Info_Log> builder)
        {
            builder.ToTable("sys_info_log");
            builder.HasKey(x => x.ID);
            base.RelyConfigure(builder);
        }
    }
    public class Sys_Error_LogConfiguration : EntityTypeConfiguration<Sys_Error_Log>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_Error_Log> builder)
        {
            builder.ToTable("sys_error_log");
            builder.HasKey(x => x.ID);
            base.RelyConfigure(builder);
        }
    }
    public class Sys_MenuConfiguration : EntityTypeConfiguration<Sys_Menu>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_Menu> builder)
        {
            builder.ToTable("sys_menu");
            builder.HasKey(x => x.ID);
            base.RelyConfigure(builder);
        }
    }
    public class Sys_RoleConfiguration : EntityTypeConfiguration<Sys_Role>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_Role> builder)
        {
            builder.ToTable("sys_role");
            builder.HasKey(x => x.ID);
            base.RelyConfigure(builder);
        }
    }
    public class Sys_Role_MenuConfiguration : EntityTypeConfiguration<Sys_Role_Menu>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_Role_Menu> builder)
        {
            builder.ToTable("sys_role_menu");
            builder.HasKey(x => new { x.RoleID, x.MenuID });
            base.RelyConfigure(builder);
        }
    }
    public class Sys_Role_UserConfiguration : EntityTypeConfiguration<Sys_Role_User>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_Role_User> builder)
        {
            builder.ToTable("sys_role_user");
            builder.HasKey(x => new { x.RoleID, x.UserID });
            base.RelyConfigure(builder);
        }
    }
    public class Sys_DeptConfiguration : EntityTypeConfiguration<Sys_Dept>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_Dept> builder)
        {
            builder.ToTable("sys_dept");
            builder.HasKey(x => x.ID);
            base.RelyConfigure(builder);
        }
    }
    public class Sys_UserConfiguration : EntityTypeConfiguration<Sys_User>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_User> builder)
        {
            builder.ToTable("sys_user");
            builder.HasKey(x => x.ID);
            base.RelyConfigure(builder);
        }
    }
    public class Sys_User_MenuConfiguration : EntityTypeConfiguration<Sys_User_Menu>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_User_Menu> builder)
        {
            builder.ToTable("sys_user_menu");
            builder.HasKey(x => new { x.UserID, x.MenuID });
            base.RelyConfigure(builder);
        }
    }
}
