using Ace.Boss.Models;
using Ace.Core.Cache;
using Ace.Dto;
using Ace.Framework.Filter;
using Ace.Framework.Model;
using Ace.Service.Menu;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace Ace.Boss.Controllers
{
    public class MainController : BaseController
    {
        IMenuService _menuService;
        ICacheManager _cacheManager;
        public MainController(IMenuService _menuService, ICacheManager _cacheManager)
        {
            this._cacheManager = _cacheManager;
            this._menuService = _menuService;
        }

        [LoginAction]
        [NoLogAction]
        public IActionResult Index()
        {
            var allMenu = _cacheManager.Get<List<CurrentSysUserMenu>>("allMenu");
            if (allMenu == null)
            {
                var list = new List<MenuDto>();
                _menuService.GetMenuByParentId(list, 0);
                allMenu = list.Select(s => new CurrentSysUserMenu
                {
                    ID = s.MenuID,
                    Name = s.MenuName,
                    URL = s.URL,
                    ParentID = s.ParentID,
                    Sort = s.Sort,
                    Icon = s.Icon
                }).ToList();
                _cacheManager.Add("allMenu", allMenu);
            }
            ViewBag.systemName = _projectSetting.Value.SystemName;
            ViewBag.userName = CurrentSysUser.LoginName;
            var menuList = CurrentSysUser.MenuList;
            var fillList = new List<CurrentSysUserMenu>();
            menuList.ForEach(item => CheckParentMenu(allMenu, fillList, item));
            var menuTree = new List<MenuViewModel>();
            GetMenuTree(menuList.Union(fillList).ToList(), menuTree, 0);
            ViewBag.menuTree = menuTree;
            return View();
        }

        private void CheckParentMenu(List<CurrentSysUserMenu> allMenu, List<CurrentSysUserMenu> fillList, CurrentSysUserMenu menu)
        {
            if (!fillList.Any(p => p.ID == menu.ParentID))
            {
                var pMenu = allMenu.FirstOrDefault(p => p.ID == menu.ParentID);
                if (pMenu != null)
                {
                    fillList.Add(pMenu);
                    CheckParentMenu(allMenu, fillList, pMenu);
                }
            }
        }

        private void GetMenuTree(List<CurrentSysUserMenu> list, List<MenuViewModel> menuTree, int parentID)
        {
            list.Where(p => p.ParentID == parentID)
                .OrderBy(k => k.Sort).ToList()
                .ForEach(item =>
            {
                var subMenu = new List<MenuViewModel>();
                GetMenuTree(list, subMenu, item.ID);
                menuTree.Add(new MenuViewModel
                {
                    ID = item.ID,
                    Name = item.Name,
                    URL = item.URL,
                    Icon = item.Icon,
                    SubMenu = subMenu
                });
            });
        }
    }
}