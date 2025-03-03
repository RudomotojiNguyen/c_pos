import 'package:logger/logger.dart';

class LoggerHelper {
  static final LoggerHelper _instance = LoggerHelper._internal();

  LoggerHelper._internal();

  factory LoggerHelper() {
    return _instance;
  }

  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    output: null, // Use the default LogOutput (-> send everything to console)
    printer: PrettyPrinter(
      // Use the PrettyPrinter to format and print log
      methodCount: 2,
      // Number of method calls to be displayed
      errorMethodCount: 8,
      // Number of method calls if stacktrace is provided
      lineLength: 120,
      // Width of the output
      colors: true,
      // Colorful log messages
      printEmojis: true,
      // Print an emoji for each log message
      // Should each log print contain a timestamp
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  void logTrace({String? message, dynamic obj}) {
    logger.i(message);
  }

  void logInfo({String? message, dynamic obj}) {
    logger.i(message);
  }

  void logDebug({String? message, dynamic obj}) {
    logger.d(message, error: obj);
  }

  void logError({String? message, dynamic obj}) {
    logger.e(message, error: obj);
  }

  void logWarning({String? message, dynamic obj}) {
    logger.w(message);
  }
}
