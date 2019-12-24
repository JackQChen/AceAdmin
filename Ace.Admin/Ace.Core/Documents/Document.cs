using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Abp.Domain.Entities;
using Abp.Domain.Entities.Auditing;

namespace Ace.Documents
{
    [Table("Sys_Document")]
    public class Document : CreationAuditedEntity<long>, IMayHaveTenant
    {

        [Required]
        [MaxLength(64)]
        public string DisplayName { get; set; }

        [Required]
        [MaxLength(32)]
        public string Category { get; set; }

        [Required]
        [MaxLength(32)]
        public string StorageName { get; set; }

        public int? TenantId { get; set; }
    }
}
