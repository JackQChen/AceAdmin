using Ace.Core.Data;

namespace Ace.Entity
{
    public  class EfRespository<T> : Repository<T> where T : BaseEntity
    {
        private EfDbContext _context;
        public EfRespository(EfDbContext context) : base(context)
        {
            var t = this;
            _context = context;
        }
    }
}
