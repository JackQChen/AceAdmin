using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Ace.Controllers
{
    [Route("api/services/app/[controller]/[action]")]
    public class FileController : AceControllerBase
    {
        private readonly IHostingEnvironment _env;

        public FileController(IHostingEnvironment env)
        {
            _env = env;
        }

        /// <summary>
        /// 文件上传
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        [HttpPost]
        [RequestSizeLimit(10_000_000)]
        //[DisableRequestSizeLimit]
        public async Task<object> UploadFile(IFormFile file)
        {
            return await Task.FromResult(new
            {
                fileName = file.FileName,
                fileSize = file.Length
            });
        }
    }
}
