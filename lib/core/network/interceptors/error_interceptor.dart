import 'package:dio/dio.dart';

/// Error interceptor
/// 
/// This interceptor handles and transforms HTTP errors into more user-friendly
/// error messages and provides consistent error handling across the application.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final transformedError = _transformError(err);
    handler.next(transformedError);
  }

  /// Transform DioException into a more user-friendly error
  DioException _transformError(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        return err.copyWith(
          message: 'Connection timeout. Please check your internet connection.',
        );
      
      case DioExceptionType.sendTimeout:
        return err.copyWith(
          message: 'Request timeout. Please try again.',
        );
      
      case DioExceptionType.receiveTimeout:
        return err.copyWith(
          message: 'Response timeout. Please try again.',
        );
      
      case DioExceptionType.badResponse:
        return _handleBadResponse(err);
      
      case DioExceptionType.cancel:
        return err.copyWith(
          message: 'Request was cancelled.',
        );
      
      case DioExceptionType.connectionError:
        return err.copyWith(
          message: 'Connection error. Please check your internet connection.',
        );
      
      case DioExceptionType.badCertificate:
        return err.copyWith(
          message: 'Security certificate error. Please try again.',
        );
      
      case DioExceptionType.unknown:
        return err.copyWith(
          message: 'An unexpected error occurred. Please try again.',
        );
    }
  }

  /// Handle bad response errors with specific status codes
  DioException _handleBadResponse(DioException err) {
    final statusCode = err.response?.statusCode;
    final responseData = err.response?.data;

    String message;
    
    switch (statusCode) {
      case 400:
        message = _extractErrorMessage(responseData) ?? 'Bad request. Please check your input.';
        break;
      
      case 401:
        message = 'Authentication failed. Please log in again.';
        break;
      
      case 403:
        message = 'Access denied. You don\'t have permission to perform this action.';
        break;
      
      case 404:
        message = 'The requested resource was not found.';
        break;
      
      case 409:
        message = _extractErrorMessage(responseData) ?? 'Conflict. The resource already exists.';
        break;
      
      case 422:
        message = _extractErrorMessage(responseData) ?? 'Validation error. Please check your input.';
        break;
      
      case 429:
        message = 'Too many requests. Please wait a moment and try again.';
        break;
      
      case 500:
        message = 'Internal server error. Please try again later.';
        break;
      
      case 502:
        message = 'Bad gateway. The server is temporarily unavailable.';
        break;
      
      case 503:
        message = 'Service unavailable. Please try again later.';
        break;
      
      case 504:
        message = 'Gateway timeout. Please try again later.';
        break;
      
      default:
        message = _extractErrorMessage(responseData) ?? 
                 'An error occurred (${statusCode ?? 'unknown'}). Please try again.';
    }

    return err.copyWith(message: message);
  }

  /// Extract error message from response data
  String? _extractErrorMessage(dynamic responseData) {
    if (responseData == null) return null;
    
    try {
      if (responseData is Map<String, dynamic>) {
        // Try common error message fields
        return responseData['message'] as String? ??
               responseData['error'] as String? ??
               responseData['detail'] as String? ??
               responseData['msg'] as String?;
      } else if (responseData is String) {
        return responseData;
      }
    } catch (e) {
      // If parsing fails, return null
    }
    
    return null;
  }
}
