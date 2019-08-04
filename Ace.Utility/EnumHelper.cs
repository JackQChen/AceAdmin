using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Reflection;

namespace Ace.Utility
{
    /*
     调用示例：
      var l0= EnumHelper.GetName<EnumDictionary.Sex>(1);
            var l1= EnumHelper.GetNameAndValue<EnumDictionary.Sex>();
            var l2 = EnumHelper.GetDescriptionAndValue<EnumDictionary.Sex>();
            var l3 = EnumHelper.GetDescription<EnumDictionary.Sex>(2);
         
         */
    public static class EnumHelper
    {
        /// <summary>
        /// 根据枚举的值获取枚举名称
        /// </summary>
        /// <typeparam name="T">枚举类型</typeparam>
        /// <param name="status">枚举的值</param>
        /// <returns></returns>
        public static string GetName<T>(int status)
        {
            return Enum.GetName(typeof(T), status);
        }
        /// <summary>
        /// 将枚举转换成字典
        /// </summary>
        /// <typeparam name="TEnum"></typeparam>
        /// <returns></returns>
        public static Dictionary<string, int> GetNameAndValue<TEnum>()
        {
            Dictionary<string, int> dic = new Dictionary<string, int>();
            Type t = typeof(TEnum);
            var arr = Enum.GetValues(t);
            foreach (var item in arr)
            {
                dic.Add(item.ToString(), (int)item);
            }

            return dic;
        }

        /// <summary>
        /// 扩展方法，获得枚举的Description
        /// </summary>
        /// <param name="value">枚举值</param>
        /// <returns>枚举的Description</returns>
        public static string GetDescription<TEnum>(int value)
        {
            Dictionary<string, int> enumDic = new Dictionary<string, int>();
            Array enumValues = Enum.GetValues(typeof(TEnum));
            foreach (Enum enumValue in enumValues)
            {
                Int32 value1 = Convert.ToInt32(enumValue);
                Type type = enumValue.GetType();
                string name = Enum.GetName(type, enumValue);
                FieldInfo field = type.GetField(name);
                DescriptionAttribute attribute = Attribute.GetCustomAttribute(field, typeof(DescriptionAttribute)) as DescriptionAttribute;
                var desc = attribute.Description;
                if (value == value1)
                {
                    return desc;
                }
            }
            return "不存在";
        }
        /// <summary>
        /// 把枚举转换为键值对集合
        /// </summary>
        /// <param name="enumType">枚举类型</param>
        /// <param name="getText">获得值得文本</param>
        /// <returns>以枚举值为key，枚举文本为value的键值对集合</returns>
        public static Dictionary<string, int> GetDescriptionAndValue<TEnum>()
        {

            Dictionary<string, int> enumDic = new Dictionary<string, int>();
            Array enumValues = Enum.GetValues(typeof(TEnum));
            foreach (Enum enumValue in enumValues)
            {
                Int32 value = Convert.ToInt32(enumValue);
                Type type = enumValue.GetType();
                string name = Enum.GetName(type, enumValue);
                FieldInfo field = type.GetField(name);
                DescriptionAttribute attribute = Attribute.GetCustomAttribute(field, typeof(DescriptionAttribute)) as DescriptionAttribute;
                var desc = attribute.Description;
                enumDic.Add(desc, value);
            }
            return enumDic;
        }


    }
}
