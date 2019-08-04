using Microsoft.AspNetCore.Http;

namespace Ace.Core.Http
{
    //参考：https://www.cnblogs.com/linezero/p/6801602.html
    public static class HttpContext
    {
        private static IHttpContextAccessor _accessor;

        public static Microsoft.AspNetCore.Http.HttpContext Current => _accessor.HttpContext;

        internal static void Configure(IHttpContextAccessor accessor)
        {
            _accessor = accessor;
        }
    }
}
