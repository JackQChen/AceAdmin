using System.Threading.Tasks;
using Ace.Core.Page;
using Ace.Dto;

namespace Ace.Service.User
{
    public interface IUserService
    {
        Task<PageResult> GetPageListAsync(int deptId, PageOption pageOption, string strSearch = null);
        UserDto Data { get; set; }
        Task Delete(int id);
        IUserService Init(int userId);
    }
}