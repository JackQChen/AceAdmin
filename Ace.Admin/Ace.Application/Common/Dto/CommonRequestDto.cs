using System;
using System.ComponentModel.DataAnnotations;
using Abp.Application.Services.Dto;

namespace Ace.Common.Dto
{
    public class CommonRequestDto : IPagedAndSortedResultRequest
    {
        /// <summary>
        /// 关键字
        /// </summary>
        public string Keyword { get; set; }

        /// <summary>
        /// 是否启用
        /// </summary>
        public bool? IsActive { get; set; }

        /// <summary>
        /// 开始时间
        /// </summary>
        public DateTime? StartTime { get; set; }

        /// <summary>
        /// 结束时间
        /// </summary>
        public DateTime? EndTime { get; set; }

        [Range(0, int.MaxValue)]
        public int SkipCount { get; set; }

        [Range(1, int.MaxValue)]
        public int MaxResultCount { get; set; } = 10;

        private int _pageIndex = 1;
        /// <summary>
        /// 页码
        /// </summary>
        [Range(1, int.MaxValue)]
        public int PageIndex
        {
            get { return _pageIndex; }
            set
            {
                if (PagedType == PagedType.Export)
                    return;
                _pageIndex = value;
                SkipCount = (_pageIndex - 1) * MaxResultCount;
            }
        }

        /// <summary>
        /// 每页数量
        /// </summary>
        public int PageCount
        {
            get { return MaxResultCount; }
            set
            {
                if (PagedType == PagedType.Export)
                    return;
                MaxResultCount = value;
                SkipCount = (_pageIndex - 1) * MaxResultCount;
            }
        }

        /// <summary>
        /// 排序
        /// </summary>
        public string Sorting { get; set; }

        private PagedType _pagedType = PagedType.Select;
        /// <summary>
        /// 分页方式
        /// </summary>
        public PagedType PagedType
        {
            get { return _pagedType; }
            set
            {
                _pagedType = value;
                if (_pagedType == PagedType.Export)
                {
                    _pageIndex = 1;
                    SkipCount = 0;
                    MaxResultCount = int.MaxValue;
                }
            }
        }
    }
}
