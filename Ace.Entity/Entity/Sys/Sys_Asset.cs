using Ace.Core.Data;
using System;
using System.ComponentModel.DataAnnotations;

namespace Ace.Entity
{
    [Serializable]
    public class Sys_Asset : BaseEntity<int>
    {
        /// <summary>
        /// 文档内容
        /// </summary>
        public byte[] Content { get; set; }
    }
}