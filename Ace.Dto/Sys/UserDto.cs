using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Ace.Dto
{
    public class UserDto
    {
        public UserDto()
        {
            this.RoleIdList = new int[] { };
        }

        public int UserID { get; set; }

        [Required(ErrorMessage = "用户姓名不能为空")]
        [MaxLength(32, ErrorMessage = "{0}最长{1}位")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "登录账号不能为空")]
        public string LoginName { get; set; }

        [Required]
        public int DeptID { get; set; }

        public string DeptName { get; set; }

        public string Password { get; set; }

        public string Sex { get; set; }

        public DateTime? Birth { get; set; }

        public string Code { get; set; }

        public byte[] Photo { get; set; }

        public string Remark { get; set; }

        public int[] RoleIdList { get; set; }
    }
}
