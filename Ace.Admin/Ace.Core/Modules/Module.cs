using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Abp.Domain.Entities;
using Abp.Domain.Entities.Auditing;

namespace Ace.Modules
{
    [Table("Sys_Modules")]
    public class Module : AuditedEntity, IMayHaveTenant, IPassivable
    {
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
