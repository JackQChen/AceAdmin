using System;
using System.Collections.Generic;
using System.Linq;
using Ace.Admin.Models;
using Ace.Dto;
using Ace.Framework.Filter;
using Ace.Framework.Model;
using Ace.Service.Account;
using Ace.Service.User;
using Microsoft.AspNetCore.Mvc;

namespace Ace.Admin.Controllers
{
    public class MainController : BaseController
    {
        IAccountService _accountService;
        IUserService _userService;

        public MainController(IAccountService _accountService, IUserService _userService)
        {
            this._accountService = _accountService;
            this._userService = _userService;
        }

        [LoginAction]
        [NoLogAction]
        public IActionResult Index()
        {
            ViewBag.systemName = _projectSetting.Value.SystemName;
            ViewBag.userName = CurrentSysUser.UserName;
            var fullMenuList = _accountService.GetFullMenuList(
                CurrentSysUser.MenuList.Select(s => new MenuDto
                {
                    MenuID = s.ID,
                    ParentID = s.ParentID,
                    MenuName = s.Name,
                    URL = s.URL,
                    Sort = s.Sort,
                    Icon = s.Icon,
                }).ToList());
            var menuTree = new List<MenuTreeModel>();
            GetMenuTree(fullMenuList.Data, menuTree, 0);
            ViewBag.menuTree = menuTree;
            var model = _userService.Init(CurrentSysUser.UserID).Data;
            if (model.Photo != null)
                this.ViewBag.avatar = "data:image/png;base64," + Convert.ToBase64String(model.Photo);
            return View();
        }

        private void GetMenuTree(List<MenuDto> list, List<MenuTreeModel> menuTree, int parentID)
        {
            list.Where(p => p.ParentID == parentID)
                .OrderBy(k => k.Sort).ToList()
                .ForEach(item =>
            {
                var subMenu = new List<MenuTreeModel>();
                GetMenuTree(list, subMenu, item.MenuID);
                menuTree.Add(new MenuTreeModel
                {
                    ID = item.MenuID,
                    Name = item.MenuName,
                    URL = item.URL,
                    Icon = item.Icon,
                    SubMenu = subMenu
                });
            });
        }
    }
}