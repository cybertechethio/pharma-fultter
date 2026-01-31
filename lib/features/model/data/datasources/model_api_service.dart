import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/model_model.dart';

class ModelApiService {
  const ModelApiService();

  factory ModelApiService.create() {
    return const ModelApiService();
  }

  Future<ApiResponse<ModelModel>> create({
    required String name,
    required String description,
  }) async {
    try {
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createModel,
        data: {
          'name': name,
          'description': description,
        },
      );

      final apiResponse = ApiResponse<ModelModel>.fromJson(
        response.data!,
        (json) => ModelModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create model: $e');
      rethrow;
    }
  }

  Future<ApiResponse<List<ModelModel>>> getAll() async {
    try {
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getModels,
      );

      final apiResponse = ApiResponse<List<ModelModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => ModelModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get models: $e');
      rethrow;
    }
  }

  Future<ApiResponse<ModelModel>> update({
    required String id,
    required String name,
    required String description,
  }) async {
    try {
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateModel(id),
        data: {
          'name': name,
          'description': description,
        },
      );

      final apiResponse = ApiResponse<ModelModel>.fromJson(
        response.data!,
        (json) => ModelModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update model: $e');
      rethrow;
    }
  }

  Future<ApiResponse<ModelModel>> delete({
    required String id,
  }) async {
    try {
      final response = await ApiService.delete<Map<String, dynamic>>(
        ApiEndpoints.deleteModel(id),
      );

      final apiResponse = ApiResponse<ModelModel>.fromJson(
        response.data!,
        (json) => ModelModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to delete model: $e');
      rethrow;
    }
  }
}

