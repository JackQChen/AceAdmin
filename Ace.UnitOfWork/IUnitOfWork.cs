using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Ace.Core.Data;
using Ace.Entity;
using Microsoft.EntityFrameworkCore.Storage;

namespace Ace.UnitOfWork
{
    public interface IUnitOfWork : IDisposable
    {
        IRepository<Sys_Error_Log> SysErrorLogRep { get; }
        IRepository<Sys_Menu> SysMenuRep { get; }
        IRepository<Sys_Operation_Log> SysOperationLogRep { get; }
        IRepository<Sys_Role> SysRoleRep { get; }
        IRepository<Sys_Role_Menu> SysRoleMenuRep { get; }
        IRepository<Sys_Role_User> SysRoleUserRep { get; }
        IRepository<Sys_User> SysUserRep { get; }
        IRepository<Sys_User_Menu> SysUserMenuRep { get; }

        IDbContextTransaction BeginTransaction();

        int SaveChanges();
        Task<int> SaveChangesAsync();
        List<T> SqlQuery<T>(string sql, object param = null) where T : class;
        Task<List<T>> SqlQueryAsync<T>(string sql, object param = null) where T : class;
    }
}