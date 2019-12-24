using System.ComponentModel.DataAnnotations;
using Abp.Application.Services.Dto;
using Abp.AutoMapper;

namespace Ace.Documents.Dto
{
    [AutoMap(typeof(Document))]
    public class DocumentDto : CreationAuditedEntityDto<long>
    {
        [Required]
        [MaxLength(64)]
        public string OriginalName { get; set; }

        [Required]
        [MaxLength(32)]
        public string Category { get; set; }

        [Required]
        [MaxLength(32)]
        public string StorageName { get; set; }
    }
}
