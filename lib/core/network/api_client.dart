import 'package:dio/dio.dart';
import '../../app/config/env_config.dart';
import '../constants/api_endpoints.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/health_check_interceptor.dart';

/// Dio singleton with interceptors
/// 
/// This class provides a configured Dio instance with all necessary
/// interceptors for authentication, logging, and error handling.
/// Note: Retry logic is handled only by AuthInterceptor for 401 errors.
class ApiClient {
  // Private constructor to prevent instantiation
  ApiClient._();

  static Dio? _instance;

  /// Get the singleton Dio instance
  /// 
  /// This method returns a configured Dio instance with all interceptors
  /// set up according to the environment configuration.
  static Dio get instance {
    _instance ??= _createDio();
    return _instance!;
  }

  /// Create and configure the Dio instance
  static Dio _createDio() {
    print('🔧 DIO CONFIGURATION:');
    print('📍 Base URL: ${ApiEndpoints.baseUrl}');
    print('📍 EnvConfig Base URL: ${EnvConfig.baseUrl}');
    print('📍 Connection Timeout: ${EnvConfig.connectionTimeout}ms');
    print('📍 Receive Timeout: ${EnvConfig.receiveTimeout}ms');
    print('---');
    
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: Duration(milliseconds: EnvConfig.connectionTimeout),
        receiveTimeout: Duration(milliseconds: EnvConfig.receiveTimeout),
        sendTimeout: Duration(milliseconds: EnvConfig.sendTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        validateStatus: (status) {
          // Accept status codes 200-299 as successful
          return status != null && status >= 200 && status < 300;
        },
      ),
    );

    // Add interceptors based on configuration
    if (EnvConfig.enableInterceptors) {
      _addInterceptorsSync(dio);
    }

    return dio;
  }

  /// Add all necessary interceptors to the Dio instance (synchronous)
  static void _addInterceptorsSync(Dio dio) {
    // Add interceptors in the correct order
    // The order matters: they are executed in the order they are added

    // 1. Logging interceptor (first to log all requests/responses)
    if (EnvConfig.enableApiLogging) {
      dio.interceptors.add(LoggingInterceptor());
    }

    // 2. Health check interceptor (performs health check before requests)
   // dio.interceptors.add(HealthCheckInterceptor());

    // 3. Authentication interceptor (adds auth headers and handles 401 retry)
    dio.interceptors.add(AuthInterceptor());

    // 4. Error interceptor (handles and transforms errors)
    dio.interceptors.add(ErrorInterceptor());
  }


  /// Reset the Dio instance
  /// 
  /// This method clears the current instance and forces a new one to be
  /// created on the next call to [instance]. Useful for testing or
  /// when configuration changes.
  static void reset() {
    _instance?.close();
    _instance = null;
  }

  /// Update the base URL and recreate the instance
  /// 
  /// This method allows changing the base URL at runtime, which is useful
  /// for switching between different environments or API versions.
  static void updateBaseUrl(String newBaseUrl) {
    reset();
    // Note: You might want to update EnvConfig.baseUrl here as well
    // or create a new method to handle this properly
  }

  /// Get current base URL
  static String get baseUrl => ApiEndpoints.baseUrl;

  /// Check if the client is initialized
  static bool get isInitialized => _instance != null;
}