using System;
using System.Collections.Generic;
using System.Text;

namespace Ace.Dto
{
    public class RequestLogDto
    {
        public int RequestLogId { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public string Url { get; set; }
        public string Parameter { get; set; }
        public string IpAddress { get; set; }
        public int HttpStatusCode { get; set; }
        public string Method { get; set; }
        public string SystemName { get; set; }
        public int LoginId { get; set; }
        public string LoginName { get; set; }
        public DateTime OperateTime { get; set; }
    }
}
