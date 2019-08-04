using System.Linq;
using System.Threading.Tasks;

namespace Ace.Core.Page
{
    public static class PageExtension
    {
        public static PageResult ToPageResult(this IQueryable<object> query, PageOption pageOption)
        {
            return new PageResult(query, pageOption);
        }

        public static async Task<PageResult> ToPageResultAsync(this IQueryable<object> query, PageOption pageOption)
        {
            return await Task.Run(() => { return new PageResult(query, pageOption); });
        }

        public static PageResult<T> ToPageResultT<T>(this IQueryable<T> query, PageOption pageOption)
        {
            return new PageResult<T>(query, pageOption);
        }

        public static async Task<PageResult<T>> ToPageResultTAsync<T>(this IQueryable<T> query, PageOption pageOption)
        {
            return await Task.Run(() => { return new PageResult<T>(query, pageOption); });
        }
    }
}
