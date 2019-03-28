using Ace.Core.Page;
using Ace.Dto;
using Ace.Framework.Filter;
using Ace.Framework.Validation;
using Ace.Service.Role;
using Ace.Service.User;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Boss.Controllers
{
    public class SysUserController : BaseController
    {
        private readonly IUserService _userService;
        private readonly IRoleService _roleService;
        public SysUserController(IUserService _userService, IRoleService _roleService)
        {
            this._userService = _userService;
            this._roleService = _roleService;
        }
        [HttpGet]
        [NoLogAction]
        public IActionResult Manager()
        {
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> PagedList(int pageIndex = 1, string LoginName = null, string RelName = null, string Phone = null)
        {
            var list = await _userService.GetUserPageListAsync(new PageOption(pageIndex, _projectSetting.Value.PageSize), LoginName);
            return list.ToPageData();
        }
        [HttpGet]
        public async Task<IActionResult> Edit(int id = 0)
        {
            var rolePagedList = await _roleService.GetRolePageListAsync(1, int.MaxValue);
            ViewBag.roleList = rolePagedList.DataList;
            var model = _userService.Init(id).Data;
            return View(model);

        }
        [HttpPost]
        [ValidateInput]
        [ValidateAntiForgeryToken]
        [NoParametersLogAction]//有敏感信息不记录参数
        public IActionResult Edit(SysUserDto model)
        {

            model.UserID = CurrentSysUser.LoginID;
            string roleIdList = Request.Form["RoleIdList"];
            model.RoleList = (roleIdList ?? "").Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries).Select(c => new RoleDto()
            {
                RoleId = c.ToInt()
            }).ToList();
            _userService.Data = model;
            return SuccessJsonResult();

        }
        [HttpGet]
        public async Task<IActionResult> Delete(int id = 0)
        {

            await _userService.Delete(id);
            return SuccessJsonResult();

        }

        [HttpGet]
        public IActionResult Detail(int id = 0)
        {
            var model = _userService.Init(id).Data;
            return View(model);

        }
    }
}