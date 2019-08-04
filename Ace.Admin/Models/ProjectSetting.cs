using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ace.Admin.Models
{
    public class ProjectSetting
    {
        public string SystemName { get; set; }
        public string SystemUrl { get; set; }
        public int SessionTimeOut { get; set; }
        public string CookieKey { get; set; }
        public string CacheKey { get; set; }
        public int PageSize { get; set; }
        public string SafeIPAddress { get; set; }

        public string ApiUrl { get; set; }
        public string SecretKey { get; set; }
    }
}
