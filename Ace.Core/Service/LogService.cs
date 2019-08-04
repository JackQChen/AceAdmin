using System;
using NLog;

namespace Ace.Core.Service
{
    public class LogService
    {
        private static readonly Logger _logger;

        static LogService()
        {
            _logger = LogManager.LoadConfiguration(AppDomain.CurrentDomain.BaseDirectory + "NLog.config").GetCurrentClassLogger();
        }
        public static void DataAccess(string log)
        {
            _logger.Debug(log);
        }

        public static void Info(string log)
        {
            _logger.Info(log);
        }
        public static void Debug(string log)
        {
            _logger.Debug(log);
        }
        public static void Warn(string log)
        {
            _logger.Warn(log);
        }
        public static void Error(string log)
        {
            _logger.Error(log);
        }
        public static void Fatal(string log)
        {
            _logger.Fatal(log);
        }
    }
}
