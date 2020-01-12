using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Abp.Application.Services.Dto;
using Abp.AutoMapper;

namespace Ace.Modules.Dto
{
    [AutoMap(typeof(Module))]
    public class ModuleDto : AuditedEntityDto
    {
        public int? ParentId { get; set; }

        public List<ModuleDto> Children { get; set; }

        [Required]
        [MaxLength(64)]
        public string Name { get; set; }

        [Required]
        [MaxLength(128)]
        public string Url { get; set; }

        [Required]
        [MaxLength(128)]
        public string PermissionName { get; set; }

    }
}
