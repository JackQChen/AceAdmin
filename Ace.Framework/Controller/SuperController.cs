using System;
using System.Linq;
using System.Net;
using Ace.Framework.Filter;
using Ace.Framework.Model;
using Ace.Framework.Validation;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Ace.Framework.Controller
{
    public class SuperController : Microsoft.AspNetCore.Mvc.Controller
    {
        public CurrentSysUser CurrentSysUser
        {
            get
            {
                return Request.HttpContext.Items["currentUser"] as CurrentSysUser;
            }
        }

        public string GetCacheKey(string value)
        {
            return "user_" + value;
        }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            //获取日志
            GetLog(context);
            //验证提交的实体有效性
            if (HasActionAttribute<ValidateInput>(context) && IsAjax(context))
            {
                var errorMsg = GetValidateErrorMessage(context);
                if (!string.IsNullOrEmpty(errorMsg))
                {
                    context.Result = ErrorJsonResult(errorMsg);
                }
            }
            base.OnActionExecuting(context);
        }

        public JsonResult SuccessJsonResult(string info = null, object data = null)
        {
            return new JsonResult(new PostReturnJson() { code = 200, msg = info, data = data });
        }
        public JsonResult ErrorJsonResult(string errorMsg)
        {
            return new JsonResult(new PostReturnJson() { code = 500, msg = errorMsg });
        }
        public virtual InfoLogModel GetLog(ActionExecutingContext context)
        {
            if (HasActionAttribute<NoLogAction>(context))
            {
                return null;
            }
            bool isNoParamsLog = HasActionAttribute<NoParametersLogAction>(context);
            var httpContext = context.HttpContext;
            var method = httpContext.Request.Method;
            string paramter = string.Empty;
            if (isNoParamsLog)
            {
                paramter = "敏感参数不记录";
            }
            else
            {
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
            }
            paramter = WebUtility.HtmlDecode(WebUtility.UrlDecode(paramter ?? ""));
            var ipAddress = httpContext.Connection.RemoteIpAddress.ToString();
            var url = httpContext.Request.Host.Value + httpContext.Request.Path;
            url = WebUtility.UrlDecode(url);
            var httpStatusCode = httpContext.Response.StatusCode;
            var user = CurrentSysUser;
            var route = context.ActionDescriptor.RouteValues;
            //写日志
            var logModel = new InfoLogModel()
            {
                Method = method,
                Parameter = paramter,
                ActionName = route["action"],
                ControllerName = route["controller"],
                IpAddress = ipAddress,
                Url = url,
                HttpStatusCode = httpStatusCode,
                SystemName = null,
                UserID = user == null ? 0 : user.UserID,
                LoginName = user == null ? null : user.LoginName,
                OperateTime = DateTime.Now
            };
            return logModel;
        }
        public static bool IsAjax(ActionExecutingContext filterContext)
        {
            bool result = false;
            var xreq = filterContext.HttpContext.Request.Headers.ContainsKey("x-requested-with");
            if (xreq)
            {
                result = filterContext.HttpContext.Request.Headers["x-requested-with"] == "XMLHttpRequest";
            }
            return result;
        }
        public string GetValidateErrorMessage(ActionExecutingContext context)
        {
            string errorMessage = string.Empty;
            foreach (var item in ModelState.Values)
            {
                foreach (var error in item.Errors)
                    errorMessage += error.ErrorMessage + Environment.NewLine;
            }
            return errorMessage;
        }
        public bool HasActionAttribute<T>(FilterContext context) where T : ActionFilterAttribute
        {
            return context.Filters.Any(p => p is T);
        }

    }
}
