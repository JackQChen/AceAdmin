namespace Ace.Admin
{
    /// <summary>
    /// jqGrid分页数据
    /// </summary>
    public class PageData
    {
        public int page { get; set; }
        public int records { get; set; }
        public int total { get; set; }
        public object rows { get; set; }

        public PageData()
        {
        }
    }
    /// <summary>
    /// jqGrid分页参数
    /// </summary>
    public class Pagination
    {
        public bool _search { get; set; }
        public string nd { get; set; }
        public int rows { get; set; }
        public int page { get; set; }
        public string sidx { get; set; }
        public string sord { get; set; }
    }
}
