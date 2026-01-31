import '../errors/app_exception.dart';
import '../errors/exceptions.dart';
import 'base_repository.dart';

/// Base use case class providing common functionality
/// 
/// This abstract class provides a foundation for all use case implementations
/// in the application, ensuring consistent error handling and common patterns.
abstract class BaseUseCase<Type, Params> {
  /// Execute the use case with the given parameters
  /// 
  /// [params] - The parameters required for the use case
  /// Returns the result of type [Type]
  /// Throws [UseCaseException] on failure
  Future<Type> call(Params params);
  
  /// Execute the use case with error handling
  /// 
  /// [params] - The parameters required for the use case
  /// Returns the result of type [Type]
  /// Throws [UseCaseException] on failure
  Future<Type> execute(Params params) async {
    try {
      return await call(params);
    } catch (e) {
      throw handleError(e);
    }
  }
  
  /// Handle use case errors with consistent error transformation
  /// 
  /// [error] - The original error
  /// Returns a standardized [UseCaseException]
  UseCaseException handleError(dynamic error) {
    if (error is UseCaseException) {
      return error;
    }
    
    if (error is ValidationException) {
      return UseCaseException(
        'Validation error: ${error.message}',
        type: UseCaseErrorType.validationError,
        originalError: error,
      );
    }
    
    if (error is NetworkException) {
      return UseCaseException(
        'Network error: ${error.message}',
        type: UseCaseErrorType.networkError,
        originalError: error,
      );
    }
    
    if (error is RepositoryException) {
      return UseCaseException(
        'Repository error: ${error.message}',
        type: UseCaseErrorType.repositoryError,
        originalError: error,
      );
    }
    
    return UseCaseException(
      'Unexpected error: ${error.toString()}',
      type: UseCaseErrorType.unknownError,
      originalError: error,
    );
  }
}

/// Use case for operations that don't require parameters
abstract class BaseUseCaseNoParams<Type> {
  /// Execute the use case
  /// 
  /// Returns the result of type [Type]
  /// Throws [UseCaseException] on failure
  Future<Type> call();
  
  /// Execute the use case with error handling
  /// 
  /// Returns the result of type [Type]
  /// Throws [UseCaseException] on failure
  Future<Type> execute() async {
    try {
      return await call();
    } catch (e) {
      throw handleError(e);
    }
  }
  
  /// Handle use case errors with consistent error transformation
  /// 
  /// [error] - The original error
  /// Returns a standardized [UseCaseException]
  UseCaseException handleError(dynamic error) {
    if (error is UseCaseException) {
      return error;
    }
    
    if (error is ValidationException) {
      return UseCaseException(
        'Validation error: ${error.message}',
        type: UseCaseErrorType.validationError,
        originalError: error,
      );
    }
    
    if (error is NetworkException) {
      return UseCaseException(
        'Network error: ${error.message}',
        type: UseCaseErrorType.networkError,
        originalError: error,
      );
    }
    
    if (error is RepositoryException) {
      return UseCaseException(
        'Repository error: ${error.message}',
        type: UseCaseErrorType.repositoryError,
        originalError: error,
      );
    }
    
    return UseCaseException(
      'Unexpected error: ${error.toString()}',
      type: UseCaseErrorType.unknownError,
      originalError: error,
    );
  }
}

/// Use case exception types
enum UseCaseErrorType {
  validationError,
  networkError,
  repositoryError,
  businessLogicError,
  unknownError,
}

/// Use case-specific exception
class UseCaseException extends AppException {
  final UseCaseErrorType type;
  final dynamic originalError;
  
  const UseCaseException(
    String message, {
    required this.type,
    this.originalError,
    String? code,
  }) : super(message, code: code,);
  
  @override
  String get userMessage {
    switch (type) {
      case UseCaseErrorType.validationError:
        return message;
      case UseCaseErrorType.networkError:
        return 'Network connection error. Please check your internet connection.';
      case UseCaseErrorType.repositoryError:
        return 'Data access error. Please try again.';
      case UseCaseErrorType.businessLogicError:
        return 'Business logic error. Please check your input.';
      case UseCaseErrorType.unknownError:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}

/// No parameters class for use cases that don't need parameters
class NoParams {
  const NoParams();
}