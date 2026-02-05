import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/enums/stock_status_enum.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/stock_model.dart';

class StockApiService {
  const StockApiService();

  factory StockApiService.create() {
    return const StockApiService();
  }

  /// Get all stocks with pagination
  /// 
  /// [page] - Page number (default: 1)
  /// [limit] - Items per page (default: 25)
  /// [search] - Search query (optional)
  Future<ApiResponse<List<StockModel>>> getAll({
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
        ApiEndpoints.getStocks,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<List<StockModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => StockModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get stocks: $e');
      rethrow;
    }
  }

  /// Update stock by ID
  /// 
  /// [id] - Stock ID to update
  /// [lowStockThreshold] - Optional new threshold value
  /// [location] - Optional new location value
  /// [lowStockStatus] - Optional new status (new, critical, ignored)
  Future<ApiResponse<StockModel>> update({
    required int id,
    String? lowStockThreshold,
    String? location,
    StockStatus? lowStockStatus,
  }) async {
    try {
      final data = <String, dynamic>{};
      
      if (lowStockThreshold != null) {
        // Parse to int if it's a number, otherwise keep as string
        final parsed = int.tryParse(lowStockThreshold);
        data['lowStockThreshold'] = parsed ?? lowStockThreshold;
      }
      if (location != null) {
        data['location'] = location;
      }
      if (lowStockStatus != null) {
        data['lowStockStatus'] = lowStockStatus == StockStatus.newStatus 
            ? 'new' 
            : lowStockStatus.name;
      }
      
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateStock(id),
        data: data,
      );

      final apiResponse = ApiResponse<StockModel>.fromJson(
        response.data!,
        (json) => StockModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update stock: $e');
      rethrow;
    }
  }
}

