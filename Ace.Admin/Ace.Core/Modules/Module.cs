using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Abp.Domain.Entities;
using Abp.Domain.Entities.Auditing;

namespace Ace.Modules
{
    [Table("Sys_Modules")]
    public class Module : AuditedEntity, IMayHaveTenant, IPassivable
    {
        public int? ParentId { get; set; }

        public Module Parent { get; set; }

        public IReadOnlyList<Module> Children { get; set; }

        [Required]
        [MaxLength(64)]
        public string Name { get; set; }

        [Required]
        [MaxLength(128)]
        public string Url { get; set; }

        [Required]
        [MaxLength(128)]
        public string PermissionName { get; set; }

        public int? TenantId { get; set; }

        public bool IsActive { get; set; }
    }
}
