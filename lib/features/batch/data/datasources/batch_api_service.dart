import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/batch_model.dart';

class BatchApiService {
  const BatchApiService();

  factory BatchApiService.create() {
    return const BatchApiService();
  }

  Future<ApiResponse<BatchModel>> create({
    required int itemId,
    required String batchName,
  }) async {
    try {
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createBatch,
        data: {
          'itemId': itemId,
          'batchName': batchName,
        },
      );

      final apiResponse = ApiResponse<BatchModel>.fromJson(
        response.data!,
        (json) => BatchModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create batch: $e');
      rethrow;
    }
  }

  /// Get all batches with pagination
  /// 
  /// [page] - Page number (default: 1)
  /// [limit] - Items per page (default: 25)
  /// [search] - Search query (optional)
  Future<ApiResponse<List<BatchModel>>> getAll({
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'page': page,
        'limit': limit,
      };
      
      if (search != null && search.trim().isNotEmpty) {
        queryParameters['search'] = search.trim();
      }
      
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getBatches,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<List<BatchModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => BatchModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get batches: $e');
      rethrow;
    }
  }

  Future<ApiResponse<BatchModel>> update({
    required int id,
    required String batchName,
  }) async {
    try {
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateBatch(id.toString()),
        data: {
          'batchName': batchName,
        },
      );

      final apiResponse = ApiResponse<BatchModel>.fromJson(
        response.data!,
        (json) => BatchModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update batch: $e');
      rethrow;
    }
  }
}

