using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Ace.Framework.Validation
{
    public class IsEmail : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            if (value == null)
            {
                return false;
            }
            var str = value as string;
            return str.IsEmail();
        }
    }
}
