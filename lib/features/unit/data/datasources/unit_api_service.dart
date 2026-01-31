import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/unit_model.dart';

class UnitApiService {
  const UnitApiService();

  factory UnitApiService.create() {
    return const UnitApiService();
  }

  Future<ApiResponse<UnitModel>> create({
    required String name,
    required String description,
  }) async {
    try {
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createUnit,
        data: {
          'name': name,
          'description': description,
        },
      );

      final apiResponse = ApiResponse<UnitModel>.fromJson(
        response.data!,
        (json) => UnitModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create unit: $e');
      rethrow;
    }
  }

  Future<ApiResponse<List<UnitModel>>> getAll({String? search}) async {
    try {
      final queryParameters = <String, dynamic>{};
      
      if (search != null && search.trim().isNotEmpty) {
        queryParameters['search'] = search.trim();
      }
      
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getUnits,
        queryParameters: queryParameters.isNotEmpty ? queryParameters : null,
      );

      final apiResponse = ApiResponse<List<UnitModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => UnitModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get units: $e');
      rethrow;
    }
  }

  Future<ApiResponse<UnitModel>> update({
    required String id,
    required String name,
    required String description,
  }) async {
    try {
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateUnit(id),
        data: {
          'name': name,
          'description': description,
        },
      );

      final apiResponse = ApiResponse<UnitModel>.fromJson(
        response.data!,
        (json) => UnitModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update unit: $e');
      rethrow;
    }
  }

  Future<ApiResponse<UnitModel>> delete({
    required String id,
  }) async {
    try {
      final response = await ApiService.delete<Map<String, dynamic>>(
        ApiEndpoints.deleteUnit(id),
      );

      final apiResponse = ApiResponse<UnitModel>.fromJson(
        response.data!,
        (json) => UnitModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to delete unit: $e');
      rethrow;
    }
  }
}

