using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace Ace.Entity
{
    public partial class EnumDictionary
    {
        public enum Sex
        {
            [Description("男")]
            man = 1,
            [Description("女")]
            woman = 2
        }
    }
}
