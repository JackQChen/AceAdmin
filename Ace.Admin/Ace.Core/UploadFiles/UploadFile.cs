using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Abp.Domain.Entities;
using Abp.Domain.Entities.Auditing;

namespace Ace.UploadFiles
{
    [Table("Sys_UploadFiles")]
    public class UploadFile : CreationAuditedEntity<long>, IMayHaveTenant
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

        public int? TenantId { get; set; }
    }
}
