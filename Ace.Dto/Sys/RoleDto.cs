using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Ace.Dto
{
    public class RoleDto
    {
        [Required(ErrorMessage = "角色ID不能为空")]
        public int RoleID { get; set; }

        [Required(ErrorMessage = "角色名称不能为空")]
        public string RoleName { get; set; }

        public string Description { get; set; }
    }
}
