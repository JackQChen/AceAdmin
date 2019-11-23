using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Abp.Domain.Entities;
using Abp.Domain.Entities.Auditing;
using Ace.Modules;

namespace Ace.Menus
{
    [Table("Sys_Menus")]
    public class Menu : AuditedEntity, IMayHaveTenant, IPassivable
    {

        public int? ParentId { get; set; }

        public Menu Parent { get; set; }

        public IReadOnlyList<Menu> Children { get; set; }

        [Required]
        [MaxLength(64)]
        public string Name { get; set; }

        [MaxLength(64)]
        public string Icon { get; set; }

        public int? ModuleId { get; set; }

        [ForeignKey("ModuleId")]
        public Module Module { get; set; }

        public int Order { get; set; }

        [MaxLength(128)]
        public string CustomData { get; set; }

        public int? TenantId { get; set; }

        public bool IsActive { get; set; }
    }
}
