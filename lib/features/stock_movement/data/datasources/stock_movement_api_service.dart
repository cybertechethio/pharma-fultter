import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/stock_movement_model.dart';

class StockMovementApiService {
  const StockMovementApiService();

  factory StockMovementApiService.create() {
    return const StockMovementApiService();
  }

  /// Get stock movements with pagination
  ///
  /// [itemId] - Item ID (required)
  /// [page] - Page number (default: 1)
  /// [limit] - Items per page (default: 25)
  Future<ApiResponse<List<StockMovementModel>>> getAll({
    required int itemId,
    int page = 1,
    int limit = 500,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'itemId': itemId,
        'page': page,
        'limit': limit,
      };

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.stockMovements,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<List<StockMovementModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => StockMovementModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get stock movements: $e');
      rethrow;
    }
  }
}
