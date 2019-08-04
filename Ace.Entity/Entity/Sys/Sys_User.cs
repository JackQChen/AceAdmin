using Ace.Core.Data;
using System;
using System.ComponentModel.DataAnnotations;

namespace Ace.Entity
{

    [Serializable]
    /// <summary>
    /// 用户
    /// </summary>
    public class Sys_User : BaseEntity<int>
    {
        [Required]
        [Display(Name = "登录名")]
        [MaxLength(32, ErrorMessage = "{0}最长{1}位")]
        public string LoginName { get; set; }

        [Required]
        [Display(Name = "密码")]
        [MaxLength(32, ErrorMessage = "{0}最长{1}位")]
        public string Password { get; set; }

        [Required]
        [Display(Name = "姓名")]
        [MaxLength(32, ErrorMessage = "{0}最长{1}位")]
        public string Name { get; set; }

        [Required]
        public int DeptID { get; set; }

        [Display(Name = "性别")]
        public string Sex { get; set; }

        [Display(Name = "出生日期")]
        public DateTime? Birth { get; set; }

        [Display(Name = "编码")]
        public string Code { get; set; }

        [Display(Name = "照片")]
        public int? Photo { get; set; }

        [Display(Name = "备注")]
        public string Remark { get; set; }
    }
}