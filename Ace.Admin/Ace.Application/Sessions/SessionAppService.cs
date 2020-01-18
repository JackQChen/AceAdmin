using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Auditing;
using Abp.Authorization;
using Abp.Domain.Repositories;
using Abp.Extensions;
using Ace.Menus;
using Ace.Menus.Dto;
using Ace.Sessions.Dto;
using Microsoft.EntityFrameworkCore;

namespace Ace.Sessions
{
    [AbpAuthorize]
    public class SessionAppService : AceAppServiceBase, ISessionAppService
    {

        IRepository<Menu> _menuRepository;
        public SessionAppService(IRepository<Menu> menuRepository)
        {
            _menuRepository = menuRepository;
        }

        [DisableAuditing]
        public async Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformations()
        {
            var output = new GetCurrentLoginInformationsOutput
            {
                Application = new ApplicationInfoDto
                {
                    Version = AppVersionHelper.Version,
                    ReleaseDate = AppVersionHelper.ReleaseDate,
                    Features = new Dictionary<string, bool>()
                }
            };
            if (AbpSession.TenantId.HasValue)
            {
                output.Tenant = ObjectMapper.Map<TenantLoginInfoDto>(await GetCurrentTenantAsync());
            }
            if (AbpSession.UserId.HasValue)
            {
                output.User = ObjectMapper.Map<UserLoginInfoDto>(await GetCurrentUserAsync());
            }
            return output;
        }

        [DisableAuditing]
        public async Task<List<MenuNodeDto>> GetMenuTree(int? parentId)
        {
            var menuList = await _menuRepository.GetAllIncluding(p => p.Module).ToListAsync();
            var menuDtoList = menuList
                .Where(p => p.ParentId == parentId)
                .OrderBy(k => k.Order)
                .Select(s => ObjectMapper.Map<MenuDto>(s)).ToList();
            SetGrantedCount(menuDtoList);
            var nodeList = new List<MenuNodeDto>();
            BuildMenuTree(menuDtoList, nodeList);
            return nodeList;
        }

        private void SetGrantedCount(List<MenuDto> menuDtoList)
        {
            foreach (var menuDto in menuDtoList)
            {
                SetGrantedCount(menuDto.Children);
                if (menuDto.PermissionName.IsNullOrEmpty())
                    menuDto.GrantedCount = menuDto.Children.Sum(p => p.GrantedCount);
                else
                    if (PermissionManager.GetPermissionOrNull(menuDto.PermissionName) == null)
                    menuDto.GrantedCount = 0;
                else
                    menuDto.GrantedCount = PermissionChecker.IsGranted(menuDto.PermissionName) ? 1 : 0;
            }
        }

        private void BuildMenuTree(List<MenuDto> menuDtoList, List<MenuNodeDto> nodeList)
        {
            foreach (var menuDto in menuDtoList.Where(p => p.IsActive && p.GrantedCount > 0).OrderBy(k => k.Order))
            {
                var node = ObjectMapper.Map<MenuNodeDto>(menuDto);
                node.Children.Clear();
                nodeList.Add(node);
                BuildMenuTree(menuDto.Children, node.Children);
            }
        }
    }
}
