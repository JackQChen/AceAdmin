using Ace.Core.Page;
using Ace.Dto;
using System.Threading.Tasks;

namespace Ace.Service.Log
{
    public interface ILogService
    {
        Task<PageResult<RequestLogDto>> GetRequestLogPageListAsync(int pageIndex, int pageSze, string ControllerName = null, string ActionName = null);
        ServiceReturnDto WriteRequestLog(RequestLogDto requestLog);
        ServiceReturnDto WriteExceptionLog(ExceptionLogDto log);
        Task<PageResult<ExceptionLogDto>> GetExceptionLogPageListAsync(int pageIndex, int pageSze, string ControllerName = null, string ActionName = null);
    }
}