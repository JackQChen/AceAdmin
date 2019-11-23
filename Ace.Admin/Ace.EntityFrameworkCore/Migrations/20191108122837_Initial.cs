using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Ace.Migrations
{
    public partial class Initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Sys_AuditLogs",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    TenantId = table.Column<int>(nullable: true),
                    UserId = table.Column<long>(nullable: true),
                    ServiceName = table.Column<string>(maxLength: 256, nullable: true),
                    MethodName = table.Column<string>(maxLength: 256, nullable: true),
                    Parameters = table.Column<string>(maxLength: 1024, nullable: true),
                    ReturnValue = table.Column<string>(nullable: true),
                    ExecutionTime = table.Column<DateTime>(nullable: false),
                    ExecutionDuration = table.Column<int>(nullable: false),
                    ClientIpAddress = table.Column<string>(maxLength: 64, nullable: true),
                    ClientName = table.Column<string>(maxLength: 128, nullable: true),
                    BrowserInfo = table.Column<string>(maxLength: 512, nullable: true),
                    Exception = table.Column<string>(maxLength: 2000, nullable: true),
                    ImpersonatorUserId = table.Column<long>(nullable: true),
                    ImpersonatorTenantId = table.Column<int>(nullable: true),
                    CustomData = table.Column<string>(maxLength: 2000, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_AuditLogs", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_BackgroundJobs",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    JobType = table.Column<string>(maxLength: 512, nullable: false),
                    JobArgs = table.Column<string>(maxLength: 1048576, nullable: false),
                    TryCount = table.Column<short>(nullable: false),
                    NextTryTime = table.Column<DateTime>(nullable: false),
                    LastTryTime = table.Column<DateTime>(nullable: true),
                    IsAbandoned = table.Column<bool>(nullable: false),
                    Priority = table.Column<byte>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_BackgroundJobs", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_Editions",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    LastModificationTime = table.Column<DateTime>(nullable: true),
                    LastModifierUserId = table.Column<long>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    DeleterUserId = table.Column<long>(nullable: true),
                    DeletionTime = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 32, nullable: false),
                    DisplayName = table.Column<string>(maxLength: 64, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_Editions", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_EntityChangeSets",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    BrowserInfo = table.Column<string>(maxLength: 512, nullable: true),
                    ClientIpAddress = table.Column<string>(maxLength: 64, nullable: true),
                    ClientName = table.Column<string>(maxLength: 128, nullable: true),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    ExtensionData = table.Column<string>(nullable: true),
                    ImpersonatorTenantId = table.Column<int>(nullable: true),
                    ImpersonatorUserId = table.Column<long>(nullable: true),
                    Reason = table.Column<string>(maxLength: 256, nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    UserId = table.Column<long>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_EntityChangeSets", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_Languages",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    LastModificationTime = table.Column<DateTime>(nullable: true),
                    LastModifierUserId = table.Column<long>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    DeleterUserId = table.Column<long>(nullable: true),
                    DeletionTime = table.Column<DateTime>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    Name = table.Column<string>(maxLength: 128, nullable: false),
                    DisplayName = table.Column<string>(maxLength: 64, nullable: false),
                    Icon = table.Column<string>(maxLength: 128, nullable: true),
                    IsDisabled = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_Languages", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_LanguageTexts",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    LastModificationTime = table.Column<DateTime>(nullable: true),
                    LastModifierUserId = table.Column<long>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    LanguageName = table.Column<string>(maxLength: 128, nullable: false),
                    Source = table.Column<string>(maxLength: 128, nullable: false),
                    Key = table.Column<string>(maxLength: 256, nullable: false),
                    Value = table.Column<string>(maxLength: 67108864, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_LanguageTexts", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_Modules",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    LastModificationTime = table.Column<DateTime>(nullable: true),
                    LastModifierUserId = table.Column<long>(nullable: true),
                    Name = table.Column<string>(maxLength: 64, nullable: false),
                    Url = table.Column<string>(maxLength: 128, nullable: false),
                    PermissionName = table.Column<string>(maxLength: 128, nullable: false),
                    TenantId = table.Column<int>(nullable: true),
                    IsActive = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_Modules", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_Notifications",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    NotificationName = table.Column<string>(maxLength: 96, nullable: false),
                    Data = table.Column<string>(maxLength: 1048576, nullable: true),
                    DataTypeName = table.Column<string>(maxLength: 512, nullable: true),
                    EntityTypeName = table.Column<string>(maxLength: 250, nullable: true),
                    EntityTypeAssemblyQualifiedName = table.Column<string>(maxLength: 512, nullable: true),
                    EntityId = table.Column<string>(maxLength: 96, nullable: true),
                    Severity = table.Column<byte>(nullable: false),
                    UserIds = table.Column<string>(maxLength: 131072, nullable: true),
                    ExcludedUserIds = table.Column<string>(maxLength: 131072, nullable: true),
                    TenantIds = table.Column<string>(maxLength: 131072, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_Notifications", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_NotificationSubscriptions",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    UserId = table.Column<long>(nullable: false),
                    NotificationName = table.Column<string>(maxLength: 96, nullable: true),
                    EntityTypeName = table.Column<string>(maxLength: 250, nullable: true),
                    EntityTypeAssemblyQualifiedName = table.Column<string>(maxLength: 512, nullable: true),
                    EntityId = table.Column<string>(maxLength: 96, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_NotificationSubscriptions", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_OrganizationUnitRoles",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    RoleId = table.Column<int>(nullable: false),
                    OrganizationUnitId = table.Column<long>(nullable: false),
                    IsDeleted = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_OrganizationUnitRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_OrganizationUnits",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    LastModificationTime = table.Column<DateTime>(nullable: true),
                    LastModifierUserId = table.Column<long>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    DeleterUserId = table.Column<long>(nullable: true),
                    DeletionTime = table.Column<DateTime>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    ParentId = table.Column<long>(nullable: true),
                    Code = table.Column<string>(maxLength: 95, nullable: false),
                    DisplayName = table.Column<string>(maxLength: 128, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_OrganizationUnits", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_OrganizationUnits_Sys_OrganizationUnits_ParentId",
                        column: x => x.ParentId,
                        principalTable: "Sys_OrganizationUnits",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Sys_TenantNotifications",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    NotificationName = table.Column<string>(maxLength: 96, nullable: false),
                    Data = table.Column<string>(maxLength: 1048576, nullable: true),
                    DataTypeName = table.Column<string>(maxLength: 512, nullable: true),
                    EntityTypeName = table.Column<string>(maxLength: 250, nullable: true),
                    EntityTypeAssemblyQualifiedName = table.Column<string>(maxLength: 512, nullable: true),
                    EntityId = table.Column<string>(maxLength: 96, nullable: true),
                    Severity = table.Column<byte>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_TenantNotifications", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_UserAccounts",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    LastModificationTime = table.Column<DateTime>(nullable: true),
                    LastModifierUserId = table.Column<long>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    DeleterUserId = table.Column<long>(nullable: true),
                    DeletionTime = table.Column<DateTime>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    UserId = table.Column<long>(nullable: false),
                    UserLinkId = table.Column<long>(nullable: true),
                    UserName = table.Column<string>(maxLength: 256, nullable: true),
                    EmailAddress = table.Column<string>(maxLength: 256, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_UserAccounts", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_UserLoginAttempts",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    TenantId = table.Column<int>(nullable: true),
                    TenancyName = table.Column<string>(maxLength: 64, nullable: true),
                    UserId = table.Column<long>(nullable: true),
                    UserNameOrEmailAddress = table.Column<string>(maxLength: 255, nullable: true),
                    ClientIpAddress = table.Column<string>(maxLength: 64, nullable: true),
                    ClientName = table.Column<string>(maxLength: 128, nullable: true),
                    BrowserInfo = table.Column<string>(maxLength: 512, nullable: true),
                    Result = table.Column<byte>(nullable: false),
                    CreationTime = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_UserLoginAttempts", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_UserNotifications",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    TenantId = table.Column<int>(nullable: true),
                    UserId = table.Column<long>(nullable: false),
                    TenantNotificationId = table.Column<Guid>(nullable: false),
                    State = table.Column<int>(nullable: false),
                    CreationTime = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_UserNotifications", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_UserOrganizationUnits",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    UserId = table.Column<long>(nullable: false),
                    OrganizationUnitId = table.Column<long>(nullable: false),
                    IsDeleted = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_UserOrganizationUnits", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_Users",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    LastModificationTime = table.Column<DateTime>(nullable: true),
                    LastModifierUserId = table.Column<long>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    DeleterUserId = table.Column<long>(nullable: true),
                    DeletionTime = table.Column<DateTime>(nullable: true),
                    AuthenticationSource = table.Column<string>(maxLength: 64, nullable: true),
                    UserName = table.Column<string>(maxLength: 256, nullable: false),
                    TenantId = table.Column<int>(nullable: true),
                    EmailAddress = table.Column<string>(maxLength: 256, nullable: true),
                    Name = table.Column<string>(maxLength: 64, nullable: false),
                    Password = table.Column<string>(maxLength: 128, nullable: false),
                    EmailConfirmationCode = table.Column<string>(maxLength: 328, nullable: true),
                    PasswordResetCode = table.Column<string>(maxLength: 328, nullable: true),
                    LockoutEndDateUtc = table.Column<DateTime>(nullable: true),
                    AccessFailedCount = table.Column<int>(nullable: false),
                    IsLockoutEnabled = table.Column<bool>(nullable: false),
                    PhoneNumber = table.Column<string>(maxLength: 32, nullable: true),
                    IsPhoneNumberConfirmed = table.Column<bool>(nullable: false),
                    SecurityStamp = table.Column<string>(maxLength: 128, nullable: true),
                    IsTwoFactorEnabled = table.Column<bool>(nullable: false),
                    IsEmailConfirmed = table.Column<bool>(nullable: false),
                    IsActive = table.Column<bool>(nullable: false),
                    NormalizedUserName = table.Column<string>(maxLength: 256, nullable: false),
                    ConcurrencyStamp = table.Column<string>(maxLength: 128, nullable: true),
                    LastLoginTime = table.Column<DateTime>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_Users", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_Users_Sys_Users_CreatorUserId",
                        column: x => x.CreatorUserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Sys_Users_Sys_Users_DeleterUserId",
                        column: x => x.DeleterUserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Sys_Users_Sys_Users_LastModifierUserId",
                        column: x => x.LastModifierUserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Sys_Features",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    Name = table.Column<string>(maxLength: 128, nullable: false),
                    Value = table.Column<string>(maxLength: 2000, nullable: false),
                    Discriminator = table.Column<string>(nullable: false),
                    EditionId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_Features", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_Features_Sys_Editions_EditionId",
                        column: x => x.EditionId,
                        principalTable: "Sys_Editions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Sys_EntityChanges",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    ChangeTime = table.Column<DateTime>(nullable: false),
                    ChangeType = table.Column<byte>(nullable: false),
                    EntityChangeSetId = table.Column<long>(nullable: false),
                    EntityId = table.Column<string>(maxLength: 48, nullable: true),
                    EntityTypeFullName = table.Column<string>(maxLength: 192, nullable: true),
                    TenantId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_EntityChanges", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_EntityChanges_Sys_EntityChangeSets_EntityChangeSetId",
                        column: x => x.EntityChangeSetId,
                        principalTable: "Sys_EntityChangeSets",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Sys_Menus",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    LastModificationTime = table.Column<DateTime>(nullable: true),
                    LastModifierUserId = table.Column<long>(nullable: true),
                    ParentId = table.Column<int>(nullable: true),
                    Name = table.Column<string>(maxLength: 64, nullable: false),
                    Icon = table.Column<string>(maxLength: 64, nullable: true),
                    ModuleId = table.Column<int>(nullable: true),
                    Order = table.Column<int>(nullable: false),
                    CustomData = table.Column<string>(maxLength: 128, nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    IsActive = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_Menus", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_Menus_Sys_Modules_ModuleId",
                        column: x => x.ModuleId,
                        principalTable: "Sys_Modules",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Sys_Menus_Sys_Menus_ParentId",
                        column: x => x.ParentId,
                        principalTable: "Sys_Menus",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Sys_Roles",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    LastModificationTime = table.Column<DateTime>(nullable: true),
                    LastModifierUserId = table.Column<long>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    DeleterUserId = table.Column<long>(nullable: true),
                    DeletionTime = table.Column<DateTime>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    Name = table.Column<string>(maxLength: 32, nullable: false),
                    IsStatic = table.Column<bool>(nullable: false),
                    IsDefault = table.Column<bool>(nullable: false),
                    ConcurrencyStamp = table.Column<string>(maxLength: 128, nullable: true),
                    Description = table.Column<string>(maxLength: 5000, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_Roles", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_Roles_Sys_Users_CreatorUserId",
                        column: x => x.CreatorUserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Sys_Roles_Sys_Users_DeleterUserId",
                        column: x => x.DeleterUserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Sys_Roles_Sys_Users_LastModifierUserId",
                        column: x => x.LastModifierUserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Sys_Settings",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    LastModificationTime = table.Column<DateTime>(nullable: true),
                    LastModifierUserId = table.Column<long>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    UserId = table.Column<long>(nullable: true),
                    Name = table.Column<string>(maxLength: 190, nullable: false),
                    Value = table.Column<string>(maxLength: 2000, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_Settings", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_Settings_Sys_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Sys_Tenants",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    LastModificationTime = table.Column<DateTime>(nullable: true),
                    LastModifierUserId = table.Column<long>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    DeleterUserId = table.Column<long>(nullable: true),
                    DeletionTime = table.Column<DateTime>(nullable: true),
                    TenancyName = table.Column<string>(maxLength: 64, nullable: false),
                    Name = table.Column<string>(maxLength: 128, nullable: false),
                    ConnectionString = table.Column<string>(maxLength: 1024, nullable: true),
                    IsActive = table.Column<bool>(nullable: false),
                    EditionId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_Tenants", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_Tenants_Sys_Users_CreatorUserId",
                        column: x => x.CreatorUserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Sys_Tenants_Sys_Users_DeleterUserId",
                        column: x => x.DeleterUserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Sys_Tenants_Sys_Editions_EditionId",
                        column: x => x.EditionId,
                        principalTable: "Sys_Editions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Sys_Tenants_Sys_Users_LastModifierUserId",
                        column: x => x.LastModifierUserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Sys_UserClaims",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    UserId = table.Column<long>(nullable: false),
                    ClaimType = table.Column<string>(maxLength: 256, nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_UserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_UserClaims_Sys_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Sys_UserLogins",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    TenantId = table.Column<int>(nullable: true),
                    UserId = table.Column<long>(nullable: false),
                    LoginProvider = table.Column<string>(maxLength: 128, nullable: false),
                    ProviderKey = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_UserLogins", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_UserLogins_Sys_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Sys_UserRoles",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    UserId = table.Column<long>(nullable: false),
                    RoleId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_UserRoles", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_UserRoles_Sys_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Sys_UserTokens",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    TenantId = table.Column<int>(nullable: true),
                    UserId = table.Column<long>(nullable: false),
                    LoginProvider = table.Column<string>(maxLength: 128, nullable: true),
                    Name = table.Column<string>(maxLength: 128, nullable: true),
                    Value = table.Column<string>(maxLength: 512, nullable: true),
                    ExpireDate = table.Column<DateTime>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_UserTokens", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_UserTokens_Sys_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Sys_EntityPropertyChanges",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    EntityChangeId = table.Column<long>(nullable: false),
                    NewValue = table.Column<string>(maxLength: 512, nullable: true),
                    OriginalValue = table.Column<string>(maxLength: 512, nullable: true),
                    PropertyName = table.Column<string>(maxLength: 96, nullable: true),
                    PropertyTypeFullName = table.Column<string>(maxLength: 192, nullable: true),
                    TenantId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_EntityPropertyChanges", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_EntityPropertyChanges_Sys_EntityChanges_EntityChangeId",
                        column: x => x.EntityChangeId,
                        principalTable: "Sys_EntityChanges",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Sys_Permissions",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    Name = table.Column<string>(maxLength: 128, nullable: false),
                    IsGranted = table.Column<bool>(nullable: false),
                    Discriminator = table.Column<string>(nullable: false),
                    RoleId = table.Column<int>(nullable: true),
                    UserId = table.Column<long>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_Permissions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_Permissions_Sys_Roles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "Sys_Roles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Sys_Permissions_Sys_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Sys_Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Sys_RoleClaims",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    TenantId = table.Column<int>(nullable: true),
                    RoleId = table.Column<int>(nullable: false),
                    ClaimType = table.Column<string>(maxLength: 256, nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_RoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_RoleClaims_Sys_Roles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "Sys_Roles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_AuditLogs_TenantId_ExecutionDuration",
                table: "Sys_AuditLogs",
                columns: new[] { "TenantId", "ExecutionDuration" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_AuditLogs_TenantId_ExecutionTime",
                table: "Sys_AuditLogs",
                columns: new[] { "TenantId", "ExecutionTime" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_AuditLogs_TenantId_UserId",
                table: "Sys_AuditLogs",
                columns: new[] { "TenantId", "UserId" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_BackgroundJobs_IsAbandoned_NextTryTime",
                table: "Sys_BackgroundJobs",
                columns: new[] { "IsAbandoned", "NextTryTime" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_EntityChanges_EntityChangeSetId",
                table: "Sys_EntityChanges",
                column: "EntityChangeSetId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_EntityChanges_EntityTypeFullName_EntityId",
                table: "Sys_EntityChanges",
                columns: new[] { "EntityTypeFullName", "EntityId" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_EntityChangeSets_TenantId_CreationTime",
                table: "Sys_EntityChangeSets",
                columns: new[] { "TenantId", "CreationTime" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_EntityChangeSets_TenantId_Reason",
                table: "Sys_EntityChangeSets",
                columns: new[] { "TenantId", "Reason" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_EntityChangeSets_TenantId_UserId",
                table: "Sys_EntityChangeSets",
                columns: new[] { "TenantId", "UserId" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_EntityPropertyChanges_EntityChangeId",
                table: "Sys_EntityPropertyChanges",
                column: "EntityChangeId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Features_EditionId_Name",
                table: "Sys_Features",
                columns: new[] { "EditionId", "Name" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Features_TenantId_Name",
                table: "Sys_Features",
                columns: new[] { "TenantId", "Name" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Languages_TenantId_Name",
                table: "Sys_Languages",
                columns: new[] { "TenantId", "Name" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_LanguageTexts_TenantId_Source_LanguageName_Key",
                table: "Sys_LanguageTexts",
                columns: new[] { "TenantId", "Source", "LanguageName", "Key" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Menus_ModuleId",
                table: "Sys_Menus",
                column: "ModuleId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Menus_ParentId",
                table: "Sys_Menus",
                column: "ParentId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_NotificationSubscriptions_NotificationName_EntityTypeNam~",
                table: "Sys_NotificationSubscriptions",
                columns: new[] { "NotificationName", "EntityTypeName", "EntityId", "UserId" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_NotificationSubscriptions_TenantId_NotificationName_Enti~",
                table: "Sys_NotificationSubscriptions",
                columns: new[] { "TenantId", "NotificationName", "EntityTypeName", "EntityId", "UserId" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_OrganizationUnitRoles_TenantId_OrganizationUnitId",
                table: "Sys_OrganizationUnitRoles",
                columns: new[] { "TenantId", "OrganizationUnitId" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_OrganizationUnitRoles_TenantId_RoleId",
                table: "Sys_OrganizationUnitRoles",
                columns: new[] { "TenantId", "RoleId" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_OrganizationUnits_ParentId",
                table: "Sys_OrganizationUnits",
                column: "ParentId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_OrganizationUnits_TenantId_Code",
                table: "Sys_OrganizationUnits",
                columns: new[] { "TenantId", "Code" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Permissions_TenantId_Name",
                table: "Sys_Permissions",
                columns: new[] { "TenantId", "Name" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Permissions_RoleId",
                table: "Sys_Permissions",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Permissions_UserId",
                table: "Sys_Permissions",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_RoleClaims_RoleId",
                table: "Sys_RoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_RoleClaims_TenantId_ClaimType",
                table: "Sys_RoleClaims",
                columns: new[] { "TenantId", "ClaimType" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Roles_CreatorUserId",
                table: "Sys_Roles",
                column: "CreatorUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Roles_DeleterUserId",
                table: "Sys_Roles",
                column: "DeleterUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Roles_LastModifierUserId",
                table: "Sys_Roles",
                column: "LastModifierUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Settings_UserId",
                table: "Sys_Settings",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Settings_TenantId_Name_UserId",
                table: "Sys_Settings",
                columns: new[] { "TenantId", "Name", "UserId" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Sys_TenantNotifications_TenantId",
                table: "Sys_TenantNotifications",
                column: "TenantId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Tenants_CreatorUserId",
                table: "Sys_Tenants",
                column: "CreatorUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Tenants_DeleterUserId",
                table: "Sys_Tenants",
                column: "DeleterUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Tenants_EditionId",
                table: "Sys_Tenants",
                column: "EditionId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Tenants_LastModifierUserId",
                table: "Sys_Tenants",
                column: "LastModifierUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Tenants_TenancyName",
                table: "Sys_Tenants",
                column: "TenancyName");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserAccounts_EmailAddress",
                table: "Sys_UserAccounts",
                column: "EmailAddress");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserAccounts_UserName",
                table: "Sys_UserAccounts",
                column: "UserName");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserAccounts_TenantId_EmailAddress",
                table: "Sys_UserAccounts",
                columns: new[] { "TenantId", "EmailAddress" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserAccounts_TenantId_UserId",
                table: "Sys_UserAccounts",
                columns: new[] { "TenantId", "UserId" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserAccounts_TenantId_UserName",
                table: "Sys_UserAccounts",
                columns: new[] { "TenantId", "UserName" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserClaims_UserId",
                table: "Sys_UserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserClaims_TenantId_ClaimType",
                table: "Sys_UserClaims",
                columns: new[] { "TenantId", "ClaimType" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserLoginAttempts_UserId_TenantId",
                table: "Sys_UserLoginAttempts",
                columns: new[] { "UserId", "TenantId" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserLoginAttempts_TenancyName_UserNameOrEmailAddress_Res~",
                table: "Sys_UserLoginAttempts",
                columns: new[] { "TenancyName", "UserNameOrEmailAddress", "Result" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserLogins_UserId",
                table: "Sys_UserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserLogins_TenantId_UserId",
                table: "Sys_UserLogins",
                columns: new[] { "TenantId", "UserId" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserLogins_TenantId_LoginProvider_ProviderKey",
                table: "Sys_UserLogins",
                columns: new[] { "TenantId", "LoginProvider", "ProviderKey" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserNotifications_UserId_State_CreationTime",
                table: "Sys_UserNotifications",
                columns: new[] { "UserId", "State", "CreationTime" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserOrganizationUnits_TenantId_OrganizationUnitId",
                table: "Sys_UserOrganizationUnits",
                columns: new[] { "TenantId", "OrganizationUnitId" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserOrganizationUnits_TenantId_UserId",
                table: "Sys_UserOrganizationUnits",
                columns: new[] { "TenantId", "UserId" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserRoles_UserId",
                table: "Sys_UserRoles",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserRoles_TenantId_RoleId",
                table: "Sys_UserRoles",
                columns: new[] { "TenantId", "RoleId" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserRoles_TenantId_UserId",
                table: "Sys_UserRoles",
                columns: new[] { "TenantId", "UserId" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Users_CreatorUserId",
                table: "Sys_Users",
                column: "CreatorUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Users_DeleterUserId",
                table: "Sys_Users",
                column: "DeleterUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Users_LastModifierUserId",
                table: "Sys_Users",
                column: "LastModifierUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_Users_TenantId_NormalizedUserName",
                table: "Sys_Users",
                columns: new[] { "TenantId", "NormalizedUserName" });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserTokens_UserId",
                table: "Sys_UserTokens",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserTokens_TenantId_UserId",
                table: "Sys_UserTokens",
                columns: new[] { "TenantId", "UserId" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Sys_AuditLogs");

            migrationBuilder.DropTable(
                name: "Sys_BackgroundJobs");

            migrationBuilder.DropTable(
                name: "Sys_EntityPropertyChanges");

            migrationBuilder.DropTable(
                name: "Sys_Features");

            migrationBuilder.DropTable(
                name: "Sys_Languages");

            migrationBuilder.DropTable(
                name: "Sys_LanguageTexts");

            migrationBuilder.DropTable(
                name: "Sys_Menus");

            migrationBuilder.DropTable(
                name: "Sys_Notifications");

            migrationBuilder.DropTable(
                name: "Sys_NotificationSubscriptions");

            migrationBuilder.DropTable(
                name: "Sys_OrganizationUnitRoles");

            migrationBuilder.DropTable(
                name: "Sys_OrganizationUnits");

            migrationBuilder.DropTable(
                name: "Sys_Permissions");

            migrationBuilder.DropTable(
                name: "Sys_RoleClaims");

            migrationBuilder.DropTable(
                name: "Sys_Settings");

            migrationBuilder.DropTable(
                name: "Sys_TenantNotifications");

            migrationBuilder.DropTable(
                name: "Sys_Tenants");

            migrationBuilder.DropTable(
                name: "Sys_UserAccounts");

            migrationBuilder.DropTable(
                name: "Sys_UserClaims");

            migrationBuilder.DropTable(
                name: "Sys_UserLoginAttempts");

            migrationBuilder.DropTable(
                name: "Sys_UserLogins");

            migrationBuilder.DropTable(
                name: "Sys_UserNotifications");

            migrationBuilder.DropTable(
                name: "Sys_UserOrganizationUnits");

            migrationBuilder.DropTable(
                name: "Sys_UserRoles");

            migrationBuilder.DropTable(
                name: "Sys_UserTokens");

            migrationBuilder.DropTable(
                name: "Sys_EntityChanges");

            migrationBuilder.DropTable(
                name: "Sys_Modules");

            migrationBuilder.DropTable(
                name: "Sys_Roles");

            migrationBuilder.DropTable(
                name: "Sys_Editions");

            migrationBuilder.DropTable(
                name: "Sys_EntityChangeSets");

            migrationBuilder.DropTable(
                name: "Sys_Users");
        }
    }
}
