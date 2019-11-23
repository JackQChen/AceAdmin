using System;
using Microsoft.Extensions.Logging;

namespace Ace.EntityFrameworkCore
{
    public class EFLoggerProvider : ILoggerProvider
    {
        public ILogger CreateLogger(string categoryName) => new EFLogger(categoryName);
        public void Dispose() { }
    }

    public class EFLogger : ILogger
    {
        private readonly string categoryName;

        public EFLogger(string categoryName) => this.categoryName = categoryName;

        public bool IsEnabled(LogLevel logLevel) => true;

        public void Log<TState>(LogLevel logLevel, EventId eventId, TState state, Exception exception, Func<TState, Exception, string> formatter)
        {
            if (categoryName == "Microsoft.EntityFrameworkCore.Database.Command"
                    && logLevel == LogLevel.Information)
            {
                var logContent = formatter(state, exception);
                //Log.Debug(logContent);
            }
        }

        public IDisposable BeginScope<TState>(TState state) => null;
    }
}
