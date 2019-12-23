using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Application.Services.Dto;
using Abp.Authorization;
using Abp.Domain.Repositories;
using Ace.Common.Dto;
using Ace.Files;
using Ace.UploadFiles.Dto;
using Microsoft.AspNetCore.Http;

namespace Ace.UploadFiles
{
    /// <summary>
    /// 文件上传服务
    /// </summary>
    [AbpAuthorize]
    public class UploadFileAppService : AsyncCrudAppService<UploadFile, UploadFileDto, long, CommonRequestDto>
    {
        private IFileAppService _fileAppService;
        public UploadFileAppService(
            IRepository<UploadFile, long> repository,
            IFileAppService fileAppService)
            : base(repository)
        {
            _fileAppService = fileAppService;
        }

        public async Task<UploadFileDto> Upload(IFormFile file, string category = "Files")
        {
            var fileDto = await _fileAppService.Upload(file, category);
            return await Create(new UploadFileDto
            {
                Category = fileDto.Category,
                DisplayName = fileDto.DisplayName,
                StoreName = fileDto.StoreName
            });
        }

        public async override Task Delete(EntityDto<long> input)
        {
            var uploadFile = await Get(input);
            await _fileAppService.Delete(uploadFile.StoreName, uploadFile.Category);
            await base.Delete(input);
        }

    }
}
