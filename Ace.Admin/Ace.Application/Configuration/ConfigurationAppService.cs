using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using Abp.Auditing;
using Abp.Authorization;
using Abp.Runtime.Session;
using Ace.Configuration.Dto;

namespace Ace.Configuration
{
    [AbpAuthorize]
    public class ConfigurationAppService : AceAppServiceBase
    {

        public async Task ChangeUiTheme(ChangeUiThemeInput input)
        {
            await SettingManager.ChangeSettingForUserAsync(AbpSession.ToUserIdentifier(), AppSettingNames.UiTheme, input.Theme);
        }

        [DisableAuditing]
        public object GetSystemInfo()
        {
            //SystemInfo
            var systemInfo = new
            {
                StartTime = Process.GetCurrentProcess().StartTime.ToString("yyyy-MM-dd HH:mm:ss"),
                OSArchitecture = RuntimeInformation.OSArchitecture.ToString(),
                RuntimeInformation.FrameworkDescription,
                OSDescription = RuntimeInformation.OSDescription.Split('+')[0],
                Environment.ProcessorCount,
                Environment.MachineName
            };
            var realTimeInfo = new Dictionary<string, string>();
            //RealTimeInfo(Linux only)
            try
            {
                //temperature
                realTimeInfo.Add("Temperature", (Convert.ToDecimal(File.ReadAllText(@"/sys/class/thermal/thermal_zone0/temp")) / 1000).ToString());
                //memoryInfo
                var memoryInfo = File.ReadAllText(@"/proc/meminfo")
                        .Split('\n', StringSplitOptions.RemoveEmptyEntries)
                        .Select(s => new
                        {
                            Key = s.Split(':')[0],
                            Value = Convert.ToInt32(s.Split(':')[1].Trim().Split(' ')[0]) * 1024
                        })
                        .ToDictionary(k => k.Key, v => v.Value);
                var memUsed = memoryInfo["MemTotal"] - memoryInfo["MemFree"] - memoryInfo["Buffers"] - memoryInfo["Cached"];
                realTimeInfo.Add("MemUsed", FormatFileSize(memUsed));
                realTimeInfo.Add("MemTotal", FormatFileSize(memoryInfo["MemTotal"]));
                realTimeInfo.Add("MemUsage", decimal.Round(memUsed * 100m / memoryInfo["MemTotal"], 2).ToString());
                //diskUsage
                var df = ExecuteCommand("df /")
                    .Split('点')[1].Split(' ', StringSplitOptions.RemoveEmptyEntries)
                    .Skip(1).Take(3)
                    .Select(s => Convert.ToInt64(s) * 1024).ToArray();
                realTimeInfo.Add("DiskUsed", FormatFileSize(df[0] - df[2]));
                realTimeInfo.Add("DiskTotal", FormatFileSize(df[0]));
                realTimeInfo.Add("DiskUsage", decimal.Round((df[0] - df[2]) * 100m / df[0], 2).ToString());
            }
            catch
            {
            }
            return new
            {
                systemInfo,
                realTimeInfo
            };
        }

        private string FormatFileSize(long fileSize)
        {
            if (fileSize < 0)
                return "ErrorSize";
            else if (fileSize >= 1024 * 1024 * 1024)
                return string.Format("{0:########0.00}GB", fileSize / (1024m * 1024 * 1024));
            else if (fileSize >= 1024 * 1024)
                return string.Format("{0:####0.00}MB", fileSize / (1024m * 1024));
            else if (fileSize >= 1024)
                return string.Format("{0:####0.00}KB", fileSize / 1024m);
            else
                return string.Format("{0}Bytes", fileSize);
        }

        private string ExecuteCommand(string command)
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
    }
}
