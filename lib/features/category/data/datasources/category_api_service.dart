import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/category_model.dart';

class CategoryApiService {
  const CategoryApiService();

  factory CategoryApiService.create() {
    return const CategoryApiService();
  }

  Future<ApiResponse<CategoryModel>> create({
    required String name,
    required String description,
  }) async {
    try {
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createCategory,
        data: {
          'name': name,
          'description': description,
        },
      );

      final apiResponse = ApiResponse<CategoryModel>.fromJson(
        response.data!,
        (json) => CategoryModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create category: $e');
      rethrow;
    }
  }

  /// Get all categories with pagination and optional search
  /// 
  /// [page] - Page number (default: 1)
  /// [limit] - Items per page (default: 25)
  /// [search] - Optional search query to filter by name
  Future<ApiResponse<List<CategoryModel>>> getAll({
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
        ApiEndpoints.getCategories,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<List<CategoryModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get categories: $e');
      rethrow;
    }
  }

  Future<ApiResponse<CategoryModel>> update({
    required String id,
    required String name,
    required String description,
  }) async {
    try {
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateCategory(id),
        data: {
          'name': name,
          'description': description,
        },
      );

      final apiResponse = ApiResponse<CategoryModel>.fromJson(
        response.data!,
        (json) => CategoryModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update category: $e');
      rethrow;
    }
  }

  Future<ApiResponse<CategoryModel>> delete({
    required String id,
  }) async {
    try {
      final response = await ApiService.delete<Map<String, dynamic>>(
        ApiEndpoints.deleteCategory(id),
      );

      final apiResponse = ApiResponse<CategoryModel>.fromJson(
        response.data!,
        (json) => CategoryModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to delete category: $e');
      rethrow;
    }
  }
}

