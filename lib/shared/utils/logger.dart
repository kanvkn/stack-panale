import 'package:flutter/foundation.dart';

class AppLogger {
  static void log(String message, {String? tag}) {
    if (kDebugMode) {
      print('[${tag ?? 'APP'}] $message');
    }
  }

  static void error(String message, {Object? error, StackTrace? stackTrace, String? tag}) {
    if (kDebugMode) {
      print('[${tag ?? 'ERROR'}] $message');
      if (error != null) print('Error: $error');
      if (stackTrace != null) print('StackTrace: $stackTrace');
    }
  }

  static void info(String message, {String? tag}) {
    log(message, tag: tag ?? 'INFO');
  }

  static void warning(String message, {String? tag}) {
    log(message, tag: tag ?? 'WARNING');
  }

  static void debug(String message, {String? tag}) {
    if (kDebugMode) {
      log(message, tag: tag ?? 'DEBUG');
    }
  }
}
