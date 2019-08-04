using System.Collections.Generic;
using System.Data.Common;
using Dapper;


namespace Ace.Core.Dapper
{
    public class DapperReader
    {
        public static List<T> SqlQuery<T>(DbConnection conn, string sql, object param = null) where T : class
        {
            var list = conn.Query<T>(sql, param);
            return list.AsList();
        }
    }
}
