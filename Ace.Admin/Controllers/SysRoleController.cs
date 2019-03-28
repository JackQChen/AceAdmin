using Ace.Dto;
using Ace.Framework.Filter;
using Ace.Service.Menu;
using Ace.Service.Role;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ace.Boss.Controllers
{
    public class SysRoleController : BaseController
    {
        private readonly IRoleService _roleService;
        private readonly IMenuService _moduleService;
        public SysRoleController(IRoleService _roleService, IMenuService _moduleService)
        {
            this._roleService = _roleService;
            this._moduleService = _moduleService;
        }
        [HttpGet]
        [NoLogAction]
        public IActionResult Manager()
        {
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> PagedList(int pageIndex = 1, string roleName = null)
        {
            var list = await _roleService.GetRolePageListAsync(pageIndex, _projectSetting.Value.PageSize, roleName);
            return list.ToPageData();
        }
        [HttpGet]
        public IActionResult Edit(int id = 0)
        {
            var model = _roleService.Init(id).Info;
            return View(model);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(RoleDto model)
        {

            if (string.IsNullOrEmpty(model.RoleName))
            {
                return ErrorJsonResult("名称不能为空");
            }
            _roleService.Init(model.RoleId).Info = model;
            return SuccessJsonResult();


        }
        [HttpGet]
        public async Task<IActionResult> Delete(int id = 0)
        {

            await _roleService.Init(id).Delete();
            return SuccessJsonResult();



        }
        [HttpGet]
        public IActionResult AuthorizationView(int id)
        {
            ViewBag.roleId = id;
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> AuthorizationTree(int id)
        {
            var myRoleModuleIdList = await _roleService.GetRoleModuleIdList(id);
            var allModuleList = new List<MenuDto>();
            _moduleService.GetMenuByParentId(allModuleList, 0);
            var list = new
            {
                id = 0,
                name = "菜单树",
                open = true,
                isParent = true,
                @checked = false,
                //第一级
                children = allModuleList.Where(c => c.ParentID == 0).OrderBy(e => e.Sort).Select(e => new
                {
                    id = e.MenuID,
                    name = e.MenuName,
                    open = true,
                    isParent = true,
                    @checked = myRoleModuleIdList.Contains(e.MenuID),
                    //第二级
                    children = allModuleList.Where(c => c.ParentID == e.MenuID).OrderBy(f => f.Sort).Select(f => new
                    {
                        id = f.MenuID,
                        name = f.MenuName,
                        open = true,
                        isParent = true,
                        @checked = myRoleModuleIdList.Contains(f.MenuID),
                        //第三级
                        children = allModuleList.Where(c => c.ParentID == f.MenuID).OrderBy(t => t.Sort).Select(t => new
                        {
                            id = t.MenuID,
                            name = t.MenuName,
                            open = true,
                            isParent = true,
                            @checked = myRoleModuleIdList.Contains(t.MenuID),
                            children = allModuleList.Where(c => c.ParentID == t.MenuID).OrderBy(x => x.Sort).Select(x => new
                            {
                                id = x.MenuID,
                                name = x.MenuName,
                                open = true,
                                isParent = false,
                                @checked = myRoleModuleIdList.Contains(x.MenuID)
                            }).ToList()
                        }).ToList()
                    }).ToList()
                }).ToList()
            };
            return Json(list);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AuthorizationSave(string moduleIds, int roleId)
        {

            var list = moduleIds.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries).Select(c => Convert.ToInt32(c)).ToList();
            await _roleService.RoleModuleSave(roleId, list);
            return SuccessJsonResult();

        }
    }
}