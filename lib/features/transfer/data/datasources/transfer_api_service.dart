import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/transfer_model.dart';
import '../models/transfer_response_model.dart';

class TransferApiService {
  const TransferApiService();

  factory TransferApiService.create() {
    return const TransferApiService();
  }

  /// Get all transfers with pagination
  Future<ApiResponse<List<TransferResponseModel>>> getAll({
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

      final apiResponse = ApiResponse<List<TransferResponseModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => TransferResponseModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get transfers: $e');
      rethrow;
    }
  }

  /// Get transfer detail by ID
  Future<ApiResponse<TransferResponseModel>> getById(int id) async {
    try {
      final endpoint = ApiEndpoints.getTransferDetail(id);
      final response = await ApiService.get<Map<String, dynamic>>(endpoint);

      final apiResponse = ApiResponse<TransferResponseModel>.fromJson(
        response.data!,
        (json) => TransferResponseModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get transfer detail: $e');
      rethrow;
    }
  }

  /// Create a new transfer (always transfer_out)
  Future<ApiResponse<TransferResponseModel>> create({
    required TransferModel request,
  }) async {
    try {
      LoggingService.apiRequest('POST', ApiEndpoints.createTransfer, {
        'destinationBranchId': request.destinationBranchId,
        'itemsCount': request.items.length,
      });

      // Build request JSON with transferType hardcoded as transfer_out
      var requestJson = request.toJson();
      requestJson['transferType'] = 'transfer_out';
      
      // Remove null fields
      requestJson.removeWhere((key, value) => value == null);

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

      final apiResponse = ApiResponse<TransferResponseModel>.fromJson(
        response.data!,
        (json) => TransferResponseModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create transfer: $e');
      rethrow;
    }
  }
}













