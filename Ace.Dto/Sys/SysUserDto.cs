using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Ace.Dto
{
    public class SysUserDto
    {
        public SysUserDto()
        {
            this.RoleList = new List<RoleDto>();
        }
        public int UserID { get; set; }

        public string UserName { get; set; }

        [Required(ErrorMessage = "登录名不能为空")]
        public string LoginName { get; set; }

        [Required(ErrorMessage = "登录密码不能为空")]
        public string Password { get; set; }

        public string Code { get; set; }

        public string Remark { get; set; }

        public List<RoleDto> RoleList { get; set; }
    }
}
