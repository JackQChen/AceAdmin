using System.Threading.Tasks;
using Abp.Application.Services;
using Ace.Files.Dto;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Ace.Files
{
    public interface IFileAppService : IApplicationService
    {
        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="file"></param>
        /// <param name="storageName"></param>
        /// <param name="category"></param>
        /// <returns></returns>
        Task<FileDto> Upload(IFormFile file, string storageName = "", string category = "Files");

        /// <summary>
        /// 下载文件
        /// </summary>
        /// <param name="storageName"></param>
        /// <param name="downloadName"></param>
        /// <param name="category"></param>
        /// <returns></returns>
        Task<IActionResult> Download(string storageName, string downloadName = "", string category = "Files");

        /// <summary>
        /// 删除文件
        /// </summary>
        /// <param name="storageName"></param>
        /// <param name="category"></param>
        /// <returns></returns>
        Task<FileDto> Delete(string storageName, string category);
    }
}
