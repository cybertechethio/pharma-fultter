import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/create_transfer_request.dart';
import '../models/transfer_model.dart';

class TransferApiService {
  const TransferApiService();

  factory TransferApiService.create() {
    return const TransferApiService();
  }

  /// Get all transfers with pagination
  /// 
  /// [page] - Page number (default: 1)
  /// [limit] - Items per page (default: 25)
  Future<ApiResponse<List<TransferModel>>> getAll({
    int page = 1,
    int limit = 25,
  }) async {
    try {
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getTransfers,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      final apiResponse = ApiResponse<List<TransferModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => TransferModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get transfers: $e');
      rethrow;
    }
  }

  Future<ApiResponse<TransferModel>> getById(int id) async {
    try {
      final endpoint = ApiEndpoints.getTransferDetail(id);
      final response = await ApiService.get<Map<String, dynamic>>(endpoint);

      final apiResponse = ApiResponse<TransferModel>.fromJson(
        response.data!,
        (json) => TransferModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get transfer detail: $e');
      rethrow;
    }
  }

  Future<ApiResponse<TransferModel>> create({
    required CreateTransferRequest request,
  }) async {
    try {
      var requestJson = request.toJson();
      
      // Manually set transferType to "transfer_out" string
      requestJson['transferType'] = 'transfer_out';

      // ApiService.post will automatically wrap with RequestWrapper
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createTransfer,
        data: requestJson,
        skipWrapping: false,
      );

      LoggingService.apiResponse(
        'POST',
        ApiEndpoints.createTransfer,
        response.statusCode ?? 0,
        response.data,
      );

      final apiResponse = ApiResponse<TransferModel>.fromJson(
        response.data!,
        (json) => TransferModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create transfer: $e');
      rethrow;
    }
  }

  Future<ApiResponse<TransferModel>> updateStatus({
    required int id,
    required String status,
  }) async {
    try {
      final endpoint = ApiEndpoints.updateTransferStatus(id);
      var requestJson = {'status': status};

      // ApiService.put will automatically wrap with RequestWrapper
      final response = await ApiService.put<Map<String, dynamic>>(
        endpoint,
        data: requestJson,
        skipWrapping: false,
      );

      LoggingService.apiResponse(
        'PUT',
        endpoint,
        response.statusCode ?? 0,
        response.data,
      );

      final apiResponse = ApiResponse<TransferModel>.fromJson(
        response.data!,
        (json) => TransferModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update transfer status: $e');
      rethrow;
    }
  }
}