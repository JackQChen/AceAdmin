using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Ace.Core.Data
{
    public class BaseEntity
    {
    }
    [Serializable]
    public class BaseEntity<TKey> : BaseEntity
    {
        public BaseEntity()
        {
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public TKey ID { get; set; }

    }
}
