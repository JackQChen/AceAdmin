using Ace.Core.Page;
using Ace.Dto;
using System.Threading.Tasks;

namespace Ace.Service.User
{
    public interface IUserService
    {
        SysUserDto Data { get; set; }

        Task Delete(int id);
        Task<PageResult> GetUserPageListAsync(PageOption pageOption, string strSearch = null);
        IUserService Init(int _userId);
    }
}