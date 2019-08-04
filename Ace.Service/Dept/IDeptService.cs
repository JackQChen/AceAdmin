using System.Collections.Generic;
using System.Threading.Tasks;
using Ace.Core.Page;
using Ace.Dto;

namespace Ace.Service.Dept
{
    public interface IDeptService
    {
        Task<List<DeptDto>> GetListAsnyc();
        void GetDeptByParentId(List<DeptDto> deptList, int parentId);
        Task<PageResult> GetPageListAsync(PageOption pageOption, string strSearch = null);
        IDeptService Init(int deptId);
        DeptDto Data { get; set; }
        Task Delete(int deptId);
    }
}