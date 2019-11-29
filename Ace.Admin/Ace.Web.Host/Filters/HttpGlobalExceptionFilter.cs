using System.Net;
using Abp.AspNetCore.Configuration;
using Abp.AspNetCore.Mvc.ExceptionHandling;
using Abp.Web.Models;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Ace.Web.Host.Filters
{
    public class HttpGlobalExceptionFilter : AbpExceptionFilter
    {
        public HttpGlobalExceptionFilter(IErrorInfoBuilder errorInfoBuilder, IAbpAspNetCoreConfiguration configuration)
            : base(errorInfoBuilder, configuration)
        {

        }

        protected override int GetStatusCode(ExceptionContext context, bool wrapOnError)
        {
            return HttpStatusCode.OK.GetHashCode();
        }
    }
}
