using Ace.Core.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Ace.Entity
{
    //角色菜单
    [Serializable]
    /// <summary>
    /// 角色菜单
    /// </summary>
    public class Sys_Role_Menu : BaseEntity<int>
    {
        /// <summary>
        /// 角色ID
        /// </summary>
        [Display(Name = "角色ID")]
        [Required]
        public int RoleID { get; set; }

        /// <summary>
        /// 菜单ID
        /// </summary>
        [Display(Name = "菜单ID")]
        [Required]
        public int MenuID { get; set; }

    }
}