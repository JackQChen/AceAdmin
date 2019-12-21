using System;
using System.IO;
using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Ace.Files
{
    /// <summary>
    /// 文件服务
    /// </summary>
    [AbpAuthorize]
    public class FileAppService : ApplicationService
    {
        private readonly IHostingEnvironment _env;

        public FileAppService(IHostingEnvironment env)
        {
            _env = env;
        }

        /// <summary>
        /// 文件上传
        /// </summary>
        /// <param name="file"></param>
        /// <param name="category"></param>
        /// <returns></returns>
        [RequestSizeLimit(10_000_000)]
        //[DisableRequestSizeLimit]
        public async Task<object> UploadFile(IFormFile file, string category = "Files")
        {
            return await Task.Run(() =>
            {
                var dirPath = Path.Combine(_env.ContentRootPath, "UploadFiles", category);
                if (!Directory.Exists(dirPath))
                    Directory.CreateDirectory(dirPath);
                var fileName = BitConverter.ToInt64(Guid.NewGuid().ToByteArray()) + Path.GetExtension(file.FileName);
                var filePath = Path.Combine(dirPath, fileName);
                using (var fs = File.Create(filePath))
                {
                    file.CopyTo(fs);
                    fs.Flush();
                }
                return new
                {
                    fileName,
                    fileSize = file.Length
                };
            });
        }

        /// <summary>
        /// 文件下载
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="category"></param>
        /// <returns></returns>
        public async Task<IActionResult> DownloadFile(string fileName, string category = "Files")
        {
            return await Task.Run(() =>
            {
                var filePath = Path.Combine(_env.ContentRootPath, "UploadFiles", category, fileName);
                return new FileStreamResult(File.OpenRead(filePath), "application/octet-stream")
                {
                    FileDownloadName = fileName
                };
            });
        }
    }
}
