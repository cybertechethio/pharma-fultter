import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/item_model.dart';
import '../models/item_request_model.dart';

class ItemApiService {
  const ItemApiService();

  factory ItemApiService.create() {
    return const ItemApiService();
  }

  Future<ApiResponse<ItemModel>> create(ItemRequestModel request) async {
    try {
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createItem,
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<ItemModel>.fromJson(
        response.data!,
        (json) => ItemModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create item: $e');
      rethrow;
    }
  }

  /// Get all items with pagination
  /// 
  /// [page] - Page number (default: 1)
  /// [limit] - Items per page (default: 25)
  /// [search] - Search query (optional)
  /// [categoryId] - Category ID filter (optional)
  Future<ApiResponse<List<ItemModel>>> getAll({
    int page = 1,
    int limit = 25,
    String? search,
    int? categoryId,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'page': page,
        'limit': limit,
      };
      
      if (search != null && search.trim().isNotEmpty) {
        queryParameters['search'] = search.trim();
      }
      
      if (categoryId != null) {
        queryParameters['categoryId'] = categoryId;
      }
      
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getItems,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<List<ItemModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => ItemModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get items: $e');
      rethrow;
    }
  }

  Future<ApiResponse<ItemModel>> update({
    required int id,
    required ItemRequestModel request,
  }) async {
    try {
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateItem(id),
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<ItemModel>.fromJson(
        response.data!,
        (json) => ItemModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update item: $e');
      rethrow;
    }
  }

  Future<ApiResponse<ItemModel>> delete({
    required int id,
  }) async {
    try {
      final response = await ApiService.delete<Map<String, dynamic>>(
        ApiEndpoints.deleteItem(id),
      );

      final apiResponse = ApiResponse<ItemModel>.fromJson(
        response.data!,
        (json) => ItemModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to delete item: $e');
      rethrow;
    }
  }
}

