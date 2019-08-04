using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace Ace.Utility
{
    //加密 解密
    public class CryptHelper
    {

        //默认密钥向量
        private static byte[] DesVector = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF };

        /// <summary>
        /// DES加密字符串
        /// </summary>
        /// <param name="sSource">待加密的字符串</param>
        /// <param name="sSaltKey">加密密钥,要求为8位，默认值为：wangjunh</param>
        /// <returns>加密成功返回加密后的字符串，失败返空串</returns>
        public static string EncryptDES(string sSource, string sSaltKey = "wangjunh")
        {
            try
            {
                byte[] inputByteArray = Encoding.UTF8.GetBytes(sSource);
                DESCryptoServiceProvider descsp = new DESCryptoServiceProvider();
                descsp.Key = Encoding.UTF8.GetBytes(sSaltKey.Substring(0, 8));
                descsp.IV = DesVector;
                MemoryStream mStream = new MemoryStream();
                CryptoStream cStream = new CryptoStream(mStream, descsp.CreateEncryptor(), CryptoStreamMode.Write);
                cStream.Write(inputByteArray, 0, inputByteArray.Length);
                cStream.FlushFinalBlock();
                StringBuilder sResult = new StringBuilder();
                foreach (byte btHex in mStream.ToArray())
                    sResult.AppendFormat("{0:X2}", btHex);    // Format as hex
                return sResult.ToString();
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// DES解密字符串
        /// </summary>
        /// <param name="sSource">待解密的字符串</param>
        /// <param name="sSaltKey">解密密钥,要求为8位,和加密密钥相同，默认值为：wangjunh</param>
        /// <returns>解密成功返回解密后的字符串，失败返空串</returns>
        public static string DecryptDES(string sSource, string sSaltKey = "wangjunh")
        {
            try
            {
                byte[] inputByteArray = new byte[sSource.Length / 2];
                for (int x = 0; x < sSource.Length / 2; x++)
                {
                    int i = (Convert.ToInt32(sSource.Substring(x * 2, 2), 16));
                    inputByteArray[x] = (byte)i;
                }
                DESCryptoServiceProvider descsp = new DESCryptoServiceProvider();
                descsp.Key = Encoding.UTF8.GetBytes(sSaltKey.Trim());
                descsp.IV = DesVector;
                MemoryStream mStream = new MemoryStream();
                CryptoStream cStream = new CryptoStream(mStream, descsp.CreateDecryptor(), CryptoStreamMode.Write);
                cStream.Write(inputByteArray, 0, inputByteArray.Length);
                cStream.FlushFinalBlock();
                return Encoding.Default.GetString(mStream.ToArray());
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// MD5加密字符串，UTF-8格式
        /// </summary>
        /// <param name="sSource">原字符串</param>
        /// <returns>MD5加密后的字符串</returns>
        public static string EncryptMD5(string sSource)
        {
            try
            {
                byte[] inputByteArray = Encoding.UTF8.GetBytes(sSource);
                MD5CryptoServiceProvider md5csp = new MD5CryptoServiceProvider();
                byte[] resultData = md5csp.ComputeHash(inputByteArray);
                // Create a new Stringbuilder to collect the bytes and create a string.
                StringBuilder sBuilder = new StringBuilder();
                // Loop through each byte of the hashed data and format each one as a hexadecimal string.
                for (int i = 0; i < resultData.Length; i++)
                    sBuilder.Append(resultData[i].ToString("x2"));
                // Return the hexadecimal string.
                return sBuilder.ToString();
            }
            catch
            {
                return null;
            }
        }


    }
}
