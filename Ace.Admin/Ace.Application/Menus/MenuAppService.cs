using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Authorization;
using Abp.Domain.Repositories;
using Abp.Extensions;
using Abp.Linq.Extensions;
using Ace.Authorization;
using Ace.Common.Dto;
using Ace.Menus.Dto;
using Microsoft.EntityFrameworkCore;

namespace Ace.Menus
{
    /// <summary>
    /// 菜单管理
    /// </summary>
    [AbpAuthorize(PermissionNames.Admin_Menus)]
    public class MenuAppService : AsyncCrudAppService<Menu, MenuDto, int, CommonRequestDto>
    {

        public MenuAppService(
            IRepository<Menu> repository)
            : base(repository)
        {
        }

        protected override IQueryable<Menu> CreateFilteredQuery(CommonRequestDto input)
        {
            return Repository.GetAll()
                .WhereIf(!input.Keyword.IsNullOrWhiteSpace(), x => x.Name.Contains(input.Keyword))
                .WhereIf(input.IsActive.HasValue, x => x.IsActive == input.IsActive)
                .WhereIf(input.StartTime.HasValue, x => x.CreationTime > input.StartTime)
                .WhereIf(input.EndTime.HasValue, x => x.CreationTime < input.EndTime)
                ;
        }

        public async Task<List<MenuDto>> GetMenuTree(int? parentId)
        {
            var menuList = await Repository.GetAll().ToListAsync();
            return menuList
                .Where(p => p.ParentId == parentId)
                .OrderBy(k => k.Order)
                .Select(s => ObjectMapper.Map<MenuDto>(s)).ToList();
        }

    }
}

