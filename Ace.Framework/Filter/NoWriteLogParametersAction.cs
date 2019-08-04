using Microsoft.AspNetCore.Mvc.Filters;

namespace Ace.Framework.Filter
{
    /// <summary>
    /// 不需要记录日志参数的Action(敏感参数不记录)
    /// </summary>
    public class NoParametersLogAction : ActionFilterAttribute
    {
    }
}
