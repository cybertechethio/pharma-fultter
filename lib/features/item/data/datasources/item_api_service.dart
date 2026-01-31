import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/item_model.dart';

class ItemApiService {
  const ItemApiService();

  factory ItemApiService.create() {
    return const ItemApiService();
  }

  Future<ApiResponse<ItemModel>> create({
    required String name,
    required String description,
    required String sku,
    required String code,
    required String barcode,
    required String color,
    required String size,
    required String material,
    required double weight,
    required bool isTaxable,
    required int taxRate,
    required bool isActive,
    String? imageUrl,
    int? categoryId,
    int? subCategoryId,
    int? brandId,
    int? unitId,
    int? modelId,
  }) async {
    try {
      final data = <String, dynamic>{
        'name': name,
        'description': description,
        'sku': sku,
        'code': code,
        'barcode': barcode,
        'color': color,
        'size': size,
        'material': material,
        'weight': weight,
        'isTaxable': isTaxable,
        'taxRate': taxRate,
        'isActive': isActive,
      };

      if (imageUrl != null) data['imageUrl'] = imageUrl;
      if (categoryId != null) data['categoryId'] = categoryId;
      if (subCategoryId != null) data['subCategoryId'] = subCategoryId;
      if (brandId != null) data['brandId'] = brandId;
      if (unitId != null) data['unitId'] = unitId;
      if (modelId != null) data['modelId'] = modelId;

      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createItem,
        data: data,
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
    required String id,
    required String name,
    required String description,
    required String sku,
    required String code,
    required String barcode,
    required String color,
    required String size,
    required String material,
    required double weight,
    required bool isTaxable,
    required int taxRate,
    required bool isActive,
    String? imageUrl,
    int? categoryId,
    int? subCategoryId,
    int? brandId,
    int? unitId,
    int? modelId,
  }) async {
    try {
      final data = <String, dynamic>{
        'name': name,
        'description': description,
        'sku': sku,
        'code': code,
        'barcode': barcode,
        'color': color,
        'size': size,
        'material': material,
        'weight': weight,
        'isTaxable': isTaxable,
        'taxRate': taxRate,
        'isActive': isActive,
      };

      if (imageUrl != null) data['imageUrl'] = imageUrl;
      if (categoryId != null) data['categoryId'] = categoryId;
      if (subCategoryId != null) data['subCategoryId'] = subCategoryId;
      if (brandId != null) data['brandId'] = brandId;
      if (unitId != null) data['unitId'] = unitId;
      if (modelId != null) data['modelId'] = modelId;

      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateItem(id),
        data: data,
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
    required String id,
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

