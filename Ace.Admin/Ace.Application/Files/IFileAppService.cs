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
        /// <param name="category"></param>
        /// <returns></returns>
        Task<FileDto> Upload(IFormFile file, string category);

        /// <summary>
        /// 下载文件
        /// </summary>
        /// <param name="storeName"></param>
        /// <param name="category"></param>
        /// <returns></returns>
        Task<IActionResult> Download(string storeName, string category);

        /// <summary>
        /// 删除文件
        /// </summary>
        /// <param name="storeName"></param>
        /// <param name="category"></param>
        /// <returns></returns>
        Task<FileDto> Delete(string storeName, string category);
    }
}
