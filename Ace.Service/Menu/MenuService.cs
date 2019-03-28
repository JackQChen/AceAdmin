using System;
using System.Collections.Generic;
using System.Linq;
using Ace.Dto;
using Ace.Entity;
using Ace.UnitOfWork;

namespace Ace.Service.Menu
{
    public class MenuService : IMenuService
    {

        private readonly IUnitOfWork _unitOfWork;
        public MenuService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public int MenuID { get; set; }

        public void GetMenuByParentId(List<MenuDto> menuList, int parentId)
        {
            var query = _unitOfWork.SysMenuRep.Query.Where(c => c.ParentID == parentId);
            var list = query.Select(c => new MenuDto()
            {
                MenuID = c.ID,
                MenuName = c.Name,
                ParentID = c.ParentID,
                URL = c.URL,
                Sort = c.Sort,
                Icon = c.Icon
            });
            foreach (var menu in list)
            {
                menuList.Add(menu);
                GetMenuByParentId(menuList, menu.MenuID);
            }
        }

        public MenuDto Data
        {
            get
            {
                var entity = _unitOfWork.SysMenuRep.Get(this.MenuID);
                if (entity == null)
                    throw new Exception("对象不存在");
                var model = new MenuDto()
                {
                    MenuID = entity.ID,
                    MenuName = entity.Name,
                    URL = entity.URL,
                    ParentID = entity.ParentID,
                    Sort = entity.Sort,
                    Icon = entity.Icon
                };
                return model;
            }
            set
            {
                var model = value;
                if (model == null)
                {
                    var menuList = new List<MenuDto>();
                    GetMenuByParentId(menuList, MenuID);
                    _unitOfWork.SysMenuRep.Delete(menuList.Select((e, i) =>
                    new Sys_Menu() { ID = e.MenuID }).ToList());
                    _unitOfWork.SysMenuRep.Delete(new Sys_Menu() { ID = MenuID });
                }
                else if (model.MenuID == 0)
                {
                    var entity = new Sys_Menu()
                    {
                        Name = model.MenuName,
                        URL = model.URL,
                        ParentID = model.ParentID,
                        Sort = model.Sort,
                        Icon = model.Icon
                    };
                    _unitOfWork.SysMenuRep.Insert(entity);
                    MenuID = entity.ID;
                }
                else
                {
                    var entity = _unitOfWork.SysMenuRep.Get(model.MenuID);
                    if (entity == null)
                        throw new Exception("对象不存在");
                    entity.Name = model.MenuName;
                    entity.ParentID = model.ParentID;
                    entity.URL = model.URL;
                    entity.Sort = model.Sort;
                    entity.Icon = model.Icon;
                    _unitOfWork.SysMenuRep.Update(entity);
                    MenuID = entity.ID;
                }
            }
        }
    }
}
