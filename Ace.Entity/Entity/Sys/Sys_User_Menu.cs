using Ace.Core.Data;
using System;
using System.ComponentModel.DataAnnotations;

namespace Ace.Entity
{

    //人员菜单
    [Serializable]
    /// <summary>
    /// 人员菜单
    /// </summary>
    public class Sys_User_Menu : BaseEntity<int>
    {
        /// <summary>
        /// 人员ID
        /// </summary>
        [Display(Name = "角色ID")]
        [Required]
        public int UserID { get; set; }

        /// <summary>
        /// 菜单ID
        /// </summary>
        [Display(Name = "菜单ID")]
        [Required]
        public int MenuID { get; set; }

        /// <summary>
        /// 1：附加，-1：移除
        /// </summary>
        [Display(Name = "菜单ID")]
        [Required]
        public int Mode { get; set; }
    }
}