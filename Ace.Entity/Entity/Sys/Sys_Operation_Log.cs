using Ace.Core.Data;
using System;
using System.ComponentModel.DataAnnotations;

namespace Ace.Entity
{
    [Serializable]
    //操作日志表
    public class Sys_Operation_Log : BaseEntity<int>
    {
        [Display(Name = "无效字段")]
        [MaxLength(512, ErrorMessage = "{0}最大长度{1}")]
        public string SystemName { get; set; }

        [Display(Name = "URL")]
        public string URL { get; set; }

        [Display(Name = "参数")]
        public string Parameters { get; set; }

        /// <summary>
        /// 控制器名称
        /// </summary>
        [Display(Name = "控制器名称")]
        [Required]
        [MaxLength(64, ErrorMessage = "{0}最长{1}位")]
        public string ControllerName { get; set; }

        /// <summary>
        /// 动作名称
        /// </summary>
        [Display(Name = "动作名称")]
        [Required]
        [MaxLength(128, ErrorMessage = "{0}最长{1}位")]
        public string ActionName { get; set; }

        [Display(Name = "请求方式")]
        [MaxLength(4, ErrorMessage = "{0}最长{1}位")]
        public string HttpType { get; set; }

        [Display(Name = "返回状态码")]
        public int HttpStatusCode { get; set; }

        [Display(Name = "操作人ID")]
        public int LoginID { get; set; }

        [Display(Name = "登录名")]
        [MaxLength(16, ErrorMessage = "{0}最大长度{1}")]
        public string LoginName { get; set; }

        [Display(Name = "操作人IP地址")]
        [MaxLength(16, ErrorMessage = "{0}最大长度{1}")]
        public string IPAddress { get; set; }

        [Display(Name = "操作时间")]
        public DateTime OperateTime { get; set; }

    }
}
