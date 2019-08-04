using Ace.Admin.Controllers;
using Ace.Dto;
using Ace.Framework.Filter;
using Ace.Framework.Validation;
using Ace.Service.Dept;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;

namespace Ace.Admin.Areas.SystemManage.Controllers
{
    [Area("SystemManage")]
    public class SysDeptController : BaseController
    {
        IDeptService _deptService;

        public SysDeptController(IDeptService deptService)
        {
            this._deptService = deptService;
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> GetPageList(Pagination pagination, string search)
        {
            return (await _deptService.GetPageListAsync(pagination.ToPageOption(), search)).ToPageData();
        }

        [HttpGet]
        public async Task<IActionResult> Form(int id = 0)
        {
            var model = _deptService.Init(id).Data;
            var list = await _deptService.GetListAsnyc();
            if (id != 0)
            {
                var listRemove = new List<DeptDto>();
                _deptService.GetDeptByParentId(listRemove, id);
                //removeChild
                list.RemoveAll(item => listRemove.Any(p => p.DeptID == item.DeptID));
                //removeSelf
                list.RemoveAll(p => p.DeptID == model.DeptID);
            }
            ViewBag.deptList = JsonConvert.SerializeObject(list);
            return View(model);
        }

        [HttpPost]
        [ValidateInput]
        [ValidateAntiForgeryToken]
        [NoParametersLogAction]
        public IActionResult Form(DeptDto model)
        {
            _deptService.Data = model;
            return SuccessJsonResult();
        }

        [HttpPost]
        [ValidateInput]
        [ValidateAntiForgeryToken]
        [NoParametersLogAction]
        public async Task<IActionResult> Delete(int id = 0)
        {
            await _deptService.Delete(id);
            return SuccessJsonResult();
        }
    }
}