using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Abp.Application.Services.Dto;
using Abp.AutoMapper;

namespace Ace.Menus.Dto
{
    [AutoMap(typeof(Menu))]
    public class MenuDto : AuditedEntityDto
    {

        public int? ParentId { get; set; }

        public List<MenuDto> Children { get; set; }

        [Required]
        [MaxLength(64)]
        public string Name { get; set; }

        [MaxLength(64)]
        public string Icon { get; set; }

        [MaxLength(32)]
        public string ModuleId { get; set; }

        [MaxLength(128)]
        public string Url { get; set; }

        [MaxLength(128)]
        public string PermissionName { get; set; }

        public int GrantedCount { get; set; }

        public int Order { get; set; }

        [MaxLength(128)]
        public string CustomData { get; set; }

        public bool IsActive { get; set; }
    }
}
