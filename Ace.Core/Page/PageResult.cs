using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace Ace.Core.Page
{
    /// <summary>
    /// 匿名对象分页数据
    /// </summary>
    public class PageResult : PageResult<object>
    {
        public PageResult(IQueryable<object> query, PageOption option)
            : base(query, option)
        {
        }
    }
    /// <summary>
    /// 泛型对象分页数据
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class PageResult<T>
    {
        public PageOption PageOption { get; set; }
        public int TotalRows { get; set; }
        public int TotalPages { get; set; }
        public List<T> DataList { get; set; }

        public PageResult(IQueryable<T> query, PageOption option)
        {
            var orderList = option.OrderList;
            var pageSize = option.PageSize;
            //支持匿名对象
            var dataType = query.ElementType;
            if (orderList != null)
            {
                for (int i = 0; i < orderList.Count; i++)
                {
                    var order = orderList[i];
                    var property = dataType.GetProperty(order.Name);
                    var parameter = Expression.Parameter(dataType, "t");
                    var propertyAccess = Expression.MakeMemberAccess(parameter, property);
                    var orderByExp = Expression.Lambda(propertyAccess, parameter);
                    var orderMethod = "";
                    if (i == 0)
                        orderMethod = order.SortOrder == ColumnSortOrder.Asc ? "OrderBy" : "OrderByDescending";
                    else
                        orderMethod = order.SortOrder == ColumnSortOrder.Asc ? "ThenBy" : "ThenByDescending";
                    var resultExp = Expression.Call(typeof(Queryable), orderMethod, new Type[] { dataType, property.PropertyType }, query.Expression, Expression.Quote(orderByExp));
                    query = query.Provider.CreateQuery<T>(resultExp);
                }
            }
            this.TotalRows = query.Count();
            this.TotalPages = TotalRows % pageSize == 0 ? TotalRows / pageSize : TotalRows / pageSize + 1;
            if (option.PageIndex > this.TotalPages)
                option.PageIndex = 1;
            this.DataList = query.Skip(pageSize * (option.PageIndex - 1)).Take(pageSize).ToList();
            PageOption = option;
        }
    }
}
