using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Ace.Core.Data
{

    public class EntityTypeConfiguration<T> : IEntityTypeConfiguration<T> where T : class
    {
        public void Configure(EntityTypeBuilder<T> builder)
        {
            RelyConfigure(builder);
        }
        public virtual void RelyConfigure(EntityTypeBuilder<T> builder)
        {

        }
    }
}
