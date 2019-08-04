using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;

namespace Ace.Admin.Controllers
{
    public class FileController : Controller
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        public FileController(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }
        public async Task<IActionResult> KindEditorImgUpload()
        {
            Dictionary<string, string> extTable = new Dictionary<string, string>();
            extTable.Add("image", "gif,jpg,jpeg,png,bmp");
            extTable.Add("flash", "swf,flv");
            extTable.Add("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
            extTable.Add("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
            //最大文件大小
            int maxSize = 1000000;
            var context = Request.HttpContext;
            var imgFile = Request.Form.Files[0];

            //文件类型
            string dirName = Request.Query["dir"];
            if (string.IsNullOrEmpty(dirName))
            {
                dirName = "image";
            }
            if (!extTable.ContainsKey(dirName))
            {
                showError("目录名不正确。");
            }
            String fileName = imgFile.FileName;
            String fileExt = Path.GetExtension(fileName).ToLower();

            if (imgFile== null || imgFile.Length > maxSize)
            {
                showError("上传文件大小超过限制。");
            }
            if (String.IsNullOrEmpty(fileExt) || Array.IndexOf(((String)extTable[dirName]).Split(','), fileExt.Substring(1).ToLower()) == -1)
            {
                showError("上传文件扩展名是不允许的扩展名。\n只允许" + ((String)extTable[dirName]) + "格式。");
            }
            string saveDir = Request.Query["saveDir"];
            string saveDirStr = null;
            if (saveDir == null)
            {
                saveDirStr = "tmp";
            }
            else
            {
                saveDirStr = saveDir.ToString();
            }
            //文件保存目录
            string contentRootPath = _hostingEnvironment.ContentRootPath;
            string savePath = "/wwwroot/upload/kindeditor/" + dirName + "/" + saveDirStr;
            string dirPath =contentRootPath +savePath;
            if (!Directory.Exists(dirPath))
            {
                Directory.CreateDirectory(dirPath);
            }

            String newFileName = DateTime.Now.ToString("_yyyyMMddHHmmss_ffff", DateTimeFormatInfo.InvariantInfo) + fileExt;
            String filePath = dirPath + "/" + newFileName;
            using (FileStream fs = System.IO.File.Create(filePath))
            {
                await imgFile.CopyToAsync(fs);
                fs.Flush();
            }
            Dictionary<string, object> hash = new Dictionary<string, object>();

            hash["url"] = (savePath + "/" + newFileName).Replace("/wwwroot", "");
            hash["error"] = 0;
            Response.Headers.Add("Content-Type", "text/html; charset=UTF-8");
            return Json(hash);
        }
        private  IActionResult showError(string message)
        {
            Dictionary<string, object> hash = new Dictionary<string, object>();

            hash["error"] = 1;
            hash["message"] = message;
            Response.Headers.Add("Content-Type", "text/html; charset=UTF-8");
           return  Json(hash);
        }


        [RequestSizeLimit(100_000_000)] //最大100m左右，默认30M
        //[DisableRequestSizeLimit]  //或者取消大小的限制
        public async Task<IActionResult> Upload()
        {
            var file = Request.Form.Files[0];
            if (file == null)
            {
                return Json(new { code = 500, msg = "文件不存在" });
            }
            string webRootPath = _hostingEnvironment.WebRootPath;
            string contentRootPath = _hostingEnvironment.ContentRootPath;
            string saveDir = Request.Form["saveDir"];
            saveDir = "/wwwroot/upload/" + saveDir + "/";
            //string dir = contentRootPath+"/upload/" + saveDir + "/";
            var fileNameWithoutExt = Path.GetFileNameWithoutExtension(file.FileName);
            if (fileNameWithoutExt.Contains("."))
            {
                return Json(new { code = 500, msg = "文件名称中不能包含." });
            }
            var suffix = Path.GetExtension(file.FileName);
            string fileName = fileNameWithoutExt + DateTime.Now.ToString("_yyyyMMddHHmmss") + suffix;

            if (!Directory.Exists(contentRootPath + saveDir))
            {
                Directory.CreateDirectory(contentRootPath + saveDir);
            }
            string path = Path.Combine(contentRootPath + saveDir, fileName);
            using (FileStream fs = System.IO.File.Create(path))
            {
                await file.CopyToAsync(fs);
                fs.Flush();
            }
            return Json(new { code = 200, path = Path.Combine(saveDir.Replace("/wwwroot", ""), fileName), name = fileNameWithoutExt, suffix = suffix });
        }
    }
}