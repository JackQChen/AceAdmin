using Ace.Core.Data;
using Ace.Core.Page;
using Ace.Dto;
using Ace.Entity;
using Ace.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;


namespace Ace.Service.Role
{

    public class RoleService : IRoleService
    {

        private readonly IUnitOfWork _unitOfWork;
        public RoleService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public async Task<List<RoleDto>> GetListAsnyc()
        {
            var q = from i in await _unitOfWork.SysRoleRep.GetListAsync()
                    select new RoleDto
                    {
                        RoleId = i.ID,
                        RoleName = i.Name
                    };
            return q.ToList();
        }

        public async Task<PageResult<RoleDto>> GetRolePageListAsync(int pageIndex, int pageSize, string roleName = null)
        {
            Expression<Func<Sys_Role, bool>> exp = null;
            if (!string.IsNullOrEmpty(roleName))
            {
                exp = exp.And(c => c.Name.Contains(roleName));
            }

            var query = await _unitOfWork.SysRoleRep.LoadAsync(exp);
            query = query.OrderByDescending(c => c.ID);
            var dtoQuery = query.Select(c => new RoleDto()
            {
                RoleId = c.ID,
                RoleName = c.Name
            });
            var pageList = new PageResult<RoleDto>(dtoQuery, new PageOption(pageIndex, pageSize));

            return pageList;
        }
        private int _roleId;
        private int _accountId;
        public IRoleService Init(int roleId, int accountId = 0)
        {
            this._roleId = roleId;
            this._accountId = accountId;
            return this;
        }
        public RoleDto Info
        {
            get
            {
                var model = new RoleDto()
                {
                    RoleId = _roleId
                };
                if (model.RoleId != 0)
                {
                    var entity = _unitOfWork.SysRoleRep.Get(model.RoleId);
                    if (entity == null)
                    {
                        throw new Exception("要查找的对象不存在");
                    }
                    model.RoleName = entity.Name;
                }
                return model;

            }
            set
            {
                var model = value;
                if (model.RoleId == 0)
                {
                    var entity = new Sys_Role()
                    {
                        Name = model.RoleName
                    };
                    _unitOfWork.SysRoleRep.Insert(entity);
                }
                else
                {
                    var entity = _unitOfWork.SysRoleRep.Get(model.RoleId);
                    if (entity == null)
                    {
                        throw new Exception("要查找的对象不存在");
                    }
                    entity.Name = model.RoleName;
                    var updatedPropertyList = PropertyExpression<Sys_Role>.Init.Property(c => c.Name).ToList();
                    _unitOfWork.SysRoleRep.Update(entity, true, updatedPropertyList);
                }
            }
        }

        public async Task Delete()
        {
            using (var scope = _unitOfWork.BeginTransaction())
            {
                var entity = await _unitOfWork.SysRoleRep.GetAsync(_roleId);
                if (entity == null)
                {
                    throw new Exception("要查找的对象不存在");
                }
                //角色菜单表删除
                var permissionList = await _unitOfWork.SysRoleMenuRep.GetListAsync(c => c.RoleID == entity.ID);
                await _unitOfWork.SysRoleMenuRep.DeleteAsync(permissionList, false);
                _unitOfWork.SaveChanges();
                scope.Commit();
            }

        }

        public async Task<List<int>> GetRoleModuleIdList(int roleId)
        {
            var permissionQuery = await _unitOfWork.SysRoleMenuRep.LoadAsync(c => c.RoleID == roleId);
            return permissionQuery.Select(c => c.MenuID).Distinct().ToList();
        }
        public async Task RoleModuleSave(int roleId, List<int> moduleIdList)
        {
            using (var scope = _unitOfWork.SysRoleMenuRep.Database.BeginTransaction())
            {
                var permissionQuery = await _unitOfWork.SysRoleMenuRep.LoadAsync(c => c.RoleID == roleId);
                _unitOfWork.SysRoleMenuRep.Delete(permissionQuery.ToList());
                List<Sys_Role_Menu> permission = new List<Sys_Role_Menu>();
                moduleIdList.ForEach(c =>
                {
                    permission.Add(new Sys_Role_Menu()
                    {
                        MenuID = c,
                        RoleID = roleId
                    });
                });
                await _unitOfWork.SysRoleMenuRep.InsertAsync(permission);
                scope.Commit();
            }

        }
    }
}
