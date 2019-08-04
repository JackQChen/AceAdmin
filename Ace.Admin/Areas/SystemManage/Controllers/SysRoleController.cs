using System.Threading.Tasks;
using Ace.Admin.Controllers;
using Ace.Dto;
using Ace.Framework.Filter;
using Ace.Framework.Validation;
using Ace.Service.Role;
using Microsoft.AspNetCore.Mvc;

namespace Ace.Admin.Areas.SystemManage.Controllers
{
    [Area("SystemManage")]
    public class SysRoleController : BaseController
    {
        IRoleService _roleService;

        public SysRoleController(IRoleService roleService)
        {
            this._roleService = roleService;
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> GetPageList(Pagination pagination, string search)
        {
            return (await _roleService.GetPageListAsync(pagination.ToPageOption(), search)).ToPageData();
        }

        public async Task<IActionResult> GetUserPageList(int roleId, Pagination pagination, string search, bool except = false)
        {
            return (await _roleService.GetUserPageListAsync(roleId, pagination.ToPageOption(), search, except)).ToPageData();
        }

        [HttpGet]
        public IActionResult Form(int id = 0)
        {
            var model = _roleService.Init(id).Data;
            return View(model);
        }

        [HttpPost]
        [ValidateInput]
        [ValidateAntiForgeryToken]
        [NoParametersLogAction]
        public IActionResult Form(RoleDto model)
        {
            _roleService.Data = model;
            return SuccessJsonResult();
        }

        [HttpPost]
        [ValidateInput]
        [ValidateAntiForgeryToken]
        [NoParametersLogAction]
        public async Task<IActionResult> Delete(int id = 0)
        {
            await _roleService.Delete(id);
            return SuccessJsonResult();
        }

        //User
        [HttpGet]
        public IActionResult UserForm(int roleId = 0)
        {
            this.ViewBag.roleId = roleId;
            return View();
        }

        [HttpPost]
        [ValidateInput]
        [ValidateAntiForgeryToken]
        [NoParametersLogAction]
        public IActionResult UserForm(int roleId, int[] userIdList)
        {
            _roleService.AddRoleUser(roleId, userIdList);
            return SuccessJsonResult();
        }

        [HttpPost]
        [ValidateInput]
        [ValidateAntiForgeryToken]
        [NoParametersLogAction]
        public IActionResult DeleteRoleUser(int roleId, int[] userIdList)
        {
            _roleService.DeleteRoleUser(roleId, userIdList);
            return SuccessJsonResult();
        }
    }
}