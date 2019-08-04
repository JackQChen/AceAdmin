using System;
using System.Linq;
using System.Net;
using Ace.Framework.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Configuration;
using Ace.Core.Service;

namespace Ace.Framework.Filter
{
    public class GlobalExceptionFilter : IExceptionFilter
    {
        public IConfiguration Configuration { get; }

        public GlobalExceptionFilter(IConfiguration configuration)
        {
            this.Configuration = configuration;
        }

        public void OnException(ExceptionContext context)
        {
            var httpContext = context.HttpContext;
            var values = context.ActionDescriptor.RouteValues.Values.ToArray();
            string actionName = values[0];
            string controllerName = values[1];
            string paramter = string.Empty;
            var method = httpContext.Request.Method;
            if (method == "POST")
            {
                var form = httpContext.Request.Form;
                foreach (var item in form)
                {
                    var key = item.Key;
                    if (key == "__RequestVerificationToken")
                    {
                        continue;
                    }
                    var value = item.Value;
                    paramter += "&" + key + "=" + value;
                }
                paramter = paramter.TrimStart('&');
            }
            else
            {
                paramter = httpContext.Request.QueryString.Value;
            }
            paramter = WebUtility.UrlEncode(paramter);
            var exception = context.Exception;
            string errorMsg = exception.Message;
            if (exception.InnerException != null)
            {
                errorMsg = exception.InnerException.Message;
                if (exception.InnerException.InnerException != null)
                {
                    errorMsg = exception.InnerException.InnerException.Message;
                }
            }
            var msg = WebUtility.HtmlDecode(WebUtility.UrlDecode(errorMsg ?? ""));
            var data = new { msg, code = 500 };
            context.Result = new JsonResult(data);

            errorMsg = WebUtility.UrlEncode(errorMsg);
            try
            {
                var systemName = Configuration.GetSection("ProjectSetting")["SystemName"];
                var secretKey = Configuration.GetSection("ProjectSetting")["SecretKey"];
                var user = httpContext.Items["currentUser"] as CurrentSysUser;
                //写错误日志
                ErrorLogModel model = new ErrorLogModel()
                {
                    ActionName = actionName,
                    ControllerName = controllerName,
                    HttpType = method,
                    Parameter = paramter,
                    ErrorMessage = errorMsg,
                    CreateTime = DateTime.Now,
                    IpAddress = httpContext.Connection.RemoteIpAddress.ToString(),
                    Url = httpContext.Request.Host.Value + httpContext.Request.Path,
                    UserID = user == null ? 0 : user.UserID,
                    LoginName = user == null ? null : user.LoginName,
                    SystemName = systemName,
                    SecretKey = secretKey
                };
                LogService.Error(model.ErrorMessage);
                //var apiUrl = Configuration.GetSection("ProjectSetting")["ApiUrl"];
                //Utility.HttpHelper.Post(apiUrl + "/log/writeExceptionLog", model);
            }
            catch
            {
                //throw;
            }
        }
    }
}
