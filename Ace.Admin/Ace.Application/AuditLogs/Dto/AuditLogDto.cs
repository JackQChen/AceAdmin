using System;
using Abp.Auditing;
using Abp.AutoMapper;

namespace Ace.AuditLogs.Dto
{
    [AutoMapFrom(typeof(AuditLog))]
    public class AuditLogDto
    {
        public long Id { get; set; }
        //
        // 摘要:
        //     Start time of the method execution.
        public DateTime ExecutionTime { get; set; }
        //
        // 摘要:
        //     Abp.Auditing.AuditInfo.ImpersonatorUserId.
        public long? ImpersonatorUserId { get; set; }
        //
        // 摘要:
        //     Exception object, if an exception occured during execution of the method.
        public string Exception { get; set; }
        //
        // 摘要:
        //     Browser information if this method is called in a web request.
        public string BrowserInfo { get; set; }
        //
        // 摘要:
        //     Name (generally computer name) of the client.
        public string ClientName { get; set; }
        //
        // 摘要:
        //     IP address of the client.
        public string ClientIpAddress { get; set; }
        //
        // 摘要:
        //     Total duration of the method call as milliseconds.
        public int ExecutionDuration { get; set; }
        //
        // 摘要:
        //     Return values.
        public string ReturnValue { get; set; }
        //
        // 摘要:
        //     TenantId.
        public int? TenantId { get; set; }
        //
        // 摘要:
        //     Executed method name.
        public string MethodName { get; set; }
        //
        // 摘要:
        //     Service (class/interface) name.
        public string ServiceName { get; set; }
        //
        // 摘要:
        //     UserId.
        public long? UserId { get; set; }
        //
        // 摘要:
        //     Abp.Auditing.AuditInfo.ImpersonatorTenantId.
        public int? ImpersonatorTenantId { get; set; }
        //
        // 摘要:
        //     Calling parameters.
        public string Parameters { get; set; }
        //
        // 摘要:
        //     Abp.Auditing.AuditInfo.CustomData.
        public string CustomData { get; set; }
    }
}
