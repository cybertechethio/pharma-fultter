import 'package:dio/dio.dart';
import '../../../app/config/env_config.dart';
import '../../services/logging_service.dart';

/// Logging interceptor
/// 
/// This interceptor logs all HTTP requests and responses for debugging purposes.
/// It only logs in development mode to avoid exposing sensitive information
/// in production builds.
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add start time for response time calculation
    options.extra['start_time'] = DateTime.now().millisecondsSinceEpoch;
    
    if (EnvConfig.enableApiLogging && EnvConfig.isDevelopment) {
      _logRequest(options);
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (EnvConfig.enableApiLogging && EnvConfig.isDevelopment) {
      _logResponse(response);
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (EnvConfig.enableApiLogging && EnvConfig.isDevelopment) {
      _logError(err);
    }
    handler.next(err);
  }

  /// Log outgoing request details
  void _logRequest(RequestOptions options) {
    final fullUrl = '${options.baseUrl}${options.path}';
    
    LoggingService.network('🚀 OUTGOING REQUEST', {
      'method': options.method,
      'url': fullUrl,
      'path': options.path,
      'headers': options.headers,
      'queryParameters': options.queryParameters,
      'requestBody': options.data,
      'contentType': options.contentType,
      'timeout': {
        'connect': options.connectTimeout?.inMilliseconds,
        'receive': options.receiveTimeout?.inMilliseconds,
        'send': options.sendTimeout?.inMilliseconds,
      },
    });
    
    // Also keep console logging for development
    if (EnvConfig.isDevelopment) {
      print('🚀 REQUEST[${options.method}] => URL: $fullUrl');
      print('Headers: ${options.headers}');
      
      if (options.queryParameters.isNotEmpty) {
        print('Query Parameters: ${options.queryParameters}');
      }
      
      if (options.data != null) {
        print('Request Body: ${options.data}');
      }
      print('---');
    }
  }

  /// Log incoming response details
  void _logResponse(Response response) {
    final fullUrl = '${response.requestOptions.baseUrl}${response.requestOptions.path}';
    final responseTime = DateTime.now().millisecondsSinceEpoch - 
        (response.requestOptions.extra['start_time'] as int? ?? DateTime.now().millisecondsSinceEpoch);
    
    LoggingService.network('✅ INCOMING RESPONSE', {
      'statusCode': response.statusCode,
      'method': response.requestOptions.method,
      'url': fullUrl,
      'path': response.requestOptions.path,
      'headers': response.headers.map,
      'responseBody': response.data,
      'statusMessage': response.statusMessage,
      'responseTime': '${responseTime}ms',
      'requestHeaders': response.requestOptions.headers,
      'requestBody': response.requestOptions.data,
    });
    
    // Also keep console logging for development
    if (EnvConfig.isDevelopment) {
      print('✅ RESPONSE[${response.statusCode}] => URL: $fullUrl');
      print('Response Time: ${responseTime}ms');
      print('Headers: ${response.headers}');
      
      if (response.data != null) {
        // Truncate large responses for readability
        final dataString = response.data.toString();
        if (dataString.length > 1000) {
          print('Response Body: ${dataString}');
        } else {
          print('Response Body: $dataString');
        }
      }
      print('---');
    }
  }

  /// Log error details
  void _logError(DioException err) {
    final fullUrl = '${err.requestOptions.baseUrl}${err.requestOptions.path}';
    
    LoggingService.network('❌ REQUEST ERROR', {
      'statusCode': err.response?.statusCode,
      'method': err.requestOptions.method,
      'url': fullUrl,
      'path': err.requestOptions.path,
      'errorType': err.type.toString(),
      'errorMessage': err.message,
      'responseData': err.response?.data,
      'responseHeaders': err.response?.headers.map,
      'requestHeaders': err.requestOptions.headers,
      'requestBody': err.requestOptions.data,
      'stackTrace': err.stackTrace.toString(),
    });
    
    // Also keep console logging for development
    if (EnvConfig.isDevelopment) {
      print('❌ ERROR[${err.response?.statusCode}] => URL: $fullUrl');
      print('Error Type: ${err.type}');
      print('Error Message: ${err.message}');
      
      if (err.response != null) {
        print('Response Data: ${err.response!.data}');
        print('Response Headers: ${err.response!.headers}');
      }
      
      if (err.requestOptions.data != null) {
        print('Request Data: ${err.requestOptions.data}');
      }
      print('---');
    }
  }
}