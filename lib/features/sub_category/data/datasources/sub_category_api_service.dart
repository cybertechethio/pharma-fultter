import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/sub_category_model.dart';

class SubCategoryApiService {
  const SubCategoryApiService();

  factory SubCategoryApiService.create() {
    return const SubCategoryApiService();
  }

  Future<ApiResponse<SubCategoryModel>> create({
    required String name,
    required int categoryId,
    required String description,
  }) async {
    try {
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createSubCategory,
        data: {
          'name': name,
          'categoryId': categoryId,
          'description': description,
        },
      );

      final apiResponse = ApiResponse<SubCategoryModel>.fromJson(
        response.data!,
        (json) => SubCategoryModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create sub-category: $e');
      rethrow;
    }
  }

  /// Get all sub-categories with pagination and optional search
  /// 
  /// [page] - Page number (default: 1)
  /// [limit] - Items per page (default: 25)
  /// [search] - Optional search query to filter by name
  Future<ApiResponse<List<SubCategoryModel>>> getAll({
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
        ApiEndpoints.getSubCategories,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<List<SubCategoryModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => SubCategoryModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get sub-categories: $e');
      rethrow;
    }
  }

  /// Get sub-categories by category with pagination and optional search
  /// 
  /// [categoryId] - Category ID to filter by
  /// [page] - Page number (default: 1)
  /// [limit] - Items per page (default: 25)
  /// [search] - Optional search query to filter by name
  Future<ApiResponse<List<SubCategoryModel>>> getByCategory({
    required String categoryId,
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'categoryId': categoryId,
        'page': page,
        'limit': limit,
      };
      if (search != null && search.trim().isNotEmpty) {
        queryParameters['search'] = search.trim();
      }

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getSubCategories,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<List<SubCategoryModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => SubCategoryModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get sub-categories by category: $e');
      rethrow;
    }
  }

  Future<ApiResponse<SubCategoryModel>> update({
    required String id,
    required String name,
    required int categoryId,
    required String description,
  }) async {
    try {
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateSubCategory(id),
        data: {
          'name': name,
          'categoryId': categoryId,
          'description': description,
        },
      );

      final apiResponse = ApiResponse<SubCategoryModel>.fromJson(
        response.data!,
        (json) => SubCategoryModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update sub-category: $e');
      rethrow;
    }
  }

  Future<ApiResponse<SubCategoryModel>> delete({
    required String id,
  }) async {
    try {
      final response = await ApiService.delete<Map<String, dynamic>>(
        ApiEndpoints.deleteSubCategory(id),
      );

      final apiResponse = ApiResponse<SubCategoryModel>.fromJson(
        response.data!,
        (json) => SubCategoryModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to delete sub-category: $e');
      rethrow;
    }
  }
}

