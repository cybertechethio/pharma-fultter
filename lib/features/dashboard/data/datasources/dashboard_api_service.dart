import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/dashboard_model.dart';

class DashboardApiService {
  const DashboardApiService();

  factory DashboardApiService.create() {
    return const DashboardApiService();
  }

  /// Get dashboard data
  /// 
  /// [startDate] - Start date in ISO string format (e.g., "2024-01-01T00:00:00.000Z")
  /// [endDate] - End date in ISO string format (e.g., "2024-01-31T23:59:59.999Z")
  Future<ApiResponse<DashboardModel>> getDashboard({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
      };

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getDashboard,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<DashboardModel>.fromJson(
        response.data!,
        (json) => DashboardModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get dashboard: $e');
      rethrow;
    }
  }
}

