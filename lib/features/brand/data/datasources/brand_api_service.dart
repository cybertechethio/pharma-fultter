import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/brand_model.dart';

class BrandApiService {
  const BrandApiService();

  factory BrandApiService.create() {
    return const BrandApiService();
  }

  Future<ApiResponse<BrandModel>> create({
    required String name,
    required String description,
  }) async {
    try {
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createBrand,
        data: {
          'name': name,
          'description': description,
        },
      );

      final apiResponse = ApiResponse<BrandModel>.fromJson(
        response.data!,
        (json) => BrandModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create brand: $e');
      rethrow;
    }
  }

  /// Get all brands with optional search
  /// 
  /// [search] - Optional search query to filter by name
  Future<ApiResponse<List<BrandModel>>> getAll({
    String? search,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (search != null && search.trim().isNotEmpty) {
        queryParameters['search'] = search.trim();
      }

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getBrands,
        queryParameters: queryParameters.isNotEmpty ? queryParameters : null,
      );

      final apiResponse = ApiResponse<List<BrandModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => BrandModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get brands: $e');
      rethrow;
    }
  }

  Future<ApiResponse<BrandModel>> update({
    required String id,
    required String name,
    required String description,
  }) async {
    try {
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateBrand(id),
        data: {
          'name': name,
          'description': description,
        },
      );

      final apiResponse = ApiResponse<BrandModel>.fromJson(
        response.data!,
        (json) => BrandModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update brand: $e');
      rethrow;
    }
  }

  Future<ApiResponse<BrandModel>> delete({
    required String id,
  }) async {
    try {
      final response = await ApiService.delete<Map<String, dynamic>>(
        ApiEndpoints.deleteBrand(id),
      );

      final apiResponse = ApiResponse<BrandModel>.fromJson(
        response.data!,
        (json) => BrandModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to delete brand: $e');
      rethrow;
    }
  }
}

