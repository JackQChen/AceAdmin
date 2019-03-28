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
namespace Ace.Service.User
{
    public class UserService : IUserService
    {
        private readonly IUnitOfWork _unitOfWork;
        public UserService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public async Task<PageResult> GetUserPageListAsync(PageOption pageOption, string strSearch = null)
        {
            Expression<Func<Sys_User, bool>> exp = p => true;
            if (!string.IsNullOrEmpty(strSearch))
            {
                exp = exp.And(p =>
                p.ID.ToString().Contains(strSearch)
                || p.Name.Contains(strSearch)
                || p.LoginName.Contains(strSearch)
                || p.Code.Contains(strSearch));
            }
            var q = from item in _unitOfWork.SysUserRep.Query.Where(exp)
                    select new SysUserDto
                    {
                        UserID = item.ID,
                        UserName = item.Name,
                        Code = item.Code,
                        LoginName = item.LoginName,
                        Remark = item.Remark
                    };
            return await q.ToPageResultAsync(pageOption);
        }
        private int _userId;
        public IUserService Init(int _userId)
        {
            this._userId = _userId;
            return this;
        }
        public SysUserDto Data
        {
            get
            {
                var model = new SysUserDto() { UserID = _userId };
                if (model.UserID != 0)
                {
                    var entity = _unitOfWork.SysUserRep.Get(model.UserID);
                    model.UserName = entity.Name;
                    model.Code = entity.Code;
                    model.LoginName = entity.LoginName;
                    model.Remark = entity.Remark;
                    if (entity == null)
                        throw new Exception("要查找的对象不存在");
                    model.RoleList = (from t1 in _unitOfWork.SysRoleRep.Query
                                      join t2 in _unitOfWork.SysRoleUserRep.Query
                                      on t1.ID equals t2.RoleID
                                      where t2.UserID == model.UserID
                                      select new RoleDto() { RoleId = t1.ID, RoleName = t1.Name }).ToList();
                }
                return model;
            }
            set
            {
                using (var scope = _unitOfWork.BeginTransaction())
                {
                    var model = value;
                    var dt = DateTime.Now;
                    int userId = 0;
                    if (model.UserID == 0)
                    {
                        var hasLoginName = _unitOfWork.SysUserRep.Query.Where(c => c.LoginName == model.LoginName).Any();
                        if (hasLoginName)
                        {
                            throw new Exception("登录名已存在");
                        }
                        var entity = new Sys_User()
                        {
                            LoginName = model.LoginName,
                            Password = model.Password
                        };
                        _unitOfWork.SysUserRep.Insert(entity);
                        userId = entity.ID;
                    }
                    else
                    {
                        var entity = _unitOfWork.SysUserRep.Get(model.UserID);
                        if (entity == null)
                        {
                            throw new Exception("要修改的记录不存在");
                        }
                        if (entity.LoginName != model.LoginName)//修改了登录名
                        {
                            var hasLoginName = _unitOfWork.SysUserRep.Query.Where(c => c.LoginName == model.LoginName).Any();
                            if (hasLoginName)
                            {
                                throw new Exception("登录名已存在");
                            }
                        }
                        entity.Remark = model.Remark;
                        entity.LoginName = model.LoginName;
                        _unitOfWork.SysUserRep.Update(entity);
                        userId = entity.ID;
                        //var roleUserEntityList = _unitOfWork.SysRoleUserRep.Query.Where(c => c.UserID == entity.ID).ToList();
                        //_unitOfWork.SysRoleUserRep.Delete(roleUserEntityList);
                    }
                    //List<Sys_Role_User> newRoleUserEntityList = new List<Sys_Role_User>();
                    //model.RoleList.ForEach(c =>
                    //{
                    //    newRoleUserEntityList.Add(new Sys_Role_User()
                    //    {
                    //        RoleID = c.RoleId,
                    //        UserID = userId
                    //    });
                    //});
                    //_unitOfWork.SysRoleUserRep.Insert(newRoleUserEntityList);

                    scope.Commit();
                }
            }
        }

        public async Task Delete(int id)
        {
            using (var scope = _unitOfWork.BeginTransaction())
            {
                var roleUserEntityList = await _unitOfWork.SysRoleUserRep.GetListAsync(c => c.UserID == id);
                await _unitOfWork.SysRoleUserRep.DeleteAsync(roleUserEntityList);
                var entity = await _unitOfWork.SysUserRep.GetAsync(id);
                if (entity == null)
                {
                    throw new Exception("要查找的对象不存在");
                }
                var updatedPropertyList = PropertyExpression<Sys_User>.Init.ToList();
                await _unitOfWork.SysUserRep.UpdateAsync(entity, true, updatedPropertyList);
                scope.Commit();
            }

        }
    }
}
