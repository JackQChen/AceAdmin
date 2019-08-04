using System.Threading.Tasks;
using Ace.Admin.Controllers;
using Ace.Service.Menu;
using Ace.Service.Priv;
using Ace.Service.Role;
using Ace.Service.User;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Ace.Admin.Areas.SystemManage.Controllers
{
    [Area("SystemManage")]
    public class SysPrivController : BaseController
    {
        IRoleService _roleService;
        IUserService _userService;
        IMenuService _menuService;
        IPrivService _privService;
        public SysPrivController(IRoleService roleService, IUserService userService, IMenuService menuService, IPrivService privService)
        {
            this._roleService = roleService;
            this._userService = userService;
            this._privService = privService;
            this._menuService = menuService;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            ViewBag.menuList = JsonConvert.SerializeObject(await _menuService.GetListAsnyc());
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> GetRolePageList(Pagination pagination, string search)
        {
            return (await _roleService.GetPageListAsync(pagination.ToPageOption(), search)).ToPageData();
        }

        [HttpPost]
        public async Task<IActionResult> GetUserPageList(Pagination pagination, string search)
        {
            return (await _userService.GetPageListAsync(0, pagination.ToPageOption(), search)).ToPageData();
        }

        [HttpPost]
        public async Task<IActionResult> GetMenuByRoleId(int roleId)
        {
            return Json(await _privService.GetMenuByRoleId(roleId));
        }

        [HttpPost]
        public async Task<IActionResult> GetMenuByUserId(int userId)
        {
            return Json(await _privService.GetMenuByUserId(userId));
        }
    }
}