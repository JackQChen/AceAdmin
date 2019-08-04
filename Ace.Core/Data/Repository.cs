using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;

namespace Ace.Core.Data
{
    public class Repository<T> : IRepository<T> where T : class
    {
        DbContext _dbContext;
        public Repository(DbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public int SaveChanges()
        {
            return _dbContext.SaveChanges();
        }
        public async Task<int> SaveChangesAsync()
        {
            return await _dbContext.SaveChangesAsync();
        }
        public void Disposed()
        {
            throw new Exception("不允许在此处释放上下文，请在UnitOfWork中操作");
            //_dbContext.Dispose();
        }

        #region 插入数据
        public bool Insert(T entity, bool isSaveChange = true)
        {
            _dbContext.Set<T>().Add(entity);
            if (isSaveChange)
            {
                return SaveChanges() > 0;
            }
            return false;
        }
        public async Task<bool> InsertAsync(T entity, bool isSaveChange = true)
        {
            _dbContext.Set<T>().Add(entity);
            if (isSaveChange)
            {
                return await SaveChangesAsync() > 0;
            }
            return false;
        }
        public bool Insert(List<T> entitys, bool isSaveChange = true)
        {
            _dbContext.Set<T>().AddRange(entitys);
            if (isSaveChange)
            {
                return SaveChanges() > 0;
            }
            return false;
        }
        public async Task<bool> InsertAsync(List<T> entitys, bool isSaveChange = true)
        {
            _dbContext.Set<T>().AddRange(entitys);
            if (isSaveChange)
            {
                return await SaveChangesAsync() > 0;
            }
            return false;
        }
        #endregion

        #region 更新数据
        public bool Update(T entity, bool isSaveChange = true, List<string> updatePropertyList = null)
        {
            if (entity == null)
            {
                return false;
            }
            _dbContext.Set<T>().Attach(entity);
            if (updatePropertyList == null)
            {
                _dbContext.Entry(entity).State = EntityState.Modified;//全部字段更新
            }
            else
            {
                updatePropertyList.ForEach(c =>
                {
                    _dbContext.Entry(entity).Property(c).IsModified = true; //部分字段更新
                });
            }
            if (isSaveChange)
            {
                return SaveChanges() > 0;
            }
            return false;
        }
        public bool Update(List<T> entitys, bool isSaveChange = true)
        {
            if (entitys == null || entitys.Count == 0)
            {
                return false;
            }
            entitys.ForEach(c =>
            {
                Update(c, false);
            });
            if (isSaveChange)
            {
                return SaveChanges() > 0;
            }
            return false;
        }
        public async Task<bool> UpdateAsync(T entity, bool isSaveChange = true, List<string> updatePropertyList = null)
        {
            if (entity == null)
            {
                return false;
            }
            _dbContext.Set<T>().Attach(entity);
            if (updatePropertyList == null)
            {
                _dbContext.Entry<T>(entity).State = EntityState.Modified;//全字段更新

            }
            else
            {
                updatePropertyList.ForEach(c =>
                {
                    _dbContext.Entry(entity).Property(c).IsModified = true; //部分字段更新的写法

                });

            }
            if (isSaveChange)
            {
                return await SaveChangesAsync() > 0;
            }
            return false;
        }
        public async Task<bool> UpdateAsync(List<T> entitys, bool isSaveChange = true)
        {
            if (entitys == null || entitys.Count == 0)
            {
                return false;
            }
            entitys.ForEach(c =>
            {
                _dbContext.Set<T>().Attach(c);
                _dbContext.Entry<T>(c).State = EntityState.Modified;
            });
            if (isSaveChange)
            {
                return await SaveChangesAsync() > 0;
            }
            return false;
        }
        #endregion

        #region 删除
        public bool Delete(T entity, bool isSaveChange = true)
        {
            _dbContext.Set<T>().Attach(entity);
            _dbContext.Set<T>().Remove(entity);
            return isSaveChange ? SaveChanges() > 0 : false;
        }
        public bool Delete(List<T> entitys, bool isSaveChange = true)
        {
            entitys.ForEach(entity =>
            {
                _dbContext.Set<T>().Attach(entity);
                _dbContext.Set<T>().Remove(entity);
            });
            return isSaveChange ? SaveChanges() > 0 : false;
        }
        public bool Delete(Expression<Func<T, bool>> predicate, bool isSaveChange = true)
        {
            return Delete(GetList(predicate), isSaveChange);
        }
        public async Task<bool> DeleteAsync(T entity, bool isSaveChange = true)
        {
            _dbContext.Set<T>().Attach(entity);
            _dbContext.Set<T>().Remove(entity);
            return isSaveChange ? await SaveChangesAsync() > 0 : false;
        }
        public async Task<bool> DeleteAsync(List<T> entitys, bool isSaveChange = true)
        {
            entitys.ForEach(entity =>
            {
                _dbContext.Set<T>().Attach(entity);
                _dbContext.Set<T>().Remove(entity);
            });
            return isSaveChange ? await SaveChangesAsync() > 0 : false;
        }
        public async Task<bool> DeleteAsync(Expression<Func<T, bool>> predicate, bool isSaveChange = true)
        {
            return await DeleteAsync(await GetListAsync(predicate), isSaveChange);
        }
        #endregion

        public IQueryable<T> Query => _dbContext.Set<T>().AsQueryable().AsNoTracking();

        public DatabaseFacade Database => _dbContext.Database;

        #region 查找
        public T Get(params object[] keys)
        {
            return _dbContext.Set<T>().Find(keys);
        }
        public T Get(Expression<Func<T, bool>> predicate = null)
        {
            if (predicate == null)
                predicate = c => true;
            return _dbContext.Set<T>().Where(predicate).AsNoTracking().FirstOrDefault();
        }
        public async Task<T> GetAsync(params object[] keys)
        {
            return await _dbContext.Set<T>().FindAsync(keys);
        }
        public async Task<T> GetAsync(Expression<Func<T, bool>> predicate = null)
        {
            if (predicate == null)
                predicate = c => true;
            return await _dbContext.Set<T>().Where(predicate).AsNoTracking().FirstOrDefaultAsync();
        }
        public List<T> GetList(Expression<Func<T, bool>> predicate = null)
        {
            if (predicate == null)
                predicate = c => true;
            return _dbContext.Set<T>().Where(predicate).AsNoTracking().ToList();
        }
        public async Task<List<T>> GetListAsync(Expression<Func<T, bool>> predicate = null)
        {
            if (predicate == null)
                predicate = c => true;
            return await _dbContext.Set<T>().Where(predicate).AsNoTracking().ToListAsync();
        }
        public async Task<IQueryable<T>> QueryAsync(Expression<Func<T, bool>> predicate = null)
        {
            if (predicate == null)
                predicate = c => true;
            return await Task.Run(() => _dbContext.Set<T>().Where(predicate).AsNoTracking());
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
        #endregion

    }
}
