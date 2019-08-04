using Ace.Admin.Controllers;
using Ace.Dto;
using Ace.Framework.Filter;
using Ace.Framework.Validation;
using Ace.Service.Menu;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;

namespace Ace.Admin.Areas.SystemManage.Controllers
{
    [Area("SystemManage")]
    public class SysMenuController : BaseController
    {
        IMenuService _menuService;

        public SysMenuController(IMenuService menuService)
        {
            this._menuService = menuService;
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> GetPageList(Pagination pagination, string search)
        {
            return (await _menuService.GetPageListAsync(pagination.ToPageOption(), search)).ToPageData();
        }

        [HttpGet]
        public async Task<IActionResult> Form(int id = 0)
        {
            var model = _menuService.Init(id).Data;
            var list = await _menuService.GetListAsnyc();
            if (id != 0)
            {
                var listRemove = new List<MenuDto>();
                _menuService.GetMenuByParentId(listRemove, id);
                //removeChild
                list.RemoveAll(item => listRemove.Any(p => p.MenuID == item.MenuID));
                //removeSelf
                list.RemoveAll(p => p.MenuID == model.MenuID);
            }
            ViewBag.menuList = JsonConvert.SerializeObject(list);
            return View(model);
        }

        [HttpPost]
        [ValidateInput]
        [ValidateAntiForgeryToken]
        [NoParametersLogAction]
        public IActionResult Form(MenuDto model)
        {
            _menuService.Data = model;
            return SuccessJsonResult();
        }

        [HttpPost]
        [ValidateInput]
        [ValidateAntiForgeryToken]
        [NoParametersLogAction]
        public async Task<IActionResult> Delete(int id = 0)
        {
            await _menuService.Delete(id);
            return SuccessJsonResult();
        }
    }
}