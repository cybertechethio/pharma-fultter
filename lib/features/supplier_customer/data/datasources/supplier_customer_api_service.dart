import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../core/services/upload_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/upload_response_model.dart';
import '../../../transaction/data/models/transaction_model.dart';
import '../models/supplier_customer_model.dart';
import '../models/supplier_customer_payment_request.dart';

class SupplierCustomerApiService {
  final UploadService _uploadService;

  const SupplierCustomerApiService({
    required UploadService uploadService,
  }) : _uploadService = uploadService;

  factory SupplierCustomerApiService.create() {
    return SupplierCustomerApiService(
      uploadService: UploadService.create(),
    );
  }

  Future<ApiResponse<SupplierCustomerModel>> create({
    required String name,
    required String phone,
    required String accountCode,
    required String tinNumber,
    required String type, // CUSTOMER | SUPPLIER
  }) async {
    try {
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createSupplierCustomer,
        data: {
          'name': name,
          'phone': phone,
          'accountCode': accountCode,
          'tinNumber': tinNumber,
          'type': type,
        },
      );

      final apiResponse = ApiResponse<SupplierCustomerModel>.fromJson(
        response.data!,
        (json) => SupplierCustomerModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create supplier/customer: $e');
      rethrow;
    }
  }

  /// Get all supplier/customers with optional search and type filter
  /// 
  /// [search] - Optional search query to filter by name, phone, account_code
  /// [type] - Optional type filter: 'customer' or 'supplier'
  Future<ApiResponse<List<SupplierCustomerModel>>> getAll({
    String? search,
    String? type,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (search != null && search.trim().isNotEmpty) {
        queryParameters['search'] = search.trim();
      }
      if (type != null && type.trim().isNotEmpty) {
        queryParameters['type'] = type.trim();
      }

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getSupplierCustomers,
        queryParameters: queryParameters.isNotEmpty ? queryParameters : null,
      );

      final apiResponse = ApiResponse<List<SupplierCustomerModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => SupplierCustomerModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get supplier/customers: $e');
      rethrow;
    }
  }

  Future<ApiResponse<SupplierCustomerModel>> update({
    required String id,
    required String name,
    required String phone,
    required String accountCode,
    required String tinNumber,
    required String type,
  }) async {
    try {
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateSupplierCustomer(id),
        data: {
          'name': name,
          'phone': phone,
          'accountCode': accountCode,
          'tinNumber': tinNumber,
          'type': type,
        },
      );

      final apiResponse = ApiResponse<SupplierCustomerModel>.fromJson(
        response.data!,
        (json) => SupplierCustomerModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update supplier/customer: $e');
      rethrow;
    }
  }

  Future<ApiResponse<SupplierCustomerModel>> delete({
    required String id,
  }) async {
    try {
      final response = await ApiService.delete<Map<String, dynamic>>(
        ApiEndpoints.deleteSupplierCustomer(id),
      );

      final apiResponse = ApiResponse<SupplierCustomerModel>.fromJson(
        response.data!,
        (json) => SupplierCustomerModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to delete supplier/customer: $e');
      rethrow;
    }
  }

  /// Get supplier/customer by ID
  Future<ApiResponse<SupplierCustomerModel>> getById({
    required String id,
  }) async {
    try {
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getSupplierCustomerById(id),
      );

      final apiResponse = ApiResponse<SupplierCustomerModel>.fromJson(
        response.data!,
        (json) => SupplierCustomerModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get supplier/customer by ID: $e');
      rethrow;
    }
  }

  /// Add balance payment for a customer
  Future<void> addBalance({
    required SupplierCustomerPaymentRequest request,
    required Map<String, String> paymentAttachmentFilePaths,
  }) async {
    try {
      // Step 1: Upload payment method attachment files
      Map<String, String> paymentAttachmentUrls = {};
      if (paymentAttachmentFilePaths.isNotEmpty) {
        LoggingService.auth('Uploading payment method attachment files', {
          'count': paymentAttachmentFilePaths.length,
        });

        for (var entry in paymentAttachmentFilePaths.entries) {
          final paymentMethodType = entry.key;
          final filePath = entry.value;

          final uploadResponse = await _uploadService.uploadFile(filePath);
          uploadResponse.when(
            success: (success, message, data, meta, pagination) {
              final url = data.when(
                single: (fileData) => fileData.url,
                multiple: (filesData) => filesData.files.isNotEmpty ? filesData.files.first.url : null,
              );
              if (url != null) {
                paymentAttachmentUrls[paymentMethodType] = url;
                LoggingService.auth('Payment method attachment uploaded', {
                  'method': paymentMethodType,
                  'url': url,
                });
              }
            },
            error: (success, error, meta) {
              LoggingService.warning('Failed to upload payment method attachment', {
                'method': paymentMethodType,
                'error': error.message,
              });
              // Continue with other uploads even if one fails
            },
          );
        }
      }

      // Step 2: Update payment methods with attachment URLs
      final updatedPaymentMethods = request.paymentMethods.map((pm) {
        final attachmentUrl = paymentAttachmentUrls[pm.method];
        return pm.copyWith(attachment: attachmentUrl);
      }).toList();

      final updatedRequest = request.copyWith(paymentMethods: updatedPaymentMethods);

      // Step 3: Build clean JSON
      var requestJson = updatedRequest.toJson();
      requestJson.removeWhere((_, v) => v == null);
      final paymentMethods = requestJson['paymentMethods'] as List;
      for (var pm in paymentMethods) {
        (pm as Map<String, dynamic>).removeWhere((_, v) => v == null);
      }

      // Step 4: Send request
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.addBalance,
        data: requestJson,
        skipWrapping: false,
      );

      LoggingService.apiResponse('POST', ApiEndpoints.addBalance, response.statusCode ?? 0, response.data);
    } catch (e) {
      LoggingService.error('Failed to add balance: $e');
      rethrow;
    }
  }

  /// Create refund payment for a reversed transaction
  Future<void> refund({
    required SupplierCustomerPaymentRequest request,
    required Map<String, String> paymentAttachmentFilePaths,
  }) async {
    try {
      // Step 1: Upload payment method attachment files
      Map<String, String> paymentAttachmentUrls = {};
      if (paymentAttachmentFilePaths.isNotEmpty) {
        LoggingService.auth('Uploading payment method attachment files', {
          'count': paymentAttachmentFilePaths.length,
        });

        for (var entry in paymentAttachmentFilePaths.entries) {
          final paymentMethodType = entry.key;
          final filePath = entry.value;

          final uploadResponse = await _uploadService.uploadFile(filePath);
          uploadResponse.when(
            success: (success, message, data, meta, pagination) {
              final url = data.when(
                single: (fileData) => fileData.url,
                multiple: (filesData) => filesData.files.isNotEmpty ? filesData.files.first.url : null,
              );
              if (url != null) {
                paymentAttachmentUrls[paymentMethodType] = url;
                LoggingService.auth('Payment method attachment uploaded', {
                  'method': paymentMethodType,
                  'url': url,
                });
              }
            },
            error: (success, error, meta) {
              LoggingService.warning('Failed to upload payment method attachment', {
                'method': paymentMethodType,
                'error': error.message,
              });
              // Continue with other uploads even if one fails
            },
          );
        }
      }

      // Step 2: Update payment methods with attachment URLs
      final updatedPaymentMethods = request.paymentMethods.map((pm) {
        final attachmentUrl = paymentAttachmentUrls[pm.method];
        return pm.copyWith(attachment: attachmentUrl);
      }).toList();

      final updatedRequest = request.copyWith(paymentMethods: updatedPaymentMethods);

      // Step 3: Build clean JSON
      var requestJson = updatedRequest.toJson();
      requestJson.removeWhere((_, v) => v == null);
      final paymentMethods = requestJson['paymentMethods'] as List;
      for (var pm in paymentMethods) {
        (pm as Map<String, dynamic>).removeWhere((_, v) => v == null);
      }

      // Step 4: Send request
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.refundPayment,
        data: requestJson,
        skipWrapping: false,
      );

      LoggingService.apiResponse('POST', ApiEndpoints.refundPayment, response.statusCode ?? 0, response.data);
    } catch (e) {
      LoggingService.error('Failed to create refund: $e');
      rethrow;
    }
  }

  /// Get transactions for a supplier/customer
  Future<ApiResponse<List<TransactionModel>>> getTransactions({
    required String supplierCustomerId,
  }) async {
    try {
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getSupplierCustomerTransactions(supplierCustomerId),
      );

      final apiResponse = ApiResponse<List<TransactionModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => TransactionModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get supplier/customer transactions: $e');
      rethrow;
    }
  }
}
