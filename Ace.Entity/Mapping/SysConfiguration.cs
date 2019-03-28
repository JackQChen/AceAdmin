using Ace.Core.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Ace.Entity.Mapping
{
    public class Sys_Error_LogConfiguration : EntityTypeConfiguration<Sys_Error_Log>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_Error_Log> builder)
        {
            builder.ToTable("sys_error_log");
            builder.HasKey(x => x.ID);
            base.RelyConfigure(builder);
        }

    }
    public class Sys_ModuleConfiguration : EntityTypeConfiguration<Sys_Menu>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_Menu> builder)
        {
            builder.ToTable("sys_menu");
            builder.HasKey(x => x.ID);
            base.RelyConfigure(builder);
        }

    }

    public class Sys_Operation_LogConfiguration : EntityTypeConfiguration<Sys_Operation_Log>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_Operation_Log> builder)
        {
            builder.ToTable("sys_operation_log");
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
    public class Sys_PermissionConfiguration : EntityTypeConfiguration<Sys_Role_Menu>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_Role_Menu> builder)
        {
            builder.ToTable("sys_role_menu");
            builder.HasKey(x => x.ID);
            base.RelyConfigure(builder);
        }

    }
    public class Sys_Role_UserConfiguration : EntityTypeConfiguration<Sys_Role_User>
    {
        public override void RelyConfigure(EntityTypeBuilder<Sys_Role_User> builder)
        {
            builder.ToTable("sys_role_user");
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
            builder.HasKey(x => x.ID);
            base.RelyConfigure(builder);
        }

    }
}
