using Ace.Admin.Models;
using Ace.Dto;
using Ace.Framework.Controller;
using Ace.Framework.Model;
using Ace.Service.Log;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Options;

namespace Ace.Admin.Controllers
{
    public class BaseController : SuperController
    {
        protected IOptions<ProjectSetting> _projectSetting;
        protected ILogService _logService;

        public BaseController()
        {
        }

        public override InfoLogModel GetLog(ActionExecutingContext context)
        {
            _logService = (ILogService)HttpContext.RequestServices.GetService(typeof(ILogService));
            _projectSetting = (IOptions<ProjectSetting>)HttpContext.RequestServices.GetService(typeof(IOptions<ProjectSetting>));
            var logModel = base.GetLog(context);
            if (logModel != null)
            {
                logModel.SystemName = _projectSetting.Value.SystemName;
                //TODO 写日志
                InfoLogDto logDto = new InfoLogDto()
                {
                    SystemName = logModel.SystemName,
                    ActionName = logModel.ActionName,
                    ControllerName = logModel.ControllerName,
                    HttpStatusCode = logModel.HttpStatusCode,
                    IPAddress = logModel.IpAddress,
                    UserID = logModel.UserID,
                    LoginName = logModel.LoginName,
                    Method = logModel.Method,
                    Parameter = logModel.Parameter,
                    Url = logModel.Url,
                    OperateTime = logModel.OperateTime
                };
                _logService.WriteInfoLog(logDto);
                Core.Service.LogService.Info(logDto.Url + (string.IsNullOrEmpty(logDto.Parameter) ? "" : ("?" + logDto.Parameter)));
            }
            return logModel;
        }
    }
}