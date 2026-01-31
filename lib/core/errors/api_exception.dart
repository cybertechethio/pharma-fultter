// import 'package:dio/dio.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'api_exception.freezed.dart';

// /// API exception class using Freezed
// /// 
// /// This class provides a standardized way to handle API errors
// /// and convert DioException to more user-friendly exceptions.
// @freezed
// sealed class ApiException with _$ApiException implements Exception {
//   const factory ApiException({
//     required String message,
//     int? statusCode,
//     String? endpoint,
//     DioExceptionType? type,
//     dynamic data,
//   }) = _ApiException;

//   /// Create ApiException from DioException
//   factory ApiException.fromDioException(DioException dioException) {
//     String message;
//     int? statusCode;
//     String? endpoint;
//     DioExceptionType? type;
//     dynamic data;

//     // Extract information from DioException
//     statusCode = dioException.response?.statusCode;
//     endpoint = dioException.requestOptions.path;
//     type = dioException.type;
//     data = dioException.response?.data;

//     // Determine message based on error type
//     switch (dioException.type) {
//       case DioExceptionType.connectionTimeout:
//         message = 'Connection timeout. Please check your internet connection.';
//         break;
      
//       case DioExceptionType.sendTimeout:
//         message = 'Request timeout. Please try again.';
//         break;
      
//       case DioExceptionType.receiveTimeout:
//         message = 'Response timeout. Please try again.';
//         break;
      
//       case DioExceptionType.badResponse:
//         message = ApiExceptionX._extractErrorMessage(data) ?? ApiExceptionX._getDefaultMessage(statusCode);
//         break;
      
//       case DioExceptionType.cancel:
//         message = 'Request was cancelled.';
//         break;
      
//       case DioExceptionType.connectionError:
//         message = 'Connection error. Please check your internet connection.';
//         break;
      
//       case DioExceptionType.badCertificate:
//         message = 'Security certificate error. Please try again.';
//         break;
      
//       case DioExceptionType.unknown:
//         message = 'An unexpected error occurred. Please try again.';
//         break;
      
//       default:
//         message = 'An unknown error occurred.';
//     }

//     return ApiException(
//       message: message,
//       statusCode: statusCode,
//       endpoint: endpoint,
//       type: type,
//       data: data,
//     );
//   }
// }

// /// Extension methods for ApiException
// extension ApiExceptionX on ApiException {
//   /// Extract error message from response data
//   static String? _extractErrorMessage(dynamic responseData) {
//     if (responseData == null) return null;
    
//     try {
//       if (responseData is Map<String, dynamic>) {
//         // Try common error message fields
//         return responseData['message'] as String? ??
//                responseData['error'] as String? ??
//                responseData['detail'] as String? ??
//                responseData['msg'] as String?;
//       } else if (responseData is String) {
//         return responseData;
//       }
//     } catch (e) {
//       // If parsing fails, return null
//     }
    
//     return null;
//   }

//   /// Get default message for status code
//   static String _getDefaultMessage(int? statusCode) {
//     switch (statusCode) {
//       case 400:
//         return 'Bad request. Please check your input.';
//       case 401:
//         return 'Authentication failed. Please log in again.';
//       case 403:
//         return 'Access denied. You don\'t have permission to perform this action.';
//       case 404:
//         return 'The requested resource was not found.';
//       case 409:
//         return 'Conflict. The resource already exists.';
//       case 422:
//         return 'Validation error. Please check your input.';
//       case 429:
//         return 'Too many requests. Please wait a moment and try again.';
//       case 500:
//         return 'Internal server error. Please try again later.';
//       case 502:
//         return 'Bad gateway. The server is temporarily unavailable.';
//       case 503:
//         return 'Service unavailable. Please try again later.';
//       case 504:
//         return 'Gateway timeout. Please try again later.';
//       default:
//         return 'An error occurred (${statusCode ?? 'unknown'}). Please try again.';
//     }
//   }

//   /// Check if this is a network error
//   bool get isNetworkError {
//     return type == DioExceptionType.connectionTimeout ||
//            type == DioExceptionType.connectionError ||
//            type == DioExceptionType.receiveTimeout ||
//            type == DioExceptionType.sendTimeout;
//   }

//   /// Check if this is an authentication error
//   bool get isAuthError {
//     return statusCode == 401 || statusCode == 403;
//   }

//   /// Check if this is a client error (4xx)
//   bool get isClientError {
//     return statusCode != null && statusCode! >= 400 && statusCode! < 500;
//   }

//   /// Check if this is a server error (5xx)
//   bool get isServerError {
//     return statusCode != null && statusCode! >= 500 && statusCode! < 600;
//   }

//   /// Check if this is a validation error
//   bool get isValidationError {
//     return statusCode == 422;
//   }

//   /// Check if this is a not found error
//   bool get isNotFoundError {
//     return statusCode == 404;
//   }

//   /// Check if this is a rate limit error
//   bool get isRateLimitError {
//     return statusCode == 429;
//   }
// }