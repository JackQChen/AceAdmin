using System.ComponentModel.DataAnnotations;
using Abp.Application.Services.Dto;
using Abp.AutoMapper;

namespace Ace.UploadFiles.Dto
{
    [AutoMap(typeof(UploadFile))]
    public class UploadFileDto : EntityDto<long>
    {
        [Required]
        [MaxLength(64)]
        public string DisplayName { get; set; }

        [Required]
        [MaxLength(32)]
        public string Category { get; set; }

        [Required]
        [MaxLength(32)]
        public string StoreName { get; set; }
    }
}
