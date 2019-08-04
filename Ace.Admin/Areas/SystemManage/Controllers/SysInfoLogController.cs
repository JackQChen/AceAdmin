using System.Threading.Tasks;
using Ace.Admin.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace Ace.Admin.Areas.SystemManage.Controllers
{
    [Area("SystemManage")]
    public class SysInfoLogController : BaseController
    {

        public SysInfoLogController()
        {
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> GetInfoPageList(Pagination pagination, string search)
        {
            return (await _logService.GetInfoLogPageListAsync(pagination.ToPageOption(), search)).ToPageData();
        }
    }
}