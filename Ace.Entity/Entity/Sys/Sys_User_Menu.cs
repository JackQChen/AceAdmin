using System;
using System.ComponentModel.DataAnnotations;

namespace Ace.Entity
{

    //人员菜单
    [Serializable]
    /// <summary>
    /// 人员菜单
    /// </summary>
    public class Sys_User_Menu
    {
        [Key]
        [Display(Name = "角色ID")]
        public int UserID { get; set; }

        [Key]
        [Display(Name = "菜单ID")]
        public int MenuID { get; set; }
    }
}