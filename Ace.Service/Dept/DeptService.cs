using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Ace.Core.Page;
using Ace.Dto;
using Ace.Entity;
using Ace.UnitOfWork;

namespace Ace.Service.Dept
{

    public class DeptService : IDeptService
    {

        private readonly IUnitOfWork _unitOfWork;
        public DeptService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public async Task<List<DeptDto>> GetListAsnyc()
        {
            var q = from item in await _unitOfWork.SysDeptRep.GetListAsync()
                    select new DeptDto
                    {
                        DeptID = item.ID,
                        DeptName = item.Name,
                        ParentID = item.ParentID,
                        Code = item.Code,
                        Sort = item.Sort
                    };
            return q.ToList();
        }
        public void GetDeptByParentId(List<DeptDto> deptList, int parentId)
        {
            var query = _unitOfWork.SysDeptRep.Query.Where(c => c.ParentID == parentId);
            var list = query.Select(c => new DeptDto()
            {
                DeptID = c.ID,
                DeptName = c.Name,
                ParentID = c.ParentID,
                Code = c.Code,
                Sort = c.Sort
            });
            foreach (var menu in list)
            {
                deptList.Add(menu);
                GetDeptByParentId(deptList, menu.DeptID);
            }
        }
        public async Task<PageResult> GetPageListAsync(PageOption pageOption, string strSearch = null)
        {
            Expression<Func<Sys_Dept, bool>> exp = p => true;
            if (!string.IsNullOrEmpty(strSearch))
            {
                exp = exp.And(c =>
                c.ID.ToString().Contains(strSearch)
                || c.Name.Contains(strSearch)
                || c.Code.Contains(strSearch));
            }
            var query = from item in _unitOfWork.SysDeptRep.Query.Where(exp)
                        join tItem in _unitOfWork.SysDeptRep.Query
                        on item.ParentID equals tItem.ID into temp
                        from pItem in temp.DefaultIfEmpty()
                        select new DeptDto()
                        {
                            DeptID = item.ID,
                            DeptName = item.Name,
                            ParentID = item.ParentID,
                            ParentName = pItem.Name,
                            Code = item.Code,
                            Sort = item.Sort
                        };
            return await query.ToPageResultAsync(pageOption);
        }

        private int deptId;
        public IDeptService Init(int deptId)
        {
            this.deptId = deptId;
            return this;
        }
        public DeptDto Data
        {
            get
            {
                var model = new DeptDto()
                {
                    DeptID = deptId
                };
                if (model.DeptID != 0)
                {
                    var entity = _unitOfWork.SysDeptRep.Get(model.DeptID);
                    if (entity == null)
                        throw new Exception("要查找的对象不存在");
                    model.DeptName = entity.Name;
                    model.ParentID = entity.ParentID;
                    model.ParentName = _unitOfWork.SysDeptRep.Get(entity.ParentID)?.Name;
                    model.Code = entity.Code;
                    model.Sort = entity.Sort;
                }
                return model;
            }
            set
            {
                var model = value;
                if (model.DeptID == 0)
                {
                    var entity = new Sys_Dept()
                    {
                        Name = model.DeptName,
                        ParentID = model.ParentID,
                        Code = model.Code,
                        Sort = model.Sort
                    };
                    _unitOfWork.SysDeptRep.Insert(entity);
                }
                else
                {
                    var entity = _unitOfWork.SysDeptRep.Get(model.DeptID);
                    if (entity == null)
                        throw new Exception("要查找的对象不存在");
                    entity.Name = model.DeptName;
                    entity.ParentID = model.ParentID;
                    entity.Code = model.Code;
                    entity.Sort = model.Sort;
                    _unitOfWork.SysDeptRep.Update(entity);
                }
            }
        }

        public async Task Delete(int deptId)
        {
            using (var trans = _unitOfWork.BeginTransaction())
            {
                var entity = await _unitOfWork.SysDeptRep.GetAsync(deptId);
                if (entity == null)
                    throw new Exception("要查找的对象不存在");
                //更新第一级子节点
                var childList = await _unitOfWork.SysDeptRep.GetListAsync(p => p.ParentID == entity.ID);
                childList.ForEach(item => item.ParentID = 0);
                await _unitOfWork.SysDeptRep.UpdateAsync(childList);
                //更新部门用户
                var userList = await _unitOfWork.SysUserRep.GetListAsync(p => p.DeptID == entity.ID);
                userList.ForEach(item => item.DeptID = 0);
                await _unitOfWork.SysUserRep.UpdateAsync(userList);
                //删除部门
                await _unitOfWork.SysDeptRep.DeleteAsync(entity);
                trans.Commit();
            }
        }

    }
}
