using System.Threading.Tasks;
using Ace.Core.Page;
using Ace.Dto;
using Ace.Framework.Filter;
using Microsoft.AspNetCore.Mvc;

namespace Ace.Admin.Controllers
{
    public class LogController : BaseController
    {
        public LogController()
        {
        }

        [HttpGet]
        [NoLogAction]
        public IActionResult ReqeustLogManger()
        {
            return View();
        }
        [HttpGet]
        [NoLogAction]
        public async Task<IActionResult> ReqeustLogPagedList(int pageIndex = 1, string ControllerName = null, string ActionName = null)
        {
            var list = await _logService.GetInfoLogPageListAsync(new PageOption(pageIndex, _projectSetting.Value.PageSize), ControllerName, ActionName);
            return list.ToPageData();
        }
        [HttpGet]
        [NoLogAction]
        public IActionResult ExceptionLogManger()
        {
            return View();
        }
        [HttpGet]
        [NoLogAction]
        public async Task<IActionResult> ExceptionLogPagedList(int pageIndex = 1, string ControllerName = null, string ActionName = null)
        {
            var list = await _logService.GetErrorLogPageListAsync(new PageOption(pageIndex, _projectSetting.Value.PageSize), ControllerName, ActionName);
            return list.ToPageData();
        }

        [HttpPost]
        [NoLogAction]
        [PublicAction]
        [Produces("application/json")]
        //[Route("writeExceptionLog")]
        public void WriteExceptionLog(ErrorLogDto model)
        {
            try
            {
                if (model.SecretKey == _projectSetting.Value.SecretKey)
                    _logService.WriteErrorLog(model);
            }
            catch
            {
            }
        }
    }
}