using System;

namespace Ace.Framework.Model
{
    public class InfoLogModel
    {
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public string Url { get; set; }
        public string Parameter { get; set; }
        public string IpAddress { get; set; }
        public int HttpStatusCode { get; set; }
        public string Method { get; set; }
        public string SystemName { get; set; }
        public int UserID { get; set; }
        public string LoginName { get; set; }
        public DateTime OperateTime { get; set; }
    }
}
