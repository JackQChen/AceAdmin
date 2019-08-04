using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace Ace.Core.Data
{
    public class PropertyExpression<T> where T : BaseEntity
    {
        private PropertyExpression() { }
        private static List<string> propertyList = new List<string>();
        public static PropertyExpression<T> Init
        {
            get
            {
                propertyList.Clear();
                return new PropertyExpression<T>();
            }
        }

        public PropertyExpression<T> Property(Expression<Func<T, object>> exp)
        {
            var rtn = "";
            if (exp.Body is UnaryExpression)
            {
                rtn = ((MemberExpression)((UnaryExpression)exp.Body).Operand).Member.Name;
            }
            else if (exp.Body is MemberExpression)
            {
                rtn = ((MemberExpression)exp.Body).Member.Name;
            }
            else if (exp.Body is ParameterExpression)
            {
                rtn = ((ParameterExpression)exp.Body).Type.Name;
            }
            propertyList.Add(rtn);
            return this;
        }
        public List<string> ToList()
        {
            return propertyList;
        }

    }
}
