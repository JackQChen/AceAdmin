using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Ace.Core.Page;
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

        public async Task<List<MenuDto>> GetListAsnyc()
        {
            var q = from item in await _unitOfWork.SysMenuRep.GetListAsync()
                    select new MenuDto
                    {
                        MenuID = item.ID,
                        MenuName = item.Name,
                        ParentID = item.ParentID,
                        URL = item.URL,
                        Sort = item.Sort,
                        Icon = item.Icon
                    };
            return q.ToList();
        }

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
        public async Task<PageResult> GetPageListAsync(PageOption pageOption, string strSearch = null)
        {
            Expression<Func<Sys_Menu, bool>> exp = p => true;
            if (!string.IsNullOrEmpty(strSearch))
            {
                exp = exp.And(c =>
                c.ID.ToString().Contains(strSearch)
                || c.Name.Contains(strSearch));
            }
            var query = from menu in _unitOfWork.SysMenuRep.Query.Where(exp)
                        join tItem in _unitOfWork.SysMenuRep.Query
                        on menu.ParentID equals tItem.ID into temp
                        from pMenu in temp.DefaultIfEmpty()
                        select new MenuDto()
                        {
                            MenuID = menu.ID,
                            MenuName = menu.Name,
                            ParentID = menu.ParentID,
                            ParentName = pMenu.Name,
                            URL = menu.URL,
                            Sort = menu.Sort,
                            Icon = menu.Icon
                        };
            return await query.ToPageResultAsync(pageOption);
        }

        private int menuId;
        public IMenuService Init(int menuId)
        {
            this.menuId = menuId;
            return this;
        }

        public MenuDto Data
        {
            get
            {
                var model = new MenuDto()
                {
                    MenuID = menuId
                };
                if (model.MenuID != 0)
                {
                    var entity = _unitOfWork.SysMenuRep.Get(menuId);
                    if (entity == null)
                        throw new Exception("要查找的对象不存在");
                    model.MenuName = entity.Name;
                    model.URL = entity.URL;
                    model.ParentID = entity.ParentID;
                    model.ParentName = _unitOfWork.SysMenuRep.Get(entity.ParentID)?.Name;
                    model.Sort = entity.Sort;
                    model.Icon = entity.Icon;
                }
                return model;
            }
            set
            {
                var model = value;
                if (model.MenuID == 0)
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
                }
                else
                {
                    var entity = _unitOfWork.SysMenuRep.Get(model.MenuID);
                    if (entity == null)
                        throw new Exception("要查找的对象不存在");
                    entity.Name = model.MenuName;
                    entity.ParentID = model.ParentID;
                    entity.URL = model.URL;
                    entity.Sort = model.Sort;
                    entity.Icon = model.Icon;
                    _unitOfWork.SysMenuRep.Update(entity);
                }
            }
        }

        public async Task Delete(int menuId)
        {
            using (var trans = _unitOfWork.BeginTransaction())
            {
                var entity = await _unitOfWork.SysMenuRep.GetAsync(menuId);
                if (entity == null)
                    throw new Exception("要查找的对象不存在");
                //更新第一级子节点
                var childList = await _unitOfWork.SysMenuRep.GetListAsync(p => p.ParentID == entity.ID);
                childList.ForEach(item => item.ParentID = 0);
                await _unitOfWork.SysMenuRep.UpdateAsync(childList);
                //删除关联数据
                await _unitOfWork.SysRoleMenuRep.DeleteAsync(p => p.MenuID == entity.ID);
                await _unitOfWork.SysUserMenuRep.DeleteAsync(p => p.MenuID == entity.ID);
                //删除菜单
                await _unitOfWork.SysMenuRep.DeleteAsync(entity);
                trans.Commit();
            }
        }
    }
}
