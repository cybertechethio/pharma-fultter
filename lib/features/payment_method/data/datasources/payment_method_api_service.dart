import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../core/services/upload_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/upload_response_model.dart';
import '../../../transaction/data/models/payment_method_model.dart';
import '../models/payment_method_request.dart';

class PaymentMethodApiService {
  final UploadService _uploadService;

  const PaymentMethodApiService({
    required UploadService uploadService,
  }) : _uploadService = uploadService;

  factory PaymentMethodApiService.create() {
    return PaymentMethodApiService(
      uploadService: UploadService.create(),
    );
  }

  /// Create payment method(s) for a payment
  /// Returns list of created payment methods
  Future<ApiResponse<List<PaymentMethodModel>>> create({
    required int paymentId,
    required PaymentMethodRequest request,
    String? attachmentFilePath,
  }) async {
    try {
      // Step 1: Upload attachment file if provided
      String? attachmentUrl;
      if (attachmentFilePath != null && attachmentFilePath.isNotEmpty) {
        LoggingService.auth('Uploading payment method attachment file', {
          'file': attachmentFilePath,
        });

        final uploadResponse = await _uploadService.uploadFile(attachmentFilePath);
        uploadResponse.when(
          success: (success, message, data, meta, pagination) {
            // Extract URL from upload response
            attachmentUrl = data.when(
              single: (fileData) => fileData.url,
              multiple: (filesData) => filesData.files.isNotEmpty ? filesData.files.first.url : null,
            );
            if (attachmentUrl != null) {
              LoggingService.auth('Payment method attachment uploaded successfully', {
                'url': attachmentUrl,
              });
            }
          },
          error: (success, error, meta) {
            throw Exception('Failed to upload attachment file: ${error.message}');
          },
        );
      }

      // Step 2: Build request with uploaded URL
      final requestWithAttachment = PaymentMethodRequest(
        method: request.method,
        amount: request.amount,
        bankId: request.bankId,
        referenceNumber: request.referenceNumber,
        attachment: attachmentUrl,
      );

      // Step 3: Convert to API JSON (array format as per API docs)
      final json = requestWithAttachment.toJson();
      json.removeWhere((key, value) => value == null);
      final requestData = [json];

      // Step 4: Send request
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createPaymentMethod(paymentId),
        data: requestData,
        skipWrapping: false,
      );

      LoggingService.apiResponse(
        'POST',
        ApiEndpoints.createPaymentMethod(paymentId),
        response.statusCode ?? 0,
        response.data,
      );

      // API returns array of payment methods
      final apiResponse = ApiResponse<List<PaymentMethodModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => PaymentMethodModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create payment method: $e');
      rethrow;
    }
  }

  /// Update payment method for a payment
  Future<ApiResponse<PaymentMethodModel>> update({
    required int paymentId,
    required int methodId,
    required PaymentMethodRequest request,
    String? attachmentFilePath,
  }) async {
    try {
      // Step 1: Upload attachment file if provided
      String? attachmentUrl;
      if (attachmentFilePath != null && attachmentFilePath.isNotEmpty) {
        LoggingService.auth('Uploading payment method attachment file', {
          'file': attachmentFilePath,
        });

        final uploadResponse = await _uploadService.uploadFile(attachmentFilePath);
        uploadResponse.when(
          success: (success, message, data, meta, pagination) {
            // Extract URL from upload response
            attachmentUrl = data.when(
              single: (fileData) => fileData.url,
              multiple: (filesData) => filesData.files.isNotEmpty ? filesData.files.first.url : null,
            );
            if (attachmentUrl != null) {
              LoggingService.auth('Payment method attachment uploaded successfully', {
                'url': attachmentUrl,
              });
            }
          },
          error: (success, error, meta) {
            throw Exception('Failed to upload attachment file: ${error.message}');
          },
        );
      }

      // Step 2: Build request with uploaded URL (if new file uploaded)
      final requestWithAttachment = attachmentUrl != null
          ? PaymentMethodRequest(
              method: request.method,
              amount: request.amount,
              bankId: request.bankId,
              referenceNumber: request.referenceNumber,
              attachment: attachmentUrl,
            )
          : request;

      // Step 3: Convert to API JSON
      final json = requestWithAttachment.toJson();
      json.removeWhere((key, value) => value == null);
      final requestData = json;

      // Step 4: Send request
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updatePaymentMethod(paymentId, methodId),
        data: requestData,
        skipWrapping: false,
      );

      LoggingService.apiResponse(
        'PUT',
        ApiEndpoints.updatePaymentMethod(paymentId, methodId),
        response.statusCode ?? 0,
        response.data,
        
      );

      // API returns single payment method object
      final apiResponse = ApiResponse<PaymentMethodModel>.fromJson(
        response.data!,
        (json) => PaymentMethodModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update payment method: $e');
      rethrow;
    }
  }

  /// Delete payment method for a payment
  Future<void> delete({
    required int paymentId,
    required int methodId,
  }) async {
    try {
      final response = await ApiService.delete<void>(
        ApiEndpoints.deletePaymentMethod(paymentId, methodId),
      );

      LoggingService.apiResponse(
        'DELETE',
        ApiEndpoints.deletePaymentMethod(paymentId, methodId),
        response.statusCode ?? 0,
        null,
        
      );

    } catch (e) {
      LoggingService.error('Failed to delete payment method: $e');
      rethrow;
    }
  }
}

