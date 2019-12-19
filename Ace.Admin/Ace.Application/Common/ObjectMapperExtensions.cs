using System.Collections.Generic;
using System.Linq;
using Abp.Application.Services.Dto;
using Abp.Domain.Entities;
using Abp.ObjectMapping;

namespace Ace.Common
{
    public static class ObjectMapperExtensions
    {
        public static void MapList<TEntity, TPrimaryKey>(this IObjectMapper objectMapper, IEnumerable<IEntityDto<TPrimaryKey>> dtos, ICollection<TEntity> entities)
            where TEntity : IEntity<TPrimaryKey>
        {
            var oldArray = entities.Select(s => s.Id).ToArray();
            var newArray = dtos.Select(s => s.Id).ToArray();
            var updateArray = oldArray.Intersect(newArray);
            var insertArray = newArray.Except(oldArray);
            var deleteArray = oldArray.Except(newArray);
            foreach (var id in updateArray)
            {
                objectMapper.Map(dtos.First(p => p.Id.Equals(id)), entities.First(p => p.Id.Equals(id)));
            }
            foreach (var entity in dtos.Where(p => insertArray.Contains(p.Id)).Select(s => objectMapper.Map<TEntity>(s)))
            {
                entities.Add(entity);
            }
            foreach (var id in deleteArray)
            {
                entities.Remove(entities.First(p => p.Id.Equals(id)));
            }
        }
    }
}
