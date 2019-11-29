using Microsoft.AspNetCore.Antiforgery;
using Ace.Controllers;

namespace Ace.Web.Host.Controllers
{
    public class AntiForgeryController : AceControllerBase
    {
        private readonly IAntiforgery _antiforgery;

        public AntiForgeryController(IAntiforgery antiforgery)
        {
            _antiforgery = antiforgery;
        }

        public void GetToken()
        {
            _antiforgery.SetCookieTokenAndHeader(HttpContext);
        }
    }
}
