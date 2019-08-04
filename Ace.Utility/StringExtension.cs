using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace System.Text
{
    public static class StringExtension
    {
        public static bool IsEmail(this string s)
        {
            if (string.IsNullOrEmpty(s))
            {
                return false;
            }
            string pattern = @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(s);
        }
        public static bool IsPhone(this string s)
        {
            if (string.IsNullOrEmpty(s))
            {
                return false;
            }
            Regex regex = new Regex("^1[3|5|6|7|8]\\d{9}$");
            return regex.IsMatch(s);
        }
        public static int ToInt(this string s)
        {
            if (string.IsNullOrEmpty(s))
            {
                throw new Exception("空字符串无法转成整数");
            }
            int ret = 0;

            if (int.TryParse(s, out ret) == false)
                throw new Exception("字符串转整数失败");

            return ret;
        }
        public static List<int> ToList(this string s,char split=',')
        {
            if (string.IsNullOrEmpty(s))
            {
                return new List<int>();
            }
             var arr=s.Split(new char[] { split }, StringSplitOptions.RemoveEmptyEntries).ToList();
            return arr.Select(c => Convert.ToInt32(c)).ToList();
        }
    }
}
