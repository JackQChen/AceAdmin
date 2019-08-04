using System;
using System.Linq;
using Ace.Core.Cache;
using Ace.Framework.Filter;
using Ace.Framework.Model;
using Ace.Service.Account;
using Ace.Utility;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace Ace.Admin.Controllers
{
    public class AccountController : BaseController
    {
        private readonly IAccountService _accountService;
        private readonly ICacheManager _cacheManager;
        private readonly IConfiguration _configuration;

        public AccountController(IAccountService _accountService, IConfiguration _configuration, ICacheManager _cacheManager)
        {
            this._accountService = _accountService;
            this._configuration = _configuration;
            this._cacheManager = _cacheManager;
        }

        [NoLogAction]
        [PublicAction]
        public IActionResult GetValidateCode()
        {
            var vc = ValidateCodeHelper.GetValidateCode();
            HttpContext.Session.SetString("validateCode", vc.ValidateNum.ToLower());
            byte[] bs = vc.ImgStream;
            return File(bs, @"image/Png");
        }

        [HttpGet]
        [PublicAction]
        public IActionResult Login()
        {
            var cookieKey = _configuration.GetSection("ProjectSetting")["CookieKey"];
            string cookieValue = null;
            Request.Cookies.TryGetValue(cookieKey, out cookieValue);
            if (!string.IsNullOrEmpty(cookieValue))
            {
                string userCacheKey = GetCacheKey(cookieValue);
                var currentSysUser = _cacheManager.Get<CurrentSysUser>(userCacheKey);
                if (currentSysUser != null)
                {
                    return new RedirectResult("/Main");
                }
            }
            var currentIp = HttpContext.Connection.RemoteIpAddress.ToString();
            ViewBag.safeIP = _projectSetting.Value.SafeIPAddress.Split(",").Any(c => c == currentIp);
            ViewBag.title = _projectSetting.Value.SystemName;
            return View();
        }

        [HttpPost]
        [PublicAction]
        [NoParametersLogAction]
        public ActionResult Login(string name, string password, string validateCode = null)
        {
            //是否是安全IP地址
            var currentIp = HttpContext.Connection.RemoteIpAddress.ToString();
            bool isSafeIp = _projectSetting.Value.SafeIPAddress.Split(",").Any(c => c == currentIp);
            if (!isSafeIp)
            {
                if (string.IsNullOrEmpty(validateCode))
                {
                    return ErrorJsonResult("请输入验证码");
                }
                string code = HttpContext.Session.GetString("validateCode");
                if (code != validateCode.ToLower())
                {
                    return ErrorJsonResult("验证码错误");
                }
                //更新验证码
                HttpContext.Session.SetString("validateCode", ValidateCodeHelper.GetValidateCode().ValidateNum.ToLower());
            }
            var sr = _accountService.Login(name, password);
            if (!sr.IsSucceed)
            {
                return ErrorJsonResult(sr.Message);
            }
            string cookieKey = _projectSetting.Value.CookieKey;
            //每一个登录用户生成不同的cookie
            string cookieValue = BitConverter.ToInt64(Guid.NewGuid().ToByteArray()).ToString();
            //写入cookie
            HttpContext.Response.Cookies.Append(cookieKey, cookieValue, new CookieOptions
            {
                Expires = DateTime.Now.AddMinutes(_projectSetting.Value.SessionTimeOut),
                HttpOnly = true
            });
            //当前登录用户
            var currentSysUser = new CurrentSysUser()
            {
                UserID = sr.Data.UserID,
                LoginName = sr.Data.LoginName,
                UserName = sr.Data.UserName
            };
            var menuList = _accountService.GetMenuList(currentSysUser.UserID).Data;
            currentSysUser.MenuList = menuList.Select(s => new CurrentSysUserMenu()
            {
                ID = s.MenuID,
                Name = s.MenuName,
                URL = s.URL,
                ParentID = s.ParentID,
                Icon = s.Icon,
                Sort = s.Sort
            }).ToList();
            //将用户权限以cookieValue为键写入cache
            string userCacheKey = GetCacheKey(cookieValue);
            //滑动方式添加缓存
            _cacheManager.Add(userCacheKey, currentSysUser, new TimeSpan(0, _projectSetting.Value.SessionTimeOut, 0), true);

            return SuccessJsonResult();
        }

        [HttpGet]
        [LoginAction]
        public IActionResult Logout()
        {
            var cookieKey = _projectSetting.Value.CookieKey;
            string cookieValue = null;
            Request.Cookies.TryGetValue(cookieKey, out cookieValue);
            //清除用户缓存信息
            string userCacheKey = GetCacheKey(cookieValue);
            _cacheManager.Remove(userCacheKey);
            //清除cookie
            HttpContext.Response.Cookies.Append(cookieKey, cookieValue, new CookieOptions
            {
                Expires = DateTime.Now.AddMinutes(-30),
                HttpOnly = true
            });
            return RedirectToAction("Login");
        }

        [HttpGet]
        [LoginAction]
        public IActionResult ModifyPassword()
        {
            return View();
        }

        //[HttpPost]
        //[LoginAction]
        //[AutoValidateAntiforgeryToken]
        //public async Task<IActionResult> ModifyPassword(string oldPwd, string newPwd, string newPwd1)
        //{
        //    ModifyPasswordDto model = new ModifyPasswordDto()
        //    {
        //        LoginId = CurrentSysUser.LoginID,
        //        OldPwd = oldPwd,
        //        NewPwd = newPwd,
        //        NewPwd1 = newPwd1
        //    };
        //    var result= await _accountService.ModifyPassword(model);
        //    if (result.IsSucceed)
        //    {
        //        return SuccessJsonResult();
        //    }
        //    return ErrorJsonResult(result.Message);

        //}
    }
}