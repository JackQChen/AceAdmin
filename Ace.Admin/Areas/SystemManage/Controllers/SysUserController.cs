using System;
using System.Threading.Tasks;
using Ace.Admin.Controllers;
using Ace.Dto;
using Ace.Framework.Filter;
using Ace.Framework.Validation;
using Ace.Service.Dept;
using Ace.Service.Role;
using Ace.Service.User;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Ace.Admin.Areas.SystemManage.Controllers
{
    [Area("SystemManage")]
    public class SysUserController : BaseController
    {
        IUserService _userService;
        IRoleService _roleService;
        IDeptService _deptService;

        public SysUserController(IUserService userService, IRoleService roleService, IDeptService deptService)
        {
            this._userService = userService;
            this._roleService = roleService;
            this._deptService = deptService;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var deptRoot = new DeptDto
            {
                DeptID = 0,
                DeptName = "全部",
                ParentID = -1
            };
            var deptList = await _deptService.GetListAsnyc();
            deptList.Add(deptRoot);
            ViewBag.deptList = JsonConvert.SerializeObject(deptList);
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> GetPageList(int deptId, Pagination pagination, string search)
        {
            return (await _userService.GetPageListAsync(deptId, pagination.ToPageOption(), search)).ToPageData();
        }

        [HttpGet]
        public async Task<IActionResult> Form(DeptDto dept, int id = 0)
        {
            var model = _userService.Init(id).Data;
            if (model.UserID == 0)
            {
                model.DeptID = dept.DeptID;
                model.DeptName = dept.DeptID == 0 ? "" : dept.DeptName;
            }
            if (model.Photo != null)
                this.ViewBag.avatar = "data:image/png;base64," + Convert.ToBase64String(model.Photo);
            ViewBag.deptList = JsonConvert.SerializeObject(await _deptService.GetListAsnyc());
            ViewBag.roleList = await _roleService.GetListAsnyc();
            return View(model);
        }

        [HttpPost]
        [ValidateInput]
        [ValidateAntiForgeryToken]
        [NoParametersLogAction]
        public IActionResult Form(UserDto model, string avatar)
        {
            if (string.IsNullOrEmpty(avatar))
                model.Photo = null;
            else
                model.Photo = Convert.FromBase64String(avatar.Split(',')[1]);
            _userService.Data = model;
            return SuccessJsonResult();
        }

        [HttpPost]
        [ValidateInput]
        [ValidateAntiForgeryToken]
        [NoParametersLogAction]
        public async Task<IActionResult> Delete(int id = 0)
        {
            await _userService.Delete(id);
            return SuccessJsonResult();
        }
    }
}