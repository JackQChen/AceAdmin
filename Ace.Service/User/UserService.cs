using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Ace.Core.Page;
using Ace.Dto;
using Ace.Entity;
using Ace.Service.Dept;
using Ace.UnitOfWork;
using Ace.Utility;

namespace Ace.Service.User
{
    public class UserService : IUserService
    {
        private readonly string _defaultPassword = CryptHelper.EncryptMD5("123456");
        private readonly IUnitOfWork _unitOfWork;
        public UserService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public async Task<PageResult> GetPageListAsync(int deptId, PageOption pageOption, string strSearch = null)
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
            IQueryable<UserDto> query = null;
            if (deptId == 0)
            {
                query = from user in _unitOfWork.SysUserRep.Query.Where(exp)
                        join i in _unitOfWork.SysDeptRep.Query
                        on user.DeptID equals i.ID into list
                        from dept in list.DefaultIfEmpty()
                        select new UserDto
                        {
                            UserID = user.ID,
                            UserName = user.Name,
                            DeptID = user.DeptID,
                            DeptName = dept.Name,
                            Code = user.Code,
                            LoginName = user.LoginName,
                            Sex = user.Sex,
                            Remark = user.Remark
                        };
            }
            else
            {
                var deptService = new DeptService(_unitOfWork);
                var deptList = new List<DeptDto>();
                deptList.Add(deptService.Init(deptId).Data);
                deptService.GetDeptByParentId(deptList, deptId);
                query = from user in _unitOfWork.SysUserRep.Query.Where(exp)
                        join dept in deptList
                        on user.DeptID equals dept.DeptID
                        select new UserDto
                        {
                            UserID = user.ID,
                            UserName = user.Name,
                            DeptID = user.DeptID,
                            DeptName = dept.DeptName,
                            Code = user.Code,
                            LoginName = user.LoginName,
                            Sex = user.Sex,
                            Remark = user.Remark
                        };
            }
            return await query.ToPageResultAsync(pageOption);
        }
        private int _userId;
        public IUserService Init(int _userId)
        {
            this._userId = _userId;
            return this;
        }
        public UserDto Data
        {
            get
            {
                var model = new UserDto()
                {
                    UserID = _userId
                };
                if (model.UserID != 0)
                {
                    var entity = _unitOfWork.SysUserRep.Get(model.UserID);
                    if (entity == null)
                        throw new Exception("要查找的对象不存在");
                    model.Birth = entity.Birth;
                    model.Code = entity.Code;
                    model.LoginName = entity.LoginName;
                    model.Remark = entity.Remark;
                    model.Sex = entity.Sex;
                    model.UserName = entity.Name;
                    model.DeptID = entity.DeptID;
                    model.DeptName = _unitOfWork.SysDeptRep.Get(entity.DeptID)?.Name;
                    model.Photo = _unitOfWork.SysAssetRep.Get(entity.Photo)?.Content;
                    model.RoleIdList = (from i in _unitOfWork.SysRoleUserRep.Query
                                        where i.UserID == entity.ID
                                        select i.RoleID).ToArray();
                }
                return model;
            }
            set
            {
                using (var trans = _unitOfWork.BeginTransaction())
                {
                    var model = value;
                    Sys_User entity = null;
                    if (model.UserID == 0)
                    {
                        var loginNameExist = _unitOfWork.SysUserRep.Get(c => c.LoginName == model.LoginName) != null;
                        if (loginNameExist)
                        {
                            throw new Exception("登录名已存在");
                        }
                        entity = new Sys_User()
                        {
                            Birth = model.Birth,
                            Code = model.Code,
                            LoginName = model.LoginName,
                            Name = model.UserName,
                            DeptID = model.DeptID,
                            Remark = model.Remark,
                            Sex = model.Sex,
                            Password = string.IsNullOrEmpty(model.Password) ? _defaultPassword : CryptHelper.EncryptMD5(model.Password)
                        };
                    }
                    else
                    {
                        entity = _unitOfWork.SysUserRep.Get(model.UserID);
                        if (entity == null)
                        {
                            throw new Exception("要修改的记录不存在");
                        }
                        if (entity.LoginName != model.LoginName)//修改登录名
                        {
                            var loginNameExist = _unitOfWork.SysUserRep.Get(c => c.LoginName == model.LoginName) != null;
                            if (loginNameExist)
                            {
                                throw new Exception("登录名已存在");
                            }
                        }
                        entity.Birth = model.Birth;
                        entity.Code = model.Code;
                        entity.LoginName = model.LoginName;
                        entity.Name = model.UserName;
                        entity.DeptID = model.DeptID;
                        entity.Remark = model.Remark;
                        entity.Sex = model.Sex;
                        //密码空表示未修改
                        if (!string.IsNullOrEmpty(model.Password))
                            entity.Password = CryptHelper.EncryptMD5(model.Password);
                        //删除存在的角色用户对应
                        _unitOfWork.SysRoleUserRep.Delete(p => p.UserID == entity.ID);
                        //删除存在的照片
                        if (entity.Photo.HasValue)
                            _unitOfWork.SysAssetRep.Delete(p => p.ID == entity.Photo.Value);
                    }
                    var newRoleUserList = model.RoleIdList.Select(roleId => new Sys_Role_User
                    {
                        RoleID = roleId,
                        UserID = model.UserID
                    }).ToList();
                    _unitOfWork.SysRoleUserRep.Insert(newRoleUserList);
                    if (model.Photo != null)
                    {
                        var asset = new Sys_Asset { Content = model.Photo };
                        _unitOfWork.SysAssetRep.Insert(asset);
                        entity.Photo = asset.ID;
                    }
                    if (model.UserID == 0)
                        _unitOfWork.SysUserRep.Insert(entity);
                    else
                        _unitOfWork.SysUserRep.Update(entity);
                    //整体提交
                    trans.Commit();
                }
            }
        }

        public async Task Delete(int id)
        {
            using (var trans = _unitOfWork.BeginTransaction())
            {
                var entity = await _unitOfWork.SysUserRep.GetAsync(id);
                if (entity == null)
                {
                    throw new Exception("要查找的对象不存在");
                }
                await _unitOfWork.SysRoleUserRep.DeleteAsync(p => p.UserID == entity.ID);
                await _unitOfWork.SysUserMenuRep.DeleteAsync(p => p.UserID == entity.ID);
                await _unitOfWork.SysUserRep.DeleteAsync(entity);
                trans.Commit();
            }
        }
    }
}
