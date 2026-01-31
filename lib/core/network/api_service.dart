import 'package:dio/dio.dart';
import 'api_client.dart';
import 'request_wrapper.dart';
import '../constants/api_endpoints.dart';

/// Wrapper service for API calls
/// 
/// This service provides a high-level interface for making API calls
/// with proper error handling and response transformation.
class ApiService {
  // Private constructor to prevent instantiation
  ApiService._();

  static final Dio _dio = ApiClient.instance;

  // ==================== HTTP METHODS ====================

  /// GET request
  /// 
  /// [endpoint] - API endpoint path
  /// [queryParameters] - Query parameters
  /// [options] - Additional request options
  static Future<Response<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get<T>(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
     } on DioException {
      rethrow;
    }
  }

  /// POST request
  /// 
  /// [endpoint] - API endpoint path
  /// [data] - Request body data (will be wrapped with meta information)
  /// [queryParameters] - Query parameters
  /// [options] - Additional request options
  /// [skipWrapping] - Skip request wrapping (for special cases)
  static Future<Response<T>> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool skipWrapping = false,
  }) async {
    try {
      // Wrap data with meta information if it's a Map and wrapping is not skipped
      dynamic wrappedData = data;
      if (!skipWrapping && data is Map<String, dynamic>) {
        wrappedData = RequestWrapper.wrap(data);
      }

      // If data is FormData, let Dio handle Content-Type automatically
      // by removing the default Content-Type header to avoid conflict
      Options? finalOptions = options;
      if (wrappedData is FormData) {
        final existingHeaders = <String, dynamic>{};
        if (options?.headers != null) {
          // Copy all headers except Content-Type (case-insensitive)
          for (var entry in options!.headers!.entries) {
            if (entry.key.toLowerCase() != 'content-type') {
              existingHeaders[entry.key] = entry.value;
            }
          }
        }
        finalOptions = (options ?? Options()).copyWith(
          headers: existingHeaders.isEmpty ? null : existingHeaders,
        );
      }

      final response = await _dio.post<T>(
        endpoint,
        data: wrappedData,
        queryParameters: queryParameters,
        options: finalOptions,
      );
      return response;
     } on DioException {
      rethrow;
    }
  }

  /// PUT request
  /// 
  /// [endpoint] - API endpoint path
  /// [data] - Request body data (will be wrapped with meta information)
  /// [queryParameters] - Query parameters
  /// [options] - Additional request options
  /// [skipWrapping] - Skip request wrapping (for special cases)
  static Future<Response<T>> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool skipWrapping = false,
  }) async {
    try {
      // Wrap data with meta information if it's a Map and wrapping is not skipped
      dynamic wrappedData = data;
      if (!skipWrapping && data is Map<String, dynamic>) {
        wrappedData = RequestWrapper.wrap(data);
      }

      final response = await _dio.put<T>(
        endpoint,
        data: wrappedData,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// PATCH request
  /// 
  /// [endpoint] - API endpoint path
  /// [data] - Request body data (will be wrapped with meta information)
  /// [queryParameters] - Query parameters
  /// [options] - Additional request options
  /// [skipWrapping] - Skip request wrapping (for special cases)
  static Future<Response<T>> patch<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool skipWrapping = false,
  }) async {
    try {
      // Wrap data with meta information if it's a Map and wrapping is not skipped
      dynamic wrappedData = data;
      if (!skipWrapping && data is Map<String, dynamic>) {
        wrappedData = RequestWrapper.wrap(data);
      }

      final response = await _dio.patch<T>(
        endpoint,
        data: wrappedData,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// DELETE request
  /// 
  /// [endpoint] - API endpoint path
  /// [data] - Request body data (will be wrapped with meta information)
  /// [queryParameters] - Query parameters
  /// [options] - Additional request options
  /// [skipWrapping] - Skip request wrapping (for special cases)
  static Future<Response<T>> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool skipWrapping = false,
  }) async {
    try {
      // Wrap data with meta information if it's a Map and wrapping is not skipped
      dynamic wrappedData = data;
      if (!skipWrapping && data is Map<String, dynamic>) {
        wrappedData = RequestWrapper.wrap(data);
      }

      final response = await _dio.delete<T>(
        endpoint,
        data: wrappedData,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
     } on DioException {
      rethrow;
    }
  }

  // ==================== FILE UPLOAD ====================

  /// Upload file
  /// 
  /// [endpoint] - API endpoint path
  /// [filePath] - Path to the file to upload
  /// [fieldName] - Form field name for the file
  /// [additionalData] - Additional form data (will be wrapped with meta information)
  /// [onSendProgress] - Progress callback
  /// [skipWrapping] - Skip request wrapping (for special cases)
  static Future<Response<T>> uploadFile<T>(
    String endpoint, {
    required String filePath,
    String fieldName = 'file',
    Map<String, dynamic>? additionalData,
    ProgressCallback? onSendProgress,
    bool skipWrapping = false,
  }) async {
    try {
      // Wrap additional data with meta information if not skipped
      Map<String, dynamic>? wrappedAdditionalData = additionalData;
      if (!skipWrapping && additionalData != null) {
        wrappedAdditionalData = RequestWrapper.wrap(additionalData);
      }

      final formData = FormData.fromMap({
        fieldName: await MultipartFile.fromFile(filePath),
        ...?wrappedAdditionalData,
      });

      final response = await _dio.put<T>(
        endpoint,
        data: formData,
        onSendProgress: onSendProgress,
      );
      return response;
     } on DioException {
      rethrow;
    }
  }

  /// Upload multiple files
  /// 
  /// [endpoint] - API endpoint path
  /// [files] - List of file paths to upload
  /// [fieldName] - Form field name for the files
  /// [additionalData] - Additional form data (will be wrapped with meta information)
  /// [onSendProgress] - Progress callback
  /// [skipWrapping] - Skip request wrapping (for special cases)
  static Future<Response<T>> uploadFiles<T>(
    String endpoint, {
    required List<String> files,
    String fieldName = 'files',
    Map<String, dynamic>? additionalData,
    ProgressCallback? onSendProgress,
    bool skipWrapping = false,
  }) async {
    try {
      // Wrap additional data with meta information if not skipped
      Map<String, dynamic>? wrappedAdditionalData = additionalData;
      if (!skipWrapping && additionalData != null) {
        wrappedAdditionalData = RequestWrapper.wrap(additionalData);
      }

      final multipartFiles = await Future.wait(
        files.map((filePath) => MultipartFile.fromFile(filePath)),
      );

      final formData = FormData.fromMap({
        fieldName: multipartFiles,
        ...?wrappedAdditionalData,
      });

      final response = await _dio.post<T>(
        endpoint,
        data: formData,
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  // ==================== DOWNLOAD ====================

  /// Download file
  /// 
  /// [endpoint] - API endpoint path
  /// [savePath] - Path where to save the downloaded file
  /// [onReceiveProgress] - Progress callback
  /// [queryParameters] - Query parameters
  static Future<Response> downloadFile(
    String endpoint, {
    required String savePath,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.download(
        endpoint,
        savePath,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
     } on DioException {
      rethrow;
    }
  }

  // ==================== UTILITY METHODS ====================

  /// Get current base URL
  static String get baseUrl => ApiEndpoints.baseUrl;

  /// Check if the service is initialized
  static bool get isInitialized => ApiClient.isInitialized;

  /// Reset the API client
  static void reset() => ApiClient.reset();

  /// Update base URL
  static void updateBaseUrl(String newBaseUrl) => ApiClient.updateBaseUrl(newBaseUrl);
}