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
    public class Sys_Role_Menu
    {
        [Key]
        [Display(Name = "角色ID")]
        public int RoleID { get; set; }

        [Key]
        [Display(Name = "菜单ID")]
        public int MenuID { get; set; }

    }
}