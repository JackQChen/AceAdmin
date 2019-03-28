using Ace.Boss.Models;
using Ace.Core.Service;
using Ace.Dto;
using Ace.Framework.Controller;
using Ace.Framework.Model;
using Ace.Service.Log;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Options;
using System;

namespace Ace.Boss.Controllers
{
    public class BaseController : SuperController
    {
        protected IOptions<ProjectSetting> _projectSetting;
        protected ILogService _logService;

        public BaseController()
        {
        }

        public override RequestLogModel GetLog(ActionExecutingContext context)
        {
            _logService = (ILogService)HttpContext.RequestServices.GetService(typeof(ILogService));
            _projectSetting = (IOptions<ProjectSetting>)HttpContext.RequestServices.GetService(typeof(IOptions<ProjectSetting>));
            var requestLogModel = base.GetLog(context);
            if (requestLogModel != null)
            {
                requestLogModel.SystemName = _projectSetting.Value.SystemName;
                //TODO 写日志
                RequestLogDto requestLogDto = new RequestLogDto()
                {
                    SystemName = requestLogModel.SystemName,
                    ActionName = requestLogModel.ActionName,
                    ControllerName = requestLogModel.ControllerName,
                    HttpStatusCode = requestLogModel.HttpStatusCode,
                    IpAddress = requestLogModel.IpAddress,
                    LoginId = requestLogModel.LoginId,
                    LoginName = requestLogModel.LoginName,
                    Method = requestLogModel.Method,
                    Parameter = requestLogModel.Parameter,
                    Url = requestLogModel.Url,
                    OperateTime = requestLogModel.OperateTime
                };
                _logService.WriteRequestLog(requestLogDto);
                LogServiceHelper.Intance.Write(new LogModel() { CreatedTime = DateTime.Now, Dir = "request", Msg = requestLogDto.Url + "?" + requestLogDto.Parameter, Operator = requestLogDto.LoginName });
            }
            return requestLogModel;
        }
    }
}