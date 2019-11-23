using System.Collections.Generic;
using System.IO;
using System.Net.Http.Headers;
using System.Text;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Ace.Controllers
{
    [Route("api/services/app/[controller]/[action]")]
    public class FileController : AceControllerBase
    {
        private readonly IHostingEnvironment _env;

        public FileController(IHostingEnvironment env)
        {
            _env = env;
        }

        [HttpPost]
        public string UploadFiles(List<IFormFile> files)
        {
            long size = 0;
            StringBuilder stringBuilder = new StringBuilder();
            foreach (var file in files)
            {
                //var fileName = file.FileName;
                var fileName = ContentDispositionHeaderValue
                                .Parse(file.ContentDisposition)
                                .Name
                                .Trim('"');
                var fileDir = Path.Combine(_env.WebRootPath, "UploadFiles");
                if (!Directory.Exists(fileDir))
                {
                    Directory.CreateDirectory(fileDir);
                }
                string filePath = fileDir + $@"\{fileName}";
                size += file.Length;
                using (FileStream fs = System.IO.File.Create(filePath))
                {
                    file.CopyTo(fs);
                    fs.Flush();
                }
                stringBuilder.AppendLine($"文件\"{fileName}\" /{size}字节上传成功 <br/>");
            }
            stringBuilder.AppendLine($"共{files.Count}个文件 /{size}字节上传成功! <br/>");
            return stringBuilder.ToString();
        }
    }
}
