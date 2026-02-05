/// Environment configuration for the application
/// 
/// This class contains environment-specific settings including API URLs,
/// timeouts, and other configuration values that may vary between
/// development, staging, and production environments.
class EnvConfig {
  // Private constructor to prevent instantiation
  EnvConfig._();

  /// Base URL for API calls
  /// 
  /// Change this URL based on your environment:
  /// - Development: http://localhost:3000 or your local API
  /// - Staging: https://staging-api.yourapp.com
  /// - Production: https://api.yourapp.com 10.255.17.164 //'https://npback.cybeerpos.com/api'; //
  //static const String baseUrl = 'https://api.yourapp.com'; cybertech01 = 10.209.102.164
   static const String baseUrl = 'http://192.168.8.156:5001/api';// cyber001 wifi

  /// Full API base URL
  static String get apiBaseUrl => baseUrl;

  /// Request timeout duration in milliseconds
  static const int requestTimeout = 30000; // 30 seconds

  /// Connection timeout duration in milliseconds
  static const int connectionTimeout = 10000; // 10 seconds

  /// Receive timeout duration in milliseconds
  static const int receiveTimeout = 30000; // 30 seconds

  /// Send timeout duration in milliseconds
  static const int sendTimeout = 30000; // 30 seconds

  /// Enable debug logging for API calls
  static const bool enableApiLogging = true;

  /// Enable request/response interceptors
  static const bool enableInterceptors = true;

  /// Environment type
  static const EnvironmentType environment = EnvironmentType.development;

  /// Check if running in development mode
  static bool get isDevelopment => environment == EnvironmentType.development;

  /// Check if running in staging mode
  static bool get isStaging => environment == EnvironmentType.staging;

  /// Check if running in production mode
  static bool get isProduction => environment == EnvironmentType.production;
}

/// Environment types
enum EnvironmentType {
  development,
  staging,
  production,
}
