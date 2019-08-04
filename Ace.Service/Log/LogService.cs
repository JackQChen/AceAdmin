using System;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Ace.Core.Page;
using Ace.Dto;
using Ace.Entity;
using Ace.UnitOfWork;

namespace Ace.Service.Log
{
    public class LogService : ILogService
    {
        private readonly IUnitOfWork _unitOfWork;
        public LogService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public ServiceReturnDto WriteInfoLog(InfoLogDto log)
        {
            Sys_Info_Log entity = new Sys_Info_Log()
            {
                ActionName = log.ActionName,
                ControllerName = log.ControllerName,
                HttpStatusCode = log.HttpStatusCode,
                HttpType = log.Method,
                IPAddress = log.IPAddress,
                UserID = log.UserID,
                LoginName = log.LoginName,
                Parameters = log.Parameter,
                URL = log.Url,
                SystemName = log.SystemName,
                OperateTime = log.OperateTime
            };
            _unitOfWork.SysInfoLogRep.Insert(entity);
            return null;
        }
        public ServiceReturnDto WriteErrorLog(ErrorLogDto log)
        {
            Sys_Error_Log entity = new Sys_Error_Log()
            {
                ActionName = log.ActionName,
                ControllerName = log.ControllerName,
                HttpType = log.HttpType,
                IPAddress = log.IpAddress,
                UserID = log.UserID,
                LoginName = log.LoginName,
                Parameters = log.Parameter,
                URL = log.Url,
                SystemName = log.SystemName,
                Message = log.ErrorMessage
            };
            _unitOfWork.SysErrorLogRep.Insert(entity);
            return null;
        }

        public async Task<PageResult<InfoLogDto>> GetInfoLogPageListAsync(PageOption pageOption, string controllerName = null, string actionName = null)
        {
            Expression<Func<Sys_Info_Log, bool>> exp = p => true;
            if (!string.IsNullOrEmpty(controllerName))
            {
                exp = exp.And(c => c.ControllerName == controllerName);
            }
            if (!string.IsNullOrEmpty(actionName))
            {
                exp = exp.And(c => c.ActionName == actionName);
            }
            var query = await _unitOfWork.SysInfoLogRep.QueryAsync(exp);
            var dtoQuery = query.Select(c => new InfoLogDto()
            {
                ID = c.ID,
                ActionName = c.ActionName,
                ControllerName = c.ControllerName,
                HttpStatusCode = c.HttpStatusCode,
                IPAddress = c.IPAddress.Replace("::1", "localhost").Replace("::ffff:", ""),
                UserID = c.UserID,
                LoginName = c.LoginName,
                Method = c.HttpType,
                Parameter = c.Parameters,
                SystemName = c.SystemName,
                Url = c.URL,
                OperateTime = c.OperateTime
            });
            var pageList = new PageResult<InfoLogDto>(dtoQuery, pageOption);
            return pageList;
        }
        public async Task<PageResult<ErrorLogDto>> GetErrorLogPageListAsync(PageOption pageOption, string controllerName = null, string actionName = null)
        {
            Expression<Func<Sys_Error_Log, bool>> exp = p => true;
            if (!string.IsNullOrEmpty(controllerName))
            {
                exp = exp.And(c => c.ControllerName == controllerName);
            }
            if (!string.IsNullOrEmpty(actionName))
            {
                exp = exp.And(c => c.ActionName == actionName);
            }
            var query = await _unitOfWork.SysErrorLogRep.QueryAsync(exp);
            var dtoQuery = query.Select(c => new ErrorLogDto()
            {
                ID = c.ID,
                ActionName = c.ActionName,
                ControllerName = c.ControllerName,
                IpAddress = c.IPAddress,
                UserID = c.UserID,
                LoginName = c.LoginName,
                HttpType = c.HttpType,
                Parameter = c.Parameters,
                SystemName = c.SystemName,
                Url = c.URL,
                ErrorMessage = c.ErrorSource,
                Message = c.Message
            });
            var pageList = new PageResult<ErrorLogDto>(dtoQuery, pageOption);

            return pageList;
        }
    }
}