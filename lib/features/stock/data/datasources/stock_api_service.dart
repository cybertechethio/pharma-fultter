import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
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
}

