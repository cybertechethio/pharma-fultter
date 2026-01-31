import 'package:logger/logger.dart';

/// Centralized logging service for the application
/// 
/// This service provides structured logging with different levels
/// and can be configured for different environments (debug, release)
class LoggingService {
  static Logger? _logger;
  
  /// Get the logger instance
  static Logger get instance {
    _logger ??= Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
    );
    return _logger!;
  }
  
  /// Debug level logging
  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.d(message, error: error, stackTrace: stackTrace);
  }
  
  /// Info level logging
  static void info(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.i(message, error: error, stackTrace: stackTrace);
  }
  
  /// Warning level logging
  static void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.w(message, error: error, stackTrace: stackTrace);
  }
  
  /// Error level logging
  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.e(message, error: error, stackTrace: stackTrace);
  }
  
  /// Fatal level logging
  static void fatal(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.f(message, error: error, stackTrace: stackTrace);
  }
  
  /// API request logging
  static void apiRequest(String method, String endpoint, [Map<String, dynamic>? data]) {
    instance.d('🌐 API REQUEST: $method $endpoint', error: data);
  }
  
  /// API response logging
  static void apiResponse(String method, String endpoint, int statusCode, [dynamic data]) {
    final emoji = statusCode >= 200 && statusCode < 300 ? '✅' : '❌';
    instance.d('$emoji API RESPONSE: $method $endpoint [$statusCode]', error: data);
  }
  
  /// API error logging
  static void apiError(String method, String endpoint, dynamic error, [StackTrace? stackTrace]) {
    instance.e('❌ API ERROR: $method $endpoint', error: error, stackTrace: stackTrace);
  }
  
  /// Authentication logging
  static void auth(String message, [dynamic data]) {
    instance.i('🔐 AUTH: $message', error: data);
  }
  
  /// User action logging
  static void userAction(String action, [Map<String, dynamic>? data]) {
    instance.i('👤 USER ACTION: $action', error: data);
  }
  
  /// Performance logging
  static void performance(String operation, Duration duration, [Map<String, dynamic>? data]) {
    instance.d('⚡ PERFORMANCE: $operation took ${duration.inMilliseconds}ms', error: data);
  }
  
  /// Database logging
  static void database(String operation, [dynamic data]) {
    instance.d('💾 DATABASE: $operation', error: data);
  }
  
  /// Network logging
  static void network(String message, [dynamic data]) {
    instance.d('🌐 NETWORK: $message', error: data);
  }
  
  /// Security logging
  static void security(String message, [dynamic data]) {
    instance.w('🔒 SECURITY: $message', error: data);
  }
  
  /// Business logic logging
  static void business(String message, [dynamic data]) {
    instance.i('💼 BUSINESS: $message', error: data);
  }
  
  /// UI logging
  static void ui(String message, [dynamic data]) {
    instance.d('🎨 UI: $message', error: data);
  }
  
  /// Dispose the logger (useful for testing)
  static void dispose() {
    _logger = null;
  }
}
