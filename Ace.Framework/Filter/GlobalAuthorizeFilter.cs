using System;
using System.Linq;
using System.Net;
using System.Text;
using Ace.Core.Cache;
using Ace.Framework.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Configuration;

namespace Ace.Framework.Filter
{
    //全局权限过滤器
    public class GlobalAuthorizeFilter : IAuthorizationFilter
    {
        private readonly ICacheManager _cacheManager;
        public IConfiguration Configuration { get; }
        public GlobalAuthorizeFilter(IConfiguration configuration, ICacheManager _cacheManager)
        {
            this.Configuration = configuration;
            this._cacheManager = _cacheManager;
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            //不需要登录
            if (HasActionAttribute<PublicAction>(context))
            {
                return;
            }
            var conf = (IConfiguration)context.HttpContext.RequestServices.GetService(typeof(IConfiguration));
            var cookieKey = conf.GetSection("ProjectSetting")["CookieKey"];
            string cookieValue = null;
            context.HttpContext.Request.Cookies.TryGetValue(cookieKey, out cookieValue);
            if (string.IsNullOrEmpty(cookieValue))
            {
                string msg = "未登录或登录状态失效，请重新登录";
                ErrorReturn(context, msg, 400);
                return;
            }
            //更新cookie过期时间
            context.HttpContext.Response.Cookies.Append(cookieKey, cookieValue, new CookieOptions
            {
                Expires = DateTime.Now.AddMinutes(conf.GetSection("ProjectSetting")["SessionTimeOut"].ToInt()),
                HttpOnly = true
            });
            //用户缓存key
            string userCacheKey = "user_" + cookieValue;
            //获取缓存时会更新缓存过期时间
            var currentSysUser = _cacheManager.Get<CurrentSysUser>(userCacheKey);
            //用户未登录或登录状态失效
            if (currentSysUser == null)
            {
                string msg = "未登录或登录状态失效，请重新登录";
                ErrorReturn(context, msg, 400);
                return;
            }
            //暂存以便读取
            context.HttpContext.Items["currentUser"] = currentSysUser;
            //只需要登录，不需要授权
            if (HasActionAttribute<LoginAction>(context))
            {
                return;
            }
            var route = context.ActionDescriptor.RouteValues;
            var url = string.Join('/', route["area"], route["controller"], route["action"]);
            bool hasMenu = currentSysUser.MenuList.Any(p =>
            {
                return url.StartsWith(p.URL);
            });
            if (hasMenu == false)
            {
                ErrorReturn(context, $"菜单[{url}]没有权限，请联系管理员", 401);
            }
        }

        private static void ErrorReturn(AuthorizationFilterContext filterContext, string msg, int code)
        {
            if (IsAjax(filterContext))
            {
                msg = WebUtility.HtmlDecode(WebUtility.UrlDecode(msg ?? ""));
                var data = new { msg, code };
                filterContext.Result = new JsonResult(data);
            }
            else
            {
                msg = WebUtility.HtmlEncode(WebUtility.UrlEncode(msg ?? ""));
                filterContext.Result = new RedirectResult("/Account/Login?error=" + msg);
            }
        }
        public static bool IsAjax(AuthorizationFilterContext filterContext)
        {
            bool result = false;
            var xreq = filterContext.HttpContext.Request.Headers.ContainsKey("x-requested-with");
            if (xreq)
            {
                result = filterContext.HttpContext.Request.Headers["x-requested-with"] == "XMLHttpRequest";
            }
            return result;
        }
        public bool HasActionAttribute<T>(AuthorizationFilterContext context) where T : ActionFilterAttribute
        {
            return context.Filters.Any(p => p is T);
        }

    }
}
