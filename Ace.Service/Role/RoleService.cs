using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Ace.Core.Page;
using Ace.Dto;
using Ace.Entity;
using Ace.UnitOfWork;


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
            var query = from item in await _unitOfWork.SysRoleRep.GetListAsync()
                        select new RoleDto
                        {
                            RoleID = item.ID,
                            RoleName = item.Name,
                            Description = item.Description
                        };
            return query.ToList();
        }

        public async Task<PageResult> GetPageListAsync(PageOption pageOption, string strSearch = null)
        {
            Expression<Func<Sys_Role, bool>> exp = p => true;
            if (!string.IsNullOrEmpty(strSearch))
            {
                exp = exp.And(c =>
                c.ID.ToString().Contains(strSearch)
                || c.Name.Contains(strSearch));
            }
            var query = from role in _unitOfWork.SysRoleRep.Query.Where(exp)
                        select new
                        {
                            RoleID = role.ID,
                            RoleName = role.Name,
                            role.Description
                        };
            return await query.ToPageResultAsync(pageOption);
        }
        public async Task<PageResult> GetUserPageListAsync(int roleId, PageOption pageOption, string strSearch = null, bool except = false)
        {
            IQueryable<UserDto> query = null;
            if (except)
            {
                query = from user in _unitOfWork.SysUserRep.Query
                        join i in _unitOfWork.SysRoleUserRep.Query.Where(p => p.RoleID == roleId)
                        on user.ID equals i.UserID into list
                        from roleUser in list.DefaultIfEmpty()
                        where roleUser == null
                        join j in _unitOfWork.SysDeptRep.Query
                        on user.DeptID equals j.ID into list2
                        from dept in list2.DefaultIfEmpty()
                        select new UserDto
                        {
                            UserID = user.ID,
                            UserName = user.Name,
                            Code = user.Code,
                            LoginName = user.LoginName,
                            DeptID = user.DeptID,
                            DeptName = dept.Name
                        };
            }
            else
            {
                query = from roleUser in _unitOfWork.SysRoleUserRep.Query.Where(p => p.RoleID == roleId)
                        join user in _unitOfWork.SysUserRep.Query
                        on roleUser.UserID equals user.ID
                        join i in _unitOfWork.SysDeptRep.Query
                        on user.DeptID equals i.ID into list
                        from dept in list.DefaultIfEmpty()
                        select new UserDto
                        {
                            UserID = user.ID,
                            UserName = user.Name,
                            Code = user.Code,
                            LoginName = user.LoginName,
                            DeptID = user.DeptID,
                            DeptName = dept.Name
                        };
            }
            Expression<Func<UserDto, bool>> exp = p => true;
            if (!string.IsNullOrEmpty(strSearch))
            {
                exp = exp.And(c =>
                c.UserID.ToString().Contains(strSearch)
                || c.UserName.Contains(strSearch)
                || c.Code.Contains(strSearch)
                || c.LoginName.Contains(strSearch));
            }
            query = query.Where(exp);
            return await query.ToPageResultAsync(pageOption);
        }

        public void AddRoleUser(int roleId, int[] userIdList)
        {
            var dataList = userIdList.Select(s => new Sys_Role_User
            {
                RoleID = roleId,
                UserID = s
            }).ToList();
            _unitOfWork.SysRoleUserRep.Insert(dataList);
        }

        public void DeleteRoleUser(int roleId, int[] userIdList)
        {
            _unitOfWork.SysRoleUserRep.Delete(p =>
            p.RoleID == roleId
            && userIdList.Contains(p.UserID));
        }

        private int _roleId;
        public IRoleService Init(int roleId)
        {
            this._roleId = roleId;
            return this;
        }
        public RoleDto Data
        {
            get
            {
                var model = new RoleDto()
                {
                    RoleID = _roleId
                };
                if (model.RoleID != 0)
                {
                    var entity = _unitOfWork.SysRoleRep.Get(model.RoleID);
                    if (entity == null)
                        throw new Exception("要查找的对象不存在");
                    model.RoleName = entity.Name;
                    model.Description = entity.Description;
                }
                return model;
            }
            set
            {
                var model = value;
                if (model.RoleID == 0)
                {
                    var entity = new Sys_Role()
                    {
                        Name = model.RoleName,
                        Description = model.Description
                    };
                    _unitOfWork.SysRoleRep.Insert(entity);
                }
                else
                {
                    var entity = _unitOfWork.SysRoleRep.Get(model.RoleID);
                    if (entity == null)
                        throw new Exception("要查找的对象不存在");
                    entity.Name = model.RoleName;
                    entity.Description = model.Description;
                    //部分字段更新方式
                    //var updatedPropertyList = PropertyExpression<Sys_Role>.Init
                    //    .Property(c => c.Name)
                    //    .Property(c => c.Description)
                    //    .ToList();
                    //_unitOfWork.SysRoleRep.Update(entity, true, updatedPropertyList);
                    _unitOfWork.SysRoleRep.Update(entity);
                }
            }
        }

        public async Task Delete(int roleId)
        {
            using (var trans = _unitOfWork.BeginTransaction())
            {
                var entity = await _unitOfWork.SysRoleRep.GetAsync(roleId);
                if (entity == null)
                    throw new Exception("要查找的对象不存在");
                //删除角色菜单对应
                await _unitOfWork.SysRoleMenuRep.DeleteAsync(p => p.RoleID == entity.ID);
                //删除角色用户对应
                await _unitOfWork.SysRoleUserRep.DeleteAsync(p => p.RoleID == entity.ID);
                //删除角色
                await _unitOfWork.SysRoleRep.DeleteAsync(entity);
                trans.Commit();
            }
        }

    }
}
