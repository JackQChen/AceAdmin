using Microsoft.AspNetCore.Mvc.Filters;

namespace Ace.Framework.Filter
{
    /// <summary>
    /// 登录后可以访问的Action
    /// </summary>
    public class LoginAction : ActionFilterAttribute
    {
    }
}
