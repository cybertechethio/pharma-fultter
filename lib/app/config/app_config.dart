import 'env_config.dart';

/// Application configuration
/// 
/// This class provides application-wide configuration settings
/// that combine environment-specific settings with app-specific constants.
class AppConfig {
  // Private constructor to prevent instantiation
  AppConfig._();

  // ==================== APP INFORMATION ====================
  
  /// Application name
  static const String appName = 'Cyber Tech';
  
  /// Application version
  static const String appVersion = '1.0.0';
  
  /// Application build number
  static const String buildNumber = '1';
  
  /// Application description
  static const String appDescription = 'Dynamic Theme System with Audio Support';

  // ==================== API CONFIGURATION ====================
  
  /// API base URL from environment configuration
  static String get apiBaseUrl => EnvConfig.apiBaseUrl;
  
  /// API request timeout
  static Duration get apiTimeout => Duration(milliseconds: EnvConfig.requestTimeout);
  
  /// Enable API logging
  static bool get enableApiLogging => EnvConfig.enableApiLogging;

  // ==================== FEATURE FLAGS ====================
  
  /// Enable debug features
  static bool get enableDebugFeatures => EnvConfig.isDevelopment;
  
  /// Enable analytics
  static bool get enableAnalytics => EnvConfig.isProduction;
  
  /// Enable crash reporting
  static bool get enableCrashReporting => EnvConfig.isProduction;
  
  /// Enable performance monitoring
  static bool get enablePerformanceMonitoring => EnvConfig.isProduction;

  // ==================== UI CONFIGURATION ====================
  
  /// Default animation duration
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  
  /// Long animation duration
  static const Duration longAnimationDuration = Duration(milliseconds: 500);
  
  /// Short animation duration
  static const Duration shortAnimationDuration = Duration(milliseconds: 150);
  
  /// Default page transition duration
  static const Duration pageTransitionDuration = Duration(milliseconds: 250);

  // ==================== STORAGE CONFIGURATION ====================
  
  /// Maximum cache size in bytes
  static const int maxCacheSize = 100 * 1024 * 1024; // 100 MB
  
  /// Cache expiration time
  static const Duration cacheExpiration = Duration(hours: 24);
  
  /// Maximum number of cached items
  static const int maxCachedItems = 1000;

  // ==================== AUDIO CONFIGURATION ====================
  
  /// Default audio quality
  static const String defaultAudioQuality = 'high';
  
  /// Maximum audio file size in bytes
  static const int maxAudioFileSize = 50 * 1024 * 1024; // 50 MB
  
  /// Supported audio formats
  static const List<String> supportedAudioFormats = [
    'mp3',
    'wav',
    'aac',
    'm4a',
    'flac',
  ];

  // ==================== CALENDAR CONFIGURATION ====================
  
  /// Default calendar type
  static const String defaultCalendarType = 'gregorian';
  
  /// Supported calendar types
  static const List<String> supportedCalendarTypes = [
    'gregorian',
    'ethiopian',
  ];

  // ==================== SECURITY CONFIGURATION ====================
  
  /// Enable SSL pinning
  static bool get enableSslPinning => EnvConfig.isProduction;
  
  /// Enable certificate validation
  static bool get enableCertificateValidation => true;
  
  /// Maximum login attempts
  static const int maxLoginAttempts = 5;
  
  /// Lockout duration after max attempts
  static const Duration lockoutDuration = Duration(minutes: 15);

  // ==================== NETWORK CONFIGURATION ====================
  
  /// Enable network monitoring
  static bool get enableNetworkMonitoring => true;
  
  /// Network timeout duration
  static Duration get networkTimeout => Duration(milliseconds: EnvConfig.connectionTimeout);

  // ==================== LOGGING CONFIGURATION ====================
  
  /// Enable debug logging
  static bool get enableDebugLogging => EnvConfig.isDevelopment;
  
  /// Enable info logging
  static bool get enableInfoLogging => true;
  
  /// Enable warning logging
  static bool get enableWarningLogging => true;
  
  /// Enable error logging
  static bool get enableErrorLogging => true;

  // ==================== VALIDATION CONFIGURATION ====================
  
  /// Minimum password length
  static const int minPasswordLength = 8;
  
  /// Maximum password length
  static const int maxPasswordLength = 128;
  
  /// Minimum username length
  static const int minUsernameLength = 3;
  
  /// Maximum username length
  static const int maxUsernameLength = 50;
  
  /// Maximum email length
  static const int maxEmailLength = 254;

  // ==================== UTILITY METHODS ====================
  
  /// Check if running in development mode
  static bool get isDevelopment => EnvConfig.isDevelopment;
  
  /// Check if running in staging mode
  static bool get isStaging => EnvConfig.isStaging;
  
  /// Check if running in production mode
  static bool get isProduction => EnvConfig.isProduction;
  
  /// Get environment name
  static String get environmentName => EnvConfig.environment.name;
  
  /// Get full app version string
  static String get fullVersion => '$appVersion+$buildNumber';
  
  /// Get user agent string
  static String get userAgent => '$appName/$appVersion ($environmentName)';
}
