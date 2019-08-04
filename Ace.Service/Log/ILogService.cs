using System.Threading.Tasks;
using Ace.Core.Page;
using Ace.Dto;

namespace Ace.Service.Log
{
    public interface ILogService
    {
        ServiceReturnDto WriteInfoLog(InfoLogDto log);
        ServiceReturnDto WriteErrorLog(ErrorLogDto log);
        Task<PageResult<InfoLogDto>> GetInfoLogPageListAsync(PageOption pageOption, string controllerName = null, string actionName = null);
        Task<PageResult<ErrorLogDto>> GetErrorLogPageListAsync(PageOption pageOption, string controllerName = null, string actionName = null);
    }
}