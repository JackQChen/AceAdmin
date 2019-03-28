using Ace.Dto;
using Ace.Framework.Filter;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace Ace.Boss.Controllers
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
            //int a = 0;
            //a = 3 / a;
            return View();
        }
        [HttpGet]
        [NoLogAction]
        public async Task<IActionResult> ReqeustLogPagedList(int pageIndex = 1, string ControllerName = null, string ActionName = null)
        {
            var list = await _logService.GetRequestLogPageListAsync(pageIndex, _projectSetting.Value.PageSize, ControllerName, ActionName);
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
            var list = await _logService.GetExceptionLogPageListAsync(pageIndex, _projectSetting.Value.PageSize, ControllerName, ActionName);
            return list.ToPageData();
        }

        [HttpPost]
        [NoLogAction]
        [PublicAction]
        [Produces("application/json")]
        //[Route("writeExceptionLog")]
        public void WriteExceptionLog(ExceptionLogDto model)
        {
            try
            {
                if (model.SecretKey == _projectSetting.Value.SecretKey)
                    _logService.WriteExceptionLog(model);
            }
            catch
            {
            }
        }
    }
}