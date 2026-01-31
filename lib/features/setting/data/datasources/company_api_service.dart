import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../core/services/upload_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/upload_response_model.dart';
import '../models/company_model.dart';
import '../models/company_request_model.dart';

class CompanyApiService {
  final UploadService _uploadService;

  const CompanyApiService({
    required UploadService uploadService,
  }) : _uploadService = uploadService;

  factory CompanyApiService.create() {
    return CompanyApiService(
      uploadService: UploadService.create(),
    );
  }

  /// Get company by ID
  Future<ApiResponse<CompanyModel>> getCompany({
    required String companyId,
  }) async {
    try {
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.updateCompany(companyId),
      );

      final apiResponse = ApiResponse<CompanyModel>.fromJson(
        response.data!,
        (json) => CompanyModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get company: $e');
      rethrow;
    }
  }

  /// Update company
  Future<ApiResponse<CompanyModel>> updateCompany({
    required String companyId,
    required CompanyRequestModel request,
    String? logoFilePath, // File path for logo upload (uploaded separately)
  }) async {
    try {
      // Step 1: Upload logo file if provided
      String? logoUrl;
      if (logoFilePath != null && logoFilePath.isNotEmpty) {
        LoggingService.auth('Uploading company logo', {
          'filePath': logoFilePath,
        });

        final uploadResponse = await _uploadService.uploadFile(logoFilePath);
        uploadResponse.when(
          success: (success, message, data, meta, pagination) {
            // Extract URL from upload response
            logoUrl = data.when(
              single: (fileData) => fileData.url,
              multiple: (filesData) => filesData.files.isNotEmpty ? filesData.files.first.url : null,
            );
            LoggingService.auth('Company logo uploaded successfully', {
              'url': logoUrl,
            });
          },
          error: (success, error, meta) {
            throw Exception('Failed to upload logo: ${error.message}');
          },
        );
      }

      // Step 2: Create updated request with logo URL (if uploaded) or use existing logoUrl
      final updatedRequest = request.copyWith(
        logoUrl: logoUrl ?? request.logoUrl,
      );

      // Step 3: Convert to JSON and clean up null fields
      var requestJson = updatedRequest.toJson();
      
      // Remove null/empty fields
      requestJson.removeWhere((key, value) => value == null);

      // Step 4: Send update request
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateCompany(companyId),
        data: requestJson,
      );

      final apiResponse = ApiResponse<CompanyModel>.fromJson(
        response.data!,
        (json) => CompanyModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update company: $e');
      rethrow;
    }
  }
}

