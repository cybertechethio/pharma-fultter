import 'dart:async';
import 'package:dio/dio.dart';

/// Retry interceptor
/// 
/// This interceptor automatically retries failed requests based on
/// configurable retry logic and delay strategies.
class RetryInterceptor extends Interceptor {
  final int maxRetryAttempts;
  final Duration retryDelay;
  final bool Function(DioException)? retryCondition;

  RetryInterceptor({
    this.maxRetryAttempts = 3,
    this.retryDelay = const Duration(seconds: 1),
    this.retryCondition,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      final retryCount = err.requestOptions.extra['retryCount'] ?? 0;
      
      if (retryCount < maxRetryAttempts) {
        // Increment retry count
        err.requestOptions.extra['retryCount'] = retryCount + 1;
        
        // Calculate delay with exponential backoff
        final delay = _calculateDelay(retryCount);
        
        print('🔄 Retrying request (attempt ${retryCount + 1}/$maxRetryAttempts) after ${delay.inMilliseconds}ms');
        
        // Wait before retrying
        await Future.delayed(delay);
        
        try {
          // Retry the request
          final response = await Dio().fetch(err.requestOptions);
          handler.resolve(response);
          return;
        } catch (e) {
          if (e is DioException) {
            // Continue with the error chain
            handler.next(e);
            return;
          }
        }
      }
    }
    
    handler.next(err);
  }

  /// Determine if the request should be retried
  bool _shouldRetry(DioException err) {
    // Use custom retry condition if provided
    if (retryCondition != null) {
      return retryCondition!(err);
    }
    
    // Default retry conditions
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return true;
      
      case DioExceptionType.badResponse:
        // Retry on server errors (5xx) and some client errors
        final statusCode = err.response?.statusCode;
        return statusCode != null && 
               (statusCode >= 500 || statusCode == 429 || statusCode == 408);
      
      case DioExceptionType.badCertificate:
        // Don't retry certificate errors
        return false;
      
      case DioExceptionType.cancel:
        // Don't retry cancelled requests
        return false;
      
      case DioExceptionType.unknown:
        // Retry unknown errors
        return true;
    }
  }

  /// Calculate delay with exponential backoff
  Duration _calculateDelay(int retryCount) {
    // Exponential backoff: delay = baseDelay * (2^retryCount)
    final exponentialDelay = retryDelay * (1 << retryCount);
    
    // Add jitter to prevent thundering herd
    final jitter = Duration(milliseconds: (exponentialDelay.inMilliseconds * 0.1).round());
    final randomJitter = Duration(milliseconds: (jitter.inMilliseconds * (0.5 + (retryCount % 2) * 0.5)).round());
    
    return exponentialDelay + randomJitter;
  }
}
