using System;

namespace Ace.Framework.Model
{
    [Serializable]
    public class ErrorLogModel
    {
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public string Url { get; set; }
        public string Parameter { get; set; }
        public string IpAddress { get; set; }
        public string HttpType { get; set; }
        public DateTime CreateTime { get; set; }
        public string SystemName { get; set; }
        public int UserID { get; set; }
        public string LoginName { get; set; }
        public string ErrorMessage { get; set; }

        public string SecretKey { get; set; }
    }
}
