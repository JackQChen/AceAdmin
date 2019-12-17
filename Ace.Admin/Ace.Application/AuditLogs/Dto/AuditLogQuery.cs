using Ace.Common.Dto;

namespace Ace.AuditLogs.Dto
{
    public class AuditLogQuery : CommonRequestDto
    {
        //     IP address of the client.
        public string ClientIpAddress { get; set; }

        //     UserId.
        public long? UserId { get; set; }
    }
}
