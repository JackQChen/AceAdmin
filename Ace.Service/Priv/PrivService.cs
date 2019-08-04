using Ace.UnitOfWork;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ace.Service.Priv
{

    public class PrivService : IPrivService
    {

        private readonly IUnitOfWork _unitOfWork;
        public PrivService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public async Task<object> GetMenuByRoleId(int roleId)
        {
            var list = await _unitOfWork.SysRoleMenuRep.GetListAsync(p => p.RoleID == roleId);
            return list.Select(s => s.MenuID).ToList();
        }

        public async Task<object> GetMenuByUserId(int userId)
        {
            var listRole = from roleUser in _unitOfWork.SysRoleUserRep.Query.Where(p => p.UserID == userId)
                           join roleMenu in _unitOfWork.SysRoleMenuRep.Query
                           on roleUser.RoleID equals roleMenu.RoleID
                           select roleMenu.MenuID;
            var listUser = await _unitOfWork.SysUserMenuRep.GetListAsync(p => p.UserID == userId);
            return new
            {
                roleMenuList = listRole.ToList(),
                userMenuList = listUser.Select(s => s.MenuID).ToList()
            };
        }
    }
}
