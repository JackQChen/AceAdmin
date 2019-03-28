using System;
using System.Collections.Generic;
using System.Text;

namespace Ace.Dto
{
    public class ServiceReturnDto
    {
        public bool IsSucceed { get; set; }
        public string Message { get; set; }
    }
    public class ServiceReturnDto<T>: ServiceReturnDto where T:class
    {
        public T Data { get; set; }
    }
}
