using System;

namespace Ace.Core.Cache
{
    public static class CacheExtensions
    {
        public static T Get<T>(this ICacheManager cacheManager, string key, Func<T> acquire)
        {
            //过期15分钟
            return Get(cacheManager, key, 15, acquire);
        }

        public static T Get<T>(this ICacheManager cacheManager, string key, int cacheTime, Func<T> acquire)
        {
            if (cacheManager.Exists(key))
            {
                return cacheManager.Get<T>(key);
            }
            else
            {
                var result = acquire();
                if (result != null)
                    cacheManager.Add(key, result, new TimeSpan(0, cacheTime, 0));
                return result;
            }
        }
    }
}
