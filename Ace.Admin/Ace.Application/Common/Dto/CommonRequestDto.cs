using System;
using System.ComponentModel.DataAnnotations;
using Abp.Application.Services.Dto;

namespace Ace.Common.Dto
{
    public class CommonRequestDto : PagedAndSortedResultRequestDto
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

        private int _pageIndex = 1;

        /// <summary>
        /// 当前页码
        /// </summary>
        [Range(1, int.MaxValue)]
        public int PageIndex
        {
            get { return _pageIndex; }
            set
            {
                if (_pagedType != selectConst)
                    return;
                _pageIndex = value;
                _skipCount = (_pageIndex - 1) * this._maxResultCount;
            }
        }

        private int _skipCount = 0;
        public override int SkipCount
        {
            get
            {
                return _skipCount;
            }
        }

        private int _maxResultCount = 10;
        [Range(1, int.MaxValue)]
        public override int MaxResultCount
        {
            get
            {
                return _maxResultCount;
            }
            set
            {
                if (_pagedType != selectConst)
                    return;
                _maxResultCount = value;
                _skipCount = (_pageIndex - 1) * this._maxResultCount;
            }
        }

        private const string selectConst = "select";
        private string _pagedType = "select";

        /// <summary>
        /// 分页方式 select=分页 export=不分页
        /// </summary>
        public string PagedType
        {
            get { return _pagedType; }
            set
            {
                _pagedType = value;
                if (_pagedType != "select")
                {
                    _skipCount = 0;
                    _pageIndex = 1;
                    _maxResultCount = int.MaxValue;
                }
            }
        }
    }
}
