import 'package:cyber_pos/core/errors/app_exception.dart';

import '../errors/exceptions.dart';

/// Base repository class providing common functionality
/// 
/// This abstract class provides a foundation for all repository implementations
/// in the application, ensuring consistent error handling and common patterns.
abstract class BaseRepository {
  /// Handle repository errors with consistent error transformation
  /// 
  /// [error] - The original error
  /// [operation] - The operation that failed
  /// Returns a standardized [RepositoryException]
  RepositoryException handleError(dynamic error, String operation) {
    if (error is RepositoryException) {
      return error;
    }
    
    if (error is NetworkException) {
      return RepositoryException(
        'Network error during $operation: ${error.message}',
        type: RepositoryErrorType.networkError,
        originalError: error,
      );
    }
    
    if (error is ValidationException) {
      return RepositoryException(
        'Validation error during $operation: ${error.message}',
        type: RepositoryErrorType.validationError,
        originalError: error,
      );
    }
    
    return RepositoryException(
      'Unexpected error during $operation: ${error.toString()}',
      type: RepositoryErrorType.unknownError,
      originalError: error,
    );
  }
  
  /// Validate required parameters
  /// 
  /// [value] - The value to validate
  /// [parameterName] - The name of the parameter for error messages
  /// Throws [ValidationException] if validation fails
  void validateRequired(dynamic value, String parameterName) {
    // if (value == null || (value is String && value.isEmpty)) {
    //   throw ValidationException(
    //     '$parameterName is required',
    //     field: parameterName,
    //   );
    // }
  }
  
  /// Validate email format
  /// 
  /// [email] - The email to validate
  /// Throws [ValidationException] if email format is invalid
  void validateEmail(String email) {
    validateRequired(email, 'Email');
    
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    // if (!emailRegex.hasMatch(email)) {
    //   throw ValidationException(
    //     'Invalid email format',
    //     field: 'email',
    //   );
    // }
  }
  
  /// Validate phone number format
  /// 
  /// [phone] - The phone number to validate
  /// Throws [ValidationException] if phone format is invalid
  void validatePhone(String phone) {
    validateRequired(phone, 'Phone');
    
    final phoneRegex = RegExp(r'^\+251[0-9]{9}$');
    // if (!phoneRegex.hasMatch(phone)) {
    //   throw ValidationException(
    //     'Invalid phone format. Use Ethiopian format: +251XXXXXXXXX',
    //     field: 'phone',
    //   );
    // }
  }
}

/// Repository exception types
enum RepositoryErrorType {
  networkError,
  validationError,
  authenticationError,
  authorizationError,
  notFoundError,
  serverError,
  unknownError,
}

/// Repository-specific exception
class RepositoryException extends AppException {
  final RepositoryErrorType type;
  final dynamic originalError;
  
  const RepositoryException(
    String message, {
    required this.type,
    this.originalError,
    String? code,
  }) : super(message, code: code,);
  
  @override
  String get userMessage {
    switch (type) {
      case RepositoryErrorType.networkError:
        return 'Network connection error. Please check your internet connection.';
      case RepositoryErrorType.validationError:
        return message;
      case RepositoryErrorType.authenticationError:
        return 'Authentication failed. Please log in again.';
      case RepositoryErrorType.authorizationError:
        return 'You do not have permission to perform this action.';
      case RepositoryErrorType.notFoundError:
        return 'The requested resource was not found.';
      case RepositoryErrorType.serverError:
        return 'Server error. Please try again later.';
      case RepositoryErrorType.unknownError:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}