using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Authorization;
using Abp.Domain.Repositories;
using Abp.Extensions;
using Abp.Runtime.Session;
using Ace.Configuration.Dto;
using Ace.Menus;
using Ace.Menus.Dto;

namespace Ace.Configuration
{
    [AbpAuthorize]
    public class ConfigurationAppService : AceAppServiceBase
    {
        IRepository<Menu> _menuRepository;
        public ConfigurationAppService(IRepository<Menu> menuRepository)
        {
            _menuRepository = menuRepository;
        }

        public async Task ChangeUiTheme(ChangeUiThemeInput input)
        {
            await SettingManager.ChangeSettingForUserAsync(AbpSession.ToUserIdentifier(), AppSettingNames.UiTheme, input.Theme);
        }

        public async Task<List<MenuNodeDto>> GetMenuTree(int? parentId)
        {
            return await Task.Run(() =>
           {
               var menuList = _menuRepository.GetAllIncluding(p => p.Module).ToList();
               var menuDtoList = menuList.Where(p => p.ParentId == parentId).Select(s => ObjectMapper.Map<MenuDto>(s)).ToList();
               SetGrantedCount(menuDtoList);
               var nodeList = new List<MenuNodeDto>();
               BuildMenuTree(menuDtoList, nodeList);
               return nodeList;
           });
        }

        private void SetGrantedCount(List<MenuDto> menuDtoList)
        {
            foreach (var menuDto in menuDtoList)
            {
                SetGrantedCount(menuDto.Children);
                if (menuDto.PermissionName.IsNullOrEmpty())
                    menuDto.GrantedCount = menuDto.Children.Sum(p => p.GrantedCount);
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
