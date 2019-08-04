using System.Threading.Tasks;
using Ace.Admin.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace Ace.Admin.Areas.SystemManage.Controllers
{
    [Area("SystemManage")]
    public class SysErrorLogController : BaseController
    {

        public SysErrorLogController()
        {
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> GetErrorPageList(Pagination pagination, string search)
        {
            return (await _logService.GetErrorLogPageListAsync(pagination.ToPageOption(), search)).ToPageData();
        }
    }
}