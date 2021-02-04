using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace Common
{
    public class Md5Helper
    {

        public static string GetMd5(string text)
        {
            //创建md5对象
            MD5 md5 = MD5.Create();
            //将字符串转成字节数组
            byte[] bs = Encoding.UTF8.GetBytes(text);
            //加密
            byte[] bs2 = md5.ComputeHash(bs);
            //将字节数组转换成字符串
            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i < bs2.Length; i++)
            {
                //0-255=>00-ff
                stringBuilder.Append(bs2[i].ToString("x2").ToLower());
            }
            return stringBuilder.ToString();
        }
    }
}
