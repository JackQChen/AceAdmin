using Ace.Core.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Ace.Entity
{
    [Serializable]
    public class Sys_Role : BaseEntity<int>
    {

        /// <summary>
        /// 角色名称
        /// </summary>
        [Display(Name = "角色名称")]
        [Required]
        [MaxLength(32, ErrorMessage = "{0}最长{1}位")]
        public string Name { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [Display(Name = "描述")]
        [MaxLength(50, ErrorMessage = "{0}最长{1}位")]
        public string Description { get; set; }
    }
}