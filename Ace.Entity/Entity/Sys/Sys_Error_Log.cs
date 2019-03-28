using Ace.Core.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ace.Entity
{
    [Serializable]  
    public class Sys_Error_Log : BaseEntity<int>
    {
       
        public string URL { get; set; }
        public string Parameters { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public string HttpType { get; set; }
        public string Message { get; set; }
        public string SystemName { get; set; }
        public string ErrorSource { get; set; }
        public string ErrorStack { get; set; }
        public int LoginID { get; set; }
        public string LoginName { get; set; }
        public string IPAddress { get; set; }
    }
}
