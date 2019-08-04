using System;
using System.DrawingCore;
using System.DrawingCore.Imaging;
using System.IO;

namespace Ace.Utility
{
    public sealed class ValidateCodeHelper
    {
        private ValidateCodeHelper() { }
        private static string validateNum = null;

        public string ValidateNum { get; private set; }
        public byte[] ImgStream { get; private set; }

        #region 1  获取颜色数组 -Color[] GetColorArr()
        /// <summary>
        /// 获取颜色数组
        /// </summary>
        /// <returns> Color[]</returns>
        private static Color[] GetColorArr()
        {
            Color[] color ={ Color.Black,Color.Red,Color.Blue,Color.Tomato, Color.OrangeRed, Color.Olive, Color.Gold, Color.GreenYellow,
                             Color.Blue, Color.LawnGreen, Color.Lime, Color.MediumSpringGreen, Color.Aqua, Color.RoyalBlue, Color.MediumBlue,Color.BlueViolet, Color.MediumOrchid, Color.Fuchsia, Color.DeepPink, Color.HotPink };
            return color;
        }
        #endregion

        #region 2.获取字体数组-string[] GetFontArr()
        /// <summary>
        /// 获取字体数组
        /// </summary>
        /// <returns>string[]</returns>
        private static string[] GetFontArr()
        {
            //string[] font = { "Times New Roman", "MS Mincho", "Book Antiqua", "Gungsuh", "PMingLiU" };
            //树莓派可用字体
            string[] font = { "FreeSans", "FreeMono", "FreeSerif" };
            return font;
        }
        #endregion

        #region 3.获取验证码的字符集-char[] GetCharacterArr()
        /// <summary>
        /// 获取验证码的字符集
        /// </summary>
        /// <returns></returns>
        private static char[] GetCharacterArr()
        {
            char[] character ={ '2', '3', '4', '5', '6', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
                                'H', 'J', 'K', 'L', 'M', 'N', 'P', 'R', 'S', 'T', 'W', 'X', 'Y' };
            return character;
        }
        #endregion

        #region 4. 获取验证码字符串  根据需要的验证码的长度-string GetCheckCodeStr(int length)
        /// <summary>
        /// 获取验证码字符串  根据需要的验证码的长度
        /// </summary>
        /// <param name="length">验证码的长度</param>
        /// <returns>string</returns>
        private static string GetCheckCodeStr(int length)
        {
            Random rd = new Random();
            string checkCode = string.Empty;
            char[] character = GetCharacterArr();
            for (int i = 0; i < length; i++)
            {
                checkCode += character[rd.Next(character.Length)].ToString();
            }
            validateNum = checkCode.ToLower();//把验证码字符串保存到validateNum中
            return checkCode;
        }
        #endregion

        #region 5.返回对象 -ValidateCode GetValidateCode()
        public static ValidateCodeHelper GetValidateCode()
        {
            using (Bitmap bmp = new Bitmap(100, 45))//创建一个位图
            {
                Graphics g = Graphics.FromImage(bmp);//创建一幅图像
                g.Clear(Color.White);//背景色设置为白色

                Random rnd = new Random();

                #region 画噪线
                for (int i = 0; i < 7; i++)
                {
                    int x1 = rnd.Next(100);
                    int y1 = rnd.Next(40);
                    int x2 = rnd.Next(100);
                    int y2 = rnd.Next(40);
                    Color clr = GetColorArr()[rnd.Next(GetColorArr().Length)];
                    g.DrawLine(new Pen(clr), x1, y1, x2, y2);
                }
                #endregion

                #region 画验证码字符串
                string checkCode = GetCheckCodeStr(4); //在这里修改验证码的长度（如果更改了验证码的长度，一定要改画布的长度）
                for (int i = 0; i < checkCode.Length; i++)
                {
                    string fnt = GetFontArr()[rnd.Next(GetFontArr().Length)];
                    Font ft = new Font(fnt, 26);
                    //Color clr = GetColorArr()[rnd.Next(GetColorArr().Length)];
                    Color clr = GetColorArr()[rnd.Next(4)];
                    g.DrawString(checkCode[i].ToString(), ft, new SolidBrush(clr), (float)i * 20 + 8, (float)8);
                }
                #endregion

                #region 画噪点
                for (int i = 0; i < 100; i++)
                {
                    int x = rnd.Next(bmp.Width);
                    int y = rnd.Next(bmp.Height);
                    Color clr = GetColorArr()[rnd.Next(GetColorArr().Length)];
                    bmp.SetPixel(x, y, clr);
                }
                #endregion

                #region 画边框
                //Color col = GetColorArr()[rnd.Next(GetColorArr().Length)];
                //g.DrawLine(new Pen(GetColorArr()[rnd.Next(GetColorArr().Length)]), 0, 0, bmp.Width - 1, 0);
                //g.DrawLine(new Pen(GetColorArr()[rnd.Next(GetColorArr().Length)]), 0, 0, 0, bmp.Height - 1);
                //g.DrawLine(new Pen(GetColorArr()[rnd.Next(GetColorArr().Length)]), bmp.Width - 1, 0, bmp.Width - 1, bmp.Height - 1);
                //g.DrawLine(new Pen(GetColorArr()[rnd.Next(GetColorArr().Length)]), 0, bmp.Height - 1, bmp.Width - 1, bmp.Height - 1);
                #endregion

                #region 将验证码图片写入内存流，并将其以 "image/Png" 格式输出
                MemoryStream ms = new MemoryStream();
                try
                {
                    bmp.Save(ms, ImageFormat.Png);
                    return new ValidateCodeHelper() { ImgStream = ms.ToArray(), ValidateNum = validateNum };
                }
                catch (Exception e)
                {
                    throw new Exception(e.Message);
                }
                finally
                {
                    //显式释放资源 
                    bmp.Dispose();
                    g.Dispose();
                }
                #endregion
            }
        }
        #endregion

        #region 6.返回验证码条 +string GetValidateBar(string url)
        public static string GetValidateBar(string url)
        {
            return "<img id='checkCode' title='看不清，换一张！' src='" + url + "' style='cursor:pointer' alt=''   onclick=\"document.getElementById('checkCode').src='" + url + "?id='+ new Date().getTime();\" />";
        }
        #endregion
    }
}
