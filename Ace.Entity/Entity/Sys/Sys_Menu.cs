using Ace.Core.Data;
using System;
using System.ComponentModel.DataAnnotations;

namespace Ace.Entity
{
    [Serializable]
    public class Sys_Menu : BaseEntity<int>
    {
        /// <summary>
        /// 模块名称
        /// </summary>
        [Display(Name = "模块名称")]
        [Required]
        [MaxLength(128, ErrorMessage = "{0}最长{1}位")]
        public string Name { get; set; }

        /// <summary>
        /// 父级模块ID
        /// </summary>
        [Display(Name = "父级模块ID")]
        [Required]
        public int ParentID { get; set; }

        /// <summary>
        /// URL
        /// </summary>
        [Display(Name = "URL")]
        [MaxLength(128, ErrorMessage = "{0}最长{1}位")]
        public string URL { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Display(Name = "排序")]
        [Required]
        public int Sort { get; set; }

        /// <summary>
        /// 图标
        /// </summary>
        [Display(Name = "图标")]
        [MaxLength(128, ErrorMessage = "{0}最长{1}位")]
        public string Icon { get; set; }
    }
}