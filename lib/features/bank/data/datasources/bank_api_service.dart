import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/bank_model.dart';

class BankApiService {
  const BankApiService();

  factory BankApiService.create() {
    return const BankApiService();
  }

  Future<ApiResponse<BankModel>> create({
    required String name,
  }) async {
    try {
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createBank,
        data: {
          'name': name,
        },
      );

      final apiResponse = ApiResponse<BankModel>.fromJson(
        response.data!,
        (json) => BankModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create bank: $e');
      rethrow;
    }
  }

  /// Get all banks with optional search
  /// 
  /// [search] - Optional search query to filter by name
  Future<ApiResponse<List<BankModel>>> getAll({
    String? search,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (search != null && search.trim().isNotEmpty) {
        queryParameters['search'] = search.trim();
      }

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getBanks,
        queryParameters: queryParameters.isNotEmpty ? queryParameters : null,
      );

      final apiResponse = ApiResponse<List<BankModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => BankModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get banks: $e');
      rethrow;
    }
  }

  Future<ApiResponse<BankModel>> update({
    required int id,
    required String name,
  }) async {
    try {
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateBank(id),
        data: {
          'name': name,
        },
      );

      final apiResponse = ApiResponse<BankModel>.fromJson(
        response.data!,
        (json) => BankModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update bank: $e');
      rethrow;
    }
  }

  Future<ApiResponse<BankModel>> delete({
    required int id,
  }) async {
    try {
      final response = await ApiService.delete<Map<String, dynamic>>(
        ApiEndpoints.deleteBank(id),
      );

      final apiResponse = ApiResponse<BankModel>.fromJson(
        response.data!,
        (json) => BankModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to delete bank: $e');
      rethrow;
    }
  }
}

