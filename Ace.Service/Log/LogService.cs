using Ace.Core.Page;
using Ace.Dto;
using Ace.Entity;
using Ace.UnitOfWork;
using System;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Ace.Service.Log
{
    public class LogService : ILogService
    {
        //private readonly IRepository<Sys_Operation_Log> _operationLogRepository;
        //private readonly IRepository<Sys_Error_Log> _errorLogRepository;
        //public LogService(IRepository<Sys_Operation_Log> _operationLogRepository, IRepository<Sys_Error_Log> _errorLogRepository)
        //{
        //    this._operationLogRepository = _operationLogRepository;
        //    this._errorLogRepository = _errorLogRepository;
        //}
        private readonly IUnitOfWork _unitOfWork;
        public LogService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public ServiceReturnDto WriteRequestLog(RequestLogDto requestLog)
        {
            Sys_Operation_Log entity = new Sys_Operation_Log()
            {
                ActionName = requestLog.ActionName,
                ControllerName = requestLog.ControllerName,
                HttpStatusCode = requestLog.HttpStatusCode,
                HttpType = requestLog.Method,
                IPAddress = requestLog.IpAddress,
                LoginID = requestLog.LoginId,
                LoginName = requestLog.LoginName,
                Parameters = requestLog.Parameter,
                URL = requestLog.Url,
                SystemName = requestLog.SystemName,
                OperateTime = requestLog.OperateTime
            };
            _unitOfWork.SysOperationLogRep.Insert(entity);
            return null;
        }
        public ServiceReturnDto WriteExceptionLog(ExceptionLogDto log)
        {
            Sys_Error_Log entity = new Sys_Error_Log()
            {
                ActionName = log.ActionName,
                ControllerName = log.ControllerName,
                HttpType = log.HttpType,
                IPAddress = log.IpAddress,
                LoginID = log.LoginId,
                LoginName = log.LoginName,
                Parameters = log.Parameter,
                URL = log.Url,
                SystemName = log.SystemName,
                Message = log.ErrorMessage
            };
            _unitOfWork.SysErrorLogRep.Insert(entity);

            return null;
        }

        public async Task<PageResult<RequestLogDto>> GetRequestLogPageListAsync(int pageIndex, int pageSize, string ControllerName = null, string ActionName = null)
        {
            Expression<Func<Sys_Operation_Log, bool>> exp = null;
            if (!string.IsNullOrEmpty(ControllerName))
            {
                exp = exp.And(c => c.ControllerName == ControllerName);
            }
            if (!string.IsNullOrEmpty(ActionName))
            {
                exp = exp.And(c => c.ActionName == ActionName);
            }
            var query = await _unitOfWork.SysOperationLogRep.LoadAsync(exp);
            query = query.OrderByDescending(c => c.ID);
            var dtoQuery = query.Select(c => new RequestLogDto()
            {
                RequestLogId = c.ID,
                ActionName = c.ActionName,
                ControllerName = c.ControllerName,
                HttpStatusCode = c.HttpStatusCode,
                IpAddress = c.IPAddress,
                LoginId = c.LoginID,
                LoginName = c.LoginName,
                Method = c.HttpType,
                Parameter = c.Parameters,
                SystemName = c.SystemName,
                Url = c.URL
            });
            var pageList = new PageResult<RequestLogDto>(dtoQuery, new PageOption(pageIndex, pageSize));

            return pageList;
        }
        public async Task<PageResult<ExceptionLogDto>> GetExceptionLogPageListAsync(int pageIndex, int pageSize, string ControllerName = null, string ActionName = null)
        {
            Expression<Func<Sys_Error_Log, bool>> exp = null;
            if (!string.IsNullOrEmpty(ControllerName))
            {
                exp = exp.And(c => c.ControllerName == ControllerName);
            }
            if (!string.IsNullOrEmpty(ActionName))
            {
                exp = exp.And(c => c.ActionName == ActionName);
            }
            var query = await _unitOfWork.SysErrorLogRep.LoadAsync(exp);
            query = query.OrderByDescending(c => c.ID);
            var dtoQuery = query.Select(c => new ExceptionLogDto()
            {
                ExceptionLogId = c.ID,
                ActionName = c.ActionName,
                ControllerName = c.ControllerName,
                IpAddress = c.IPAddress,
                LoginId = c.LoginID,
                LoginName = c.LoginName,
                HttpType = c.HttpType,
                Parameter = c.Parameters,
                SystemName = c.SystemName,
                Url = c.URL,
                ErrorMessage = c.ErrorSource,
                Message = c.Message
            });
            var pageList = new PageResult<ExceptionLogDto>(dtoQuery, new PageOption(pageIndex, pageSize));

            return pageList;
        }
    }
}