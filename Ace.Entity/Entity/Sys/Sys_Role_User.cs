using Ace.Core.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Entity
{
    [Serializable]

    public class Sys_Role_User
    {
        [Key]
        [Display(Name = "角色ID")]
        public int RoleID { get; set; }

        [Key]
        [Display(Name = "用户ID")]
        public int UserID { get; set; }
    }
}
