using System.Collections.Generic;
using Ace.Dto;

namespace Ace.Service.Account
{
    public interface IAccountService
    {
        ServiceReturnDto<UserDto> Login(string name, string password);
        ServiceReturnDto<List<MenuDto>> GetMenuList(int userId);
        ServiceReturnDto<List<MenuDto>> GetFullMenuList(List<MenuDto> menuList);

        //Task<ServiceReturnDto> ModifyPassword(ModifyPasswordDto model);
    }
}