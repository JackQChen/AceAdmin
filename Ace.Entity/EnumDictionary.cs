using System.ComponentModel;

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
