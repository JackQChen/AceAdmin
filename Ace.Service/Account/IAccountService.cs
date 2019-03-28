using Ace.Dto;
using System.Collections.Generic;

namespace Ace.Service.Account
{
    public interface IAccountService
    {
        ServiceReturnDto<List<SysRoleMenuDto>> GetCurrentUserMenu(int loginId);
        ServiceReturnDto<SysUserDto> Login(string name, string password);
        //Task<ServiceReturnDto> ModifyPassword(ModifyPasswordDto model);
    }
}