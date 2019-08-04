using System;
using System.Diagnostics;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using Ace.Framework.Filter;
using Microsoft.AspNetCore.Mvc;

namespace Ace.Admin.Controllers
{
    public class HomeController : Controller
    {
        [LoginAction]
        [NoLogAction]
        public IActionResult Index()
        {
            //SystemInfo
            ViewBag.time = Process.GetCurrentProcess().StartTime.ToString("yyyy-MM-dd HH:mm:ss.fff");
            ViewBag.os = RuntimeInformation.OSArchitecture;
            ViewBag.version = Environment.OSVersion;
            ViewBag.description = RuntimeInformation.OSDescription;
            ViewBag.count = Environment.ProcessorCount;
            ViewBag.host = Environment.MachineName;
            //RealTimeInfo(Linux only)
            try
            {
                ViewBag.temp = ExecCommand("vcgencmd measure_temp").Split('=')[1].Replace("'C", "");
                ViewBag.cpu = Regex.Match(ExecCommand("top -bn 1 -i -c"), "%Cpu.+?us").Value.Split(' ')[1];
                var free = ExecCommand("free").Split(':')[1].Split(' ', StringSplitOptions.RemoveEmptyEntries);
                ViewBag.ram1 = FormatFileSize(Convert.ToInt64(free[0]) * 1024);
                ViewBag.ram2 = FormatFileSize(Convert.ToInt64(free[1]) * 1024);
                ViewBag.ram3 = FormatFileSize(Convert.ToInt64(free[2]) * 1024);
                ViewBag.ram4 = Convert.ToInt64(free[1]) * 100 / Convert.ToInt64(free[0]);
                var df = ExecCommand("df -h /").Split('点')[1].Split(' ', StringSplitOptions.RemoveEmptyEntries);
                ViewBag.disk1 = df[1];
                ViewBag.disk2 = df[2];
                ViewBag.disk3 = df[3];
                ViewBag.disk4 = df[4].Replace("%", "");
            }
            catch
            {
            }
            return View();
        }
        string ExecCommand(string command)
        {
            var strResult = "";
            var strList = command.Split(' ');
            var psi = new ProcessStartInfo(strList[0], string.Join(' ', strList.Skip(1))) { RedirectStandardOutput = true };
            var proc = Process.Start(psi);
            using (var sr = proc.StandardOutput)
            {
                while (!sr.EndOfStream)
                    strResult += sr.ReadLine();
                if (!proc.HasExited)
                    proc.Kill();
            }
            return strResult;
        }
        string FormatFileSize(long fileSize)
        {
            if (fileSize < 0)
                return "ErrorSize";
            else if (fileSize >= 1024 * 1024 * 1024)
                return string.Format("{0:########0.00} GB", fileSize / (1024 * 1024 * 1024));
            else if (fileSize >= 1024 * 1024)
                return string.Format("{0:####0.00} MB", fileSize / (1024 * 1024));
            else if (fileSize >= 1024)
                return string.Format("{0:####0.00} KB", fileSize / 1024);
            else
                return string.Format("{0} Bytes", fileSize);
        }
    }
}
