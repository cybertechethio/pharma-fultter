import 'package:dio/dio.dart';
import '../network/api_service.dart';
import '../constants/api_endpoints.dart';
import '../../shared/models/api_response.dart';
import '../../shared/models/upload_response_model.dart';
import 'logging_service.dart';

/// Service for uploading files to the dedicated upload endpoint
class UploadService {
  const UploadService();

  factory UploadService.create() {
    return const UploadService();
  }

  /// Upload a single file
  /// 
  /// [filePath] - Path to the file to upload
  /// Returns the upload response with file URL
  Future<ApiResponse<UploadResponseModel>> uploadFile(String filePath) async {
    try {
      LoggingService.apiRequest('POST', ApiEndpoints.uploads, {
        'file': filePath,
      });

      final formData = FormData.fromMap({
        'files': await MultipartFile.fromFile(filePath),
      });

      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.uploads,
        data: formData,
        skipWrapping: true, // Upload endpoint doesn't use RequestWrapper
      );

      LoggingService.apiResponse(
        'POST',
        ApiEndpoints.uploads,
        response.statusCode ?? 0,
        response.data,
      );

      final apiResponse = ApiResponse<UploadResponseModel>.fromJson(
        response.data!,
        (json) => UploadResponseModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to upload file: $e');
      rethrow;
    }
  }

  /// Upload multiple files
  /// 
  /// [filePaths] - List of file paths to upload
  /// Returns the upload response with file URLs
  Future<ApiResponse<UploadResponseModel>> uploadFiles(
    List<String> filePaths,
  ) async {
    try {
      LoggingService.apiRequest('POST', ApiEndpoints.uploads, {
        'filesCount': filePaths.length,
      });

      final multipartFiles = await Future.wait(
        filePaths.map((path) => MultipartFile.fromFile(path)),
      );

      final formData = FormData.fromMap({
        'files': multipartFiles,
      });

      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.uploads,
        data: formData,
        skipWrapping: true, // Upload endpoint doesn't use RequestWrapper
      );

      LoggingService.apiResponse(
        'POST',
        ApiEndpoints.uploads,
        response.statusCode ?? 0,
        response.data,
      );

      final apiResponse = ApiResponse<UploadResponseModel>.fromJson(
        response.data!,
        (json) => UploadResponseModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to upload files: $e');
      rethrow;
    }
  }
}

