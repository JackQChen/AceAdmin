using System;
using System.IO;
using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Authorization;
using Ace.Files.Dto;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.StaticFiles;

namespace Ace.Files
{
    /// <summary>
    /// 文件服务
    /// </summary>
    [AbpAuthorize]
    public class FileAppService : ApplicationService, IFileAppService
    {
        private const string rootCategory = "Upload";
        private readonly IHostingEnvironment _env;

        public FileAppService(IHostingEnvironment env)
        {
            _env = env;
        }

        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="file"></param>
        /// <param name="category"></param>
        /// <returns></returns>
        [RequestSizeLimit(10_000_000)]
        //[DisableRequestSizeLimit]
        public async Task<FileDto> Upload(IFormFile file, string category = "Files")
        {
            return await Task.Run(() =>
            {
                var dirPath = Path.Combine(_env.ContentRootPath, rootCategory, category);
                if (!Directory.Exists(dirPath))
                    Directory.CreateDirectory(dirPath);
                var fileName = BitConverter.ToInt64(Guid.NewGuid().ToByteArray()) + Path.GetExtension(file.FileName);
                var filePath = Path.Combine(dirPath, fileName);
                using (var fs = File.Create(filePath))
                {
                    file.CopyTo(fs);
                    fs.Flush();
                }
                return new FileDto
                {
                    DisplayName = file.FileName,
                    StoreName = fileName,
                    Category = category
                };
            });
        }

        /// <summary>
        /// 下载文件
        /// </summary>
        /// <param name="storeName"></param>
        /// <param name="category"></param>
        /// <returns></returns>
        public async Task<IActionResult> Download(string storeName, string category = "Files")
        {
            return await Task.Run(() =>
            {
                var contentType = new FileExtensionContentTypeProvider().Mappings[Path.GetExtension(storeName)];
                var filePath = Path.Combine(_env.ContentRootPath, rootCategory, category, storeName);
                if (!File.Exists(filePath))
                {
                    return new NotFoundResult() as IActionResult;
                }
                return new FileStreamResult(File.OpenRead(filePath), contentType)
                {
                    FileDownloadName = storeName
                };
            });
        }

        /// <summary>
        /// 删除文件
        /// </summary>
        /// <param name="storeName"></param>
        /// <param name="category"></param>
        /// <returns></returns>
        public async Task<FileDto> Delete(string storeName, string category = "Files")
        {
            return await Task.Run(() =>
             {
                 var filePath = Path.Combine(_env.ContentRootPath, rootCategory, category, storeName);
                 if (File.Exists(filePath))
                 {
                     File.Delete(filePath);
                 }
                 return new FileDto
                 {
                     Category = category,
                     StoreName = storeName
                 };
             });
        }
    }
}
