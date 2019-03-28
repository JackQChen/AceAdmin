using System.Threading.Tasks;
using Ace.Boss.Controllers;
using Ace.Dto;
using Ace.Framework.Filter;
using Ace.Framework.Validation;
using Ace.Service.Role;
using Ace.Service.User;
using Microsoft.AspNetCore.Mvc;

namespace Ace.Boss.Areas.SystemManage.Controllers
{
    [Area("SystemManage")]
    public class SysUserController : BaseController
    {
        IUserService _userService;
        IRoleService _roleService;

        public SysUserController(IUserService userService, IRoleService roleService)
        {
            this._userService = userService;
            this._roleService = roleService;
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> GetPageData(Pagination pagination, string search)
        {
            return (await _userService.GetUserPageListAsync(pagination.ToPageOption(), search)).ToPageData();
        }

        [HttpGet]
        public async Task<IActionResult> Form(int id = 0)
        {
            ViewBag.roleList = await _roleService.GetListAsnyc();
            var model = _userService.Init(id).Data;
            model.Password = "*";
            return View(model);
        }

        [HttpPost]
        [ValidateInput]
        [ValidateAntiForgeryToken]
        [NoParametersLogAction]
        public IActionResult Form(SysUserDto model)
        {
            model.UserID = CurrentSysUser.LoginID;
            string roleIdList = Request.Form["RoleIdList"];
            _userService.Data = model;
            return SuccessJsonResult();
        }
    }
}