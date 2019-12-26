using System.Drawing;
using System.IO;
using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Application.Services.Dto;
using Abp.Authorization;
using Abp.Domain.Repositories;
using Ace.Common.Dto;
using Ace.Documents.Dto;
using Ace.Files;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Ace.Documents
{
    /// <summary>
    /// 文档服务
    /// </summary>
    [AbpAuthorize]
    public class DocumentAppService : AsyncCrudAppService<Document, DocumentDto, long, CommonRequestDto>
    {
        private IFileAppService _fileAppService;
        public DocumentAppService(
            IRepository<Document, long> repository,
            IFileAppService fileAppService)
            : base(repository)
        {
            _fileAppService = fileAppService;
        }

        /// <summary>
        /// 创建文档
        /// </summary>
        /// <param name="file"></param>
        /// <param name="category"></param>
        /// <returns></returns>
        public async Task<DocumentDto> CreateDocument(IFormFile file, string category = "Files")
        {
            var fileDto = await _fileAppService.Upload(file, category: category);
            return await Create(new DocumentDto
            {
                Category = fileDto.Category,
                OriginalName = fileDto.OriginalName,
                StorageName = fileDto.StorageName
            });
        }

        /// <summary>
        /// 获取文档
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public async Task<IActionResult> GetDocument(EntityDto<long> input)
        {
            var doc = await Get(input);
            return await _fileAppService.Download(doc.StorageName, doc.OriginalName, doc.Category);
        }

        [HttpGet]
        public async Task<IActionResult> GetThumbnail(EntityDto<long> input, int width)
        {
            var streamResult = await GetDocument(input) as FileStreamResult;
            var img = Image.FromStream(streamResult.FileStream);
            var ms = new MemoryStream();
            img.Save(ms, img.RawFormat);
            var bytes = ms.GetBuffer();
            ms.Close();
            return new FileContentResult(bytes, streamResult.ContentType) { FileDownloadName = streamResult.FileDownloadName };
        }

        /// <summary>
        /// 删除文档
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public async Task DeleteDocument(EntityDto<long> input)
        {
            var doc = await Get(input);
            await _fileAppService.Delete(doc.StorageName, doc.Category);
            await base.Delete(input);
        }

    }
}
