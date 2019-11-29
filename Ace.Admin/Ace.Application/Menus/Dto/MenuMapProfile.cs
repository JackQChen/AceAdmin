using AutoMapper;

namespace Ace.Menus.Dto
{
    public class MenuMapProfile : Profile
    {
        public MenuMapProfile()
        {
            CreateMap<Menu, MenuDto>()
                .ForMember(x => x.Url, opt => opt.MapFrom(x => x.Module.Url))
                .ForMember(x => x.PermissionName, opt => opt.MapFrom(x => x.Module.PermissionName));
        }
    }
}
