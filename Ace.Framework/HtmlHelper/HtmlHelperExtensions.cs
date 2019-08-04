using System;
using System.Text;
using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Microsoft.AspNetCore.Mvc.ViewFeatures
{
    public static class HtmlHelperExtensions
    {
        public static HtmlString GetDateTimeFormat(this IHtmlHelper helper, object dt, params string[] format)
        {
            if (dt == null)
            {
                return new HtmlString("数据无效");
            }
            string f = "yyyy-MM-dd HH:mm";
            if (format != null && format.Length > 0)
            {
                f = format[0];
            }

            return new HtmlString(Convert.ToDateTime(dt).ToString(f));
        }
        public static IHtmlContent GetBoolSwitch(this IHtmlHelper helper, string TagName, bool isChecked, bool isSetIdName = false)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("<label>");

            sb.Append(string.Format("<input name = '{0}' value='true' class='ace ace-switch ace-switch-5' type='checkbox' {1} />", TagName, (isChecked ? "checked='checked'" : "")));

            sb.Append("<span class='lbl'></span>");
            sb.Append("</label>");
            return new HtmlString(sb.ToString());
        }

        public static IHtmlContent GetSelectTag(this IHtmlHelper helper, string TagName, bool isChecked, bool isSetIdName = false)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("<label>");

            sb.Append(string.Format("<input name = '{0}' value='true' class='ace ace-switch ace-switch-5' type='checkbox' {1} />", TagName, (isChecked ? "checked='checked'" : "")));

            sb.Append("<span class='lbl'></span>");
            sb.Append("</label>");
            return new HtmlString(sb.ToString());
        }
        public static IHtmlContent GetInputWithLabel(this IHtmlHelper html, string name, string placeholder = "", string value = "", string classs = "form-control", string labelName = "", string labelClass = "",int marginRight=4)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<div class='inline-block' style='margin-right:"+marginRight+"px;'>");
            sb.AppendFormat("<label for={0} class='{2}'>{1}&nbsp;&nbsp;</label>", name, labelName, labelClass);
            sb.AppendFormat("<input name='{0}' id='{0}'  placeholder='{1}' value='{2}' class='{3}' type='text'>", name, placeholder, value, classs);
            sb.Append("</div>");
            return new HtmlString(sb.ToString());
        }
    }
}