using System.Collections.Generic;
using System.Linq;
using System.Text;
using Ace.Dto;
using Ace.Service.Menu;
using Ace.UnitOfWork;
using Ace.Utility;

namespace Ace.Service.Account
{
    public class AccountService : IAccountService
    {
        private readonly IUnitOfWork _unitOfWork;
        public AccountService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public ServiceReturnDto<UserDto> Login(string name, string password)
        {
            ServiceReturnDto<UserDto> sr = new ServiceReturnDto<UserDto>() { IsSucceed = true };
            var user = _unitOfWork.SysUserRep.Query.Where(c => c.LoginName == name).FirstOrDefault();
            if (user == null)
            {
                sr.IsSucceed = false;
                sr.Message = "账号不存在";
                return sr;
            }
            if (user.Password != CryptHelper.EncryptMD5(password))
            {
                sr.IsSucceed = false;
                sr.Message = "密码错误";
                return sr;
            }
            sr.Data = new UserDto()
            {
                UserID = user.ID,
                LoginName = user.LoginName,
                UserName = user.Name
            };
            return sr;
        }
        public ServiceReturnDto<List<MenuDto>> GetMenuList(int userId)
        {
            ServiceReturnDto<List<MenuDto>> sr = new ServiceReturnDto<List<MenuDto>>() { IsSucceed = true };
            var q = from roleUser in _unitOfWork.SysRoleUserRep.Query.Where(p => p.UserID == userId)
                    join roleMenu in _unitOfWork.SysRoleMenuRep.Query on roleUser.RoleID equals roleMenu.RoleID
                    join menu in _unitOfWork.SysMenuRep.Query on roleMenu.MenuID equals menu.ID
                    select new MenuDto()
                    {
                        MenuID = menu.ID,
                        MenuName = menu.Name,
                        ParentID = menu.ParentID,
                        URL = menu.URL,
                        Icon = menu.Icon,
                        Sort = menu.Sort
                    };
            sr.Data = q.ToList();
            return sr;
        }
        public ServiceReturnDto<List<MenuDto>> GetFullMenuList(List<MenuDto> menuList)
        {
            ServiceReturnDto<List<MenuDto>> sr = new ServiceReturnDto<List<MenuDto>>() { IsSucceed = true };
            var menuService = new MenuService(this._unitOfWork);
            List<MenuDto> allList = new List<MenuDto>(), fillList = new List<MenuDto>();
            menuService.GetMenuByParentId(allList, 0);
            menuList.ForEach(item => CheckParentMenu(allList, fillList, item));
            sr.Data = menuList.Union(fillList).ToList();
            return sr;
        }
        private void CheckParentMenu(List<MenuDto> allList, List<MenuDto> fillList, MenuDto item)
        {
            if (!fillList.Any(p => p.MenuID == item.ParentID))
            {
                var pMenu = allList.FirstOrDefault(p => p.MenuID == item.ParentID);
                if (pMenu != null)
                {
                    fillList.Add(pMenu);
                    CheckParentMenu(allList, fillList, pMenu);
                }
            }
        }

        //public async Task<ServiceReturnDto> ModifyPassword(ModifyPasswordDto model)
        //{
        //    ServiceReturnDto sr = new ServiceReturnDto() {

        //    };
        //    if (string.IsNullOrEmpty(model.OldPwd))
        //    {
        //        sr.Message = "请输入原密码";
        //        return sr;
        //    }
        //    if (string.IsNullOrEmpty(model.NewPwd))
        //    {
        //        sr.Message = "请输入新密码";
        //        return sr;
        //    }
        //    if (string.IsNullOrEmpty(model.NewPwd1))
        //    {
        //        sr.Message = "请输入重复新密码";
        //        return sr;
        //    }
        //    if (model.NewPwd!=model.NewPwd1)
        //    {
        //        sr.Message = "两次输入的新密码不一致";
        //        return sr;
        //    }
        //    var account=await _unitOfWork.SysUserRep.GetAsync(c => c.IsDeleted == false && c.Id == model.LoginId);
        //    if (account==null)
        //    {
        //        sr.Message = "要修改的用户不存在";
        //        return sr;
        //    }
        //    var pwd = CryptHelper.DecryptDES(account.LoginPwd, account.SaltKey);
        //    if (pwd!=model.OldPwd)
        //    {
        //        sr.Message = "旧密码输入错误";
        //        return sr;
        //    }
        //    account.LoginPwd = CryptHelper.EncryptDES(model.NewPwd, account.SaltKey);
        //    var updatedPropertyList= PropertyExpression<Sys_User>.Init.Property(c => c.LoginPwd).ToList();
        //    sr.IsSucceed = true;
        //    await _unitOfWork.SysUserRep.UpdateAsync(account, true, updatedPropertyList);
        //    return sr;
        //}

    }
}
