using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace Ace.Utility
{
    public class HttpHelper
    {
        public static T Post<T>(string url, T postData, string contentType = "application/x-www-form-urlencoded") where T : class, new()
        {
            if (url.StartsWith("https"))
                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls;


            using (HttpClient httpClient = new HttpClient())
            {
                string data = string.Empty;
                if (contentType == "application/x-www-form-urlencoded")
                {
                    var type = typeof(T);
                    PropertyInfo[] propertys = type.GetProperties();
                    List<string> list = new List<string>();
                    foreach (var item in propertys)
                    {
                        var v = type.GetProperty(item.Name).GetValue(postData, null) ?? "";
                        list.Add(item.Name + "=" + v);
                    }
                    data = string.Join("&", list);
                }
                else if (contentType == "application/json")
                {
                    //如果是这种类型的话，action接收数据时要指定[formbody]

                    var format = new IsoDateTimeConverter();
                    format.DateTimeFormat = "yyyyMMddHHmmssSSS";
                    data = JsonConvert.SerializeObject(postData, Newtonsoft.Json.Formatting.Indented, format);
                }
                else
                {
                    throw new Exception("content-Type类型错误");
                }

                var content = new StringContent(data, Encoding.UTF8, contentType);
                HttpResponseMessage response = httpClient.PostAsync(url, content).Result;
                if (response.IsSuccessStatusCode)
                {
                    Task<string> t = response.Content.ReadAsStringAsync();
                    string s = t.Result;
                    T ss = JsonConvert.DeserializeObject<T>(s);
                    return ss;
                }
                else
                {
                    throw new Exception("请求失败:" + url);
                }
            }
        }
        public static T Get<T>(string url) where T : class, new()
        {
            if (url.StartsWith("https"))
                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls;
            HttpClient httpClient = new HttpClient();
            HttpResponseMessage response = httpClient.GetAsync(url).Result;
            if (response.IsSuccessStatusCode)
            {
                Task<string> t = response.Content.ReadAsStringAsync();
                string s = t.Result;
                T ss = JsonConvert.DeserializeObject<T>(s);
                return ss;
            }
            else
            {
                throw new Exception("请求失败:" + url);
            }

        }

    }
}
