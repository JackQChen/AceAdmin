using Microsoft.AspNetCore.Mvc.Filters;

namespace Ace.Framework.Filter
{
    /// <summary>
    /// 不记录日志的Action
    /// </summary>
    public class NoLogAction : ActionFilterAttribute
    {
    }
}
