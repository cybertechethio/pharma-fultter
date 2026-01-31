/// Base exception class for all application errors
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic details;
  
  const AppException(
    this.message, {
    this.code,
    this.details,
  });
  
  /// User-friendly error message
  String get userMessage => message;
  
  @override
  String toString() => 'AppException: $message';
}

/// Network-related exceptions
class NetworkException extends AppException {
  const NetworkException(
    super.message, {
    super.code,
    super.details,
  });
  
  @override
  String toString() => 'NetworkException: $message';
}

/// Validation-related exceptions
class ValidationException extends AppException {
  final String? field;
  
  const ValidationException(
    super.message, {
    super.code,
    super.details,
    this.field,
  });
  
  @override
  String toString() => 'ValidationException: $message';
}

/// Authentication-related exceptions
class AuthenticationException extends AppException {
  const AuthenticationException(
    super.message, {
    super.code,
    super.details,
  });
  
  @override
  String toString() => 'AuthenticationException: $message';
}

/// Permission-related exceptions
class PermissionException extends AppException {
  const PermissionException(
    super.message, {
    super.code,
    super.details,
  });
  
  @override
  String toString() => 'PermissionException: $message';
}

/// Storage-related exceptions
class StorageException extends AppException {
  const StorageException(
    super.message, {
    super.code,
    super.details,
  });
  
  @override
  String toString() => 'StorageException: $message';
}

/// Security-related exceptions
class SecurityException extends AppException {
  const SecurityException(
    super.message, {
    super.code,
    super.details,
  });
  
  @override
  String toString() => 'SecurityException: $message';
}

/// File operation exceptions
class FileException extends AppException {
  const FileException(
    super.message, {
    super.code,
    super.details,
  });
  
  @override
  String toString() => 'FileException: $message';
}

/// Audio-related exceptions
class AudioException extends AppException {
  const AudioException(
    super.message, {
    super.code,
    super.details,
  });
  
  @override
  String toString() => 'AudioException: $message';
}

/// Configuration-related exceptions
class ConfigurationException extends AppException {
  const ConfigurationException(
    super.message, {
    super.code,
    super.details,
  });
  
  @override
  String toString() => 'ConfigurationException: $message';
}
