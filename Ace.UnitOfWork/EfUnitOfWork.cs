using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using Ace.Core.Dapper;
using Ace.Core.Data;
using Ace.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;

namespace Ace.UnitOfWork
{

    public class EfUnitOfWork : IUnitOfWork
    {
        private EfDbContext _dbContext;
        public EfUnitOfWork(EfDbContext context)
        {
            this._dbContext = context;
        }
        public int SaveChanges()
        {
            return _dbContext.SaveChanges();
        }
        public async Task<int> SaveChangesAsync()
        {
            return await _dbContext.SaveChangesAsync();
        }
        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _dbContext.Dispose();//随工作单元销毁
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        public IDbContextTransaction BeginTransaction()
        {
            return _dbContext.Database.BeginTransaction();
        }

        public List<T> SqlQuery<T>(string sql, object param = null) where T : class
        {
            var conn = _dbContext.Database.GetDbConnection();
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            var list = DapperReader.SqlQuery<T>(conn, sql, param);
            return list;
        }

        public Task<List<T>> SqlQueryAsync<T>(string sql, object param = null) where T : class
        {
            throw new NotImplementedException();
        }

        #region Sys Repository
        private IRepository<Sys_Asset> _sysAssetRep;
        public IRepository<Sys_Asset> SysAssetRep
        {
            get
            {
                if (_sysAssetRep == null)
                    _sysAssetRep = new Repository<Sys_Asset>(_dbContext);
                return _sysAssetRep;
            }
        }
        private IRepository<Sys_User> _sysUserRep;
        public IRepository<Sys_User> SysUserRep
        {
            get
            {
                if (_sysUserRep == null)
                    _sysUserRep = new Repository<Sys_User>(_dbContext);
                return _sysUserRep;
            }
        }
        private IRepository<Sys_User_Menu> _sysUserMenuRep;
        public IRepository<Sys_User_Menu> SysUserMenuRep
        {
            get
            {
                if (_sysUserMenuRep == null)
                    _sysUserMenuRep = new Repository<Sys_User_Menu>(_dbContext);
                return _sysUserMenuRep;
            }
        }
        private IRepository<Sys_Role> _sysRoleRep;
        public IRepository<Sys_Role> SysRoleRep
        {
            get
            {
                if (_sysRoleRep == null)
                    _sysRoleRep = new Repository<Sys_Role>(_dbContext);
                return _sysRoleRep;
            }
        }
        private IRepository<Sys_Role_User> _sysRoleUserRep;
        public IRepository<Sys_Role_User> SysRoleUserRep
        {
            get
            {
                if (_sysRoleUserRep == null)
                    _sysRoleUserRep = new Repository<Sys_Role_User>(_dbContext);
                return _sysRoleUserRep;
            }
        }

        private IRepository<Sys_Role_Menu> _sysRoleMenuRep;
        public IRepository<Sys_Role_Menu> SysRoleMenuRep
        {
            get
            {
                if (_sysRoleMenuRep == null)
                    _sysRoleMenuRep = new Repository<Sys_Role_Menu>(_dbContext);
                return _sysRoleMenuRep;
            }
        }
        private IRepository<Sys_Menu> _sysMenuRep;
        public IRepository<Sys_Menu> SysMenuRep
        {
            get
            {
                if (_sysMenuRep == null)
                    _sysMenuRep = new Repository<Sys_Menu>(_dbContext);
                return _sysMenuRep;
            }
        }

        private IRepository<Sys_Info_Log> _sysInfoLogRep;
        public IRepository<Sys_Info_Log> SysInfoLogRep
        {
            get
            {
                if (_sysInfoLogRep == null)
                    _sysInfoLogRep = new Repository<Sys_Info_Log>(_dbContext);
                return _sysInfoLogRep;
            }
        }

        private IRepository<Sys_Error_Log> _sysErrorLogRep;
        public IRepository<Sys_Error_Log> SysErrorLogRep
        {
            get
            {
                if (_sysErrorLogRep == null)
                    _sysErrorLogRep = new Repository<Sys_Error_Log>(_dbContext);
                return _sysErrorLogRep;
            }
        }
        private IRepository<Sys_Dept> _sysDeptRep;
        public IRepository<Sys_Dept> SysDeptRep
        {
            get
            {
                if (_sysDeptRep == null)
                    _sysDeptRep = new Repository<Sys_Dept>(_dbContext);
                return _sysDeptRep;
            }
        }
        #endregion

    }
}
