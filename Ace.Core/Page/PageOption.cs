using System.Collections.Generic;

namespace Ace.Core.Page
{
    public class PageOption
    {
        private int _pageIndex = 1;
        public int PageIndex
        {
            get { return _pageIndex; }
            set { _pageIndex = value < 1 ? 1 : value; }
        }
        private int _pageSize = 1;
        public int PageSize
        {
            get { return _pageSize; }
            set { _pageSize = value < 1 ? 1 : value; }
        }
        public List<ColumnInfo> OrderList { get; set; }

        public PageOption()
        {
        }
        public PageOption(int pageIndex, int pageSize)
        {
            this.PageIndex = pageIndex;
            this.PageSize = pageSize;
        }
        public PageOption(int pageIndex, int pageSize, List<ColumnInfo> orderList)
        {
            this.PageIndex = pageIndex;
            this.PageSize = pageSize;
            this.OrderList = orderList;
        }
    }

    public enum ColumnSortOrder { Asc, Desc };

    public class ColumnInfo
    {
        public string Name { get; set; }
        public ColumnSortOrder SortOrder { get; set; }
    }
}
