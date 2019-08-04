using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore.Infrastructure;

namespace Ace.Core.Data
{
    public interface IRepository<T> where T : class
    {
        DatabaseFacade Database { get; }
        IQueryable<T> Query { get; }
        int SaveChanges();
        Task<int> SaveChangesAsync();
        void Disposed();

        bool Delete(List<T> entitys, bool isSaveChange = true);
        bool Delete(T entity, bool isSaveChange = true);
        bool Delete(Expression<Func<T, bool>> predicate, bool isSaveChange = true);
        Task<bool> DeleteAsync(List<T> entitys, bool isSaveChange = true);
        Task<bool> DeleteAsync(T entity, bool isSaveChange = true);
        Task<bool> DeleteAsync(Expression<Func<T, bool>> predicate, bool isSaveChange = true);

        T Get(params object[] keys);
        T Get(Expression<Func<T, bool>> predicate = null);
        Task<T> GetAsync(params object[] keys);
        Task<T> GetAsync(Expression<Func<T, bool>> predicate = null);
        List<T> GetList(Expression<Func<T, bool>> predicate = null);
        Task<List<T>> GetListAsync(Expression<Func<T, bool>> predicate = null);
        Task<IQueryable<T>> QueryAsync(Expression<Func<T, bool>> predicate = null);

        bool Insert(List<T> entitys, bool isSaveChange = true);
        bool Insert(T entity, bool isSaveChange = true);
        Task<bool> InsertAsync(List<T> entitys, bool isSaveChange = true);
        Task<bool> InsertAsync(T entity, bool isSaveChange = true);

        bool Update(List<T> entitys, bool isSaveChange = true);
        bool Update(T entity, bool isSaveChange = true, List<string> updatePropertyList = null);
        Task<bool> UpdateAsync(List<T> entitys, bool isSaveChange = true);
        Task<bool> UpdateAsync(T entity, bool isSaveChange = true, List<string> updatePropertyList = null);


    }
}
