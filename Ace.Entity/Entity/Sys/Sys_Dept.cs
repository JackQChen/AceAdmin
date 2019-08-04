using Ace.Core.Data;
using System;
using System.ComponentModel.DataAnnotations;

namespace Ace.Entity
{
    [Serializable]
    public class Sys_Dept : BaseEntity<int>
    {
        /// <summary>
        /// 部门名称
        /// </summary>
        [Display(Name = "部门名称")]
        [Required]
        [MaxLength(128, ErrorMessage = "{0}最长{1}位")]
        public string Name { get; set; }

        /// <summary>
        /// 父级部门ID
        /// </summary>
        [Display(Name = "父级部门ID")]
        [Required]
        public int ParentID { get; set; }

        /// <summary>
        /// 部门编码
        /// </summary>
        [Display(Name = "部门编码")]
        [MaxLength(32, ErrorMessage = "{0}最长{1}位")]
        public string Code { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Display(Name = "排序")]
        [Required]
        public int Sort { get; set; }

    }
}