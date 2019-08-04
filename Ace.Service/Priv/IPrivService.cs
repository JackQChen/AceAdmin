using System.Collections.Generic;
using System.Threading.Tasks;

namespace Ace.Service.Priv
{
    public interface IPrivService
    {
        Task<object> GetMenuByRoleId(int roleId);

        Task<object> GetMenuByUserId(int userId);
    }
}