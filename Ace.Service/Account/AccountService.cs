using Ace.Dto;
using Ace.UnitOfWork;
using Ace.Utility;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ace.Service.Account
{
    public class AccountService : IAccountService
    {
        private readonly IUnitOfWork _unitOfWork;
        public AccountService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public ServiceReturnDto<SysUserDto> Login(string name, string password)
        {
            ServiceReturnDto<SysUserDto> sr = new ServiceReturnDto<SysUserDto>() { IsSucceed = true };
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
            sr.Data = new SysUserDto()
            {
                UserID = user.ID,
                LoginName = user.LoginName,
                UserName = user.Name
            };
            return sr;
        }
        public ServiceReturnDto<List<SysRoleMenuDto>> GetCurrentUserMenu(int loginId)
        {
            ServiceReturnDto<List<SysRoleMenuDto>> sr = new ServiceReturnDto<List<SysRoleMenuDto>>() { IsSucceed = true };
            var q = from roleUser in _unitOfWork.SysRoleUserRep.Query.Where(p => p.UserID == loginId)
                    join roleMenu in _unitOfWork.SysRoleMenuRep.Query on roleUser.RoleID equals roleMenu.RoleID
                    join menu in _unitOfWork.SysMenuRep.Query on roleMenu.MenuID equals menu.ID
                    select new SysRoleMenuDto()
                    {
                        ID = menu.ID,
                        Name = menu.Name,
                        ParentID = menu.ParentID,
                        URL = menu.URL,
                        Icon = menu.Icon,
                        Sort = menu.Sort
                    };
            sr.Data = q.ToList();
            return sr;
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
