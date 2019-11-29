using System.ComponentModel.DataAnnotations;
using Abp.Application.Services.Dto;
using Abp.AutoMapper;

namespace Ace.Modules.Dto
{
    [AutoMap(typeof(Module))]
    public class ModuleDto : AuditedEntityDto
    {
        [Required]
        [MaxLength(64)]
        public string Name { get; set; }

        [Required]
        [MaxLength(128)]
        public string Url { get; set; }

        [Required]
        [MaxLength(128)]
        public string Component { get; set; }

        [Required]
        [MaxLength(128)]
        public string PermissionName { get; set; }

    }
}
