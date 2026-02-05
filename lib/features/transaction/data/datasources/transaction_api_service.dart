import 'package:cyber_pos/core/enums/transaction_type_enum.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../core/services/upload_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/upload_response_model.dart';
import '../models/create_trans_request.dart';
import '../models/payment_method_model.dart';
import '../models/transaction_model.dart';

class TransactionApiService {
  final UploadService _uploadService;

  const TransactionApiService({
    required UploadService uploadService,
  }) : _uploadService = uploadService;

  factory TransactionApiService.create() {
    return TransactionApiService(
      uploadService: UploadService.create(),
    );
  }

  /// Get all transactions with pagination
  /// 
  /// [page] - Page number (default: 1)
  /// [limit] - Items per page (default: 25)
  /// [transactionType] - Optional filter by transaction type
  Future<ApiResponse<List<TransactionModel>>> getAll({
    int page = 1,
    int limit = 25,
    TransactionType? transactionType,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
      };
      
      if (transactionType != null) {
        queryParams['transactionType'] = transactionType.name;
      }
      
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getTransactions,
        queryParameters: queryParams,
      );

      final apiResponse = ApiResponse<List<TransactionModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => TransactionModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get transactions: $e');
      rethrow;
    }
  }

  Future<ApiResponse<TransactionModel>> getById(int id) async {
    try {
      final endpoint = ApiEndpoints.getTransactionDetail(id);
      final response = await ApiService.get<Map<String, dynamic>>(endpoint);

      final apiResponse = ApiResponse<TransactionModel>.fromJson(
        response.data!,
        (json) => TransactionModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get transaction detail: $e');
      rethrow;
    }
  }

  Future<ApiResponse<TransactionModel>> create({
    required CreateTransRequest request,
    required List<String> receiptFilePaths,
    required Map<String, String> paymentAttachmentFilePaths,
  }) async {
    try {

      // Step 1: Upload receipt files (transaction attachments)
      List<String> attachmentUrls = [];
      if (receiptFilePaths.isNotEmpty) {
        LoggingService.auth('Uploading transaction receipt files', {
          'count': receiptFilePaths.length,
        });
        
        final uploadResponse = await _uploadService.uploadFiles(receiptFilePaths);
        uploadResponse.when(
          success: (success, message, data, meta, pagination) {
            // Extract URLs from upload response
            attachmentUrls = data.when(
              single: (fileData) => [fileData.url],
              multiple: (filesData) => filesData.files.map((f) => f.url).toList(),
            );
            LoggingService.auth('Transaction receipts uploaded successfully', {
              'count': attachmentUrls.length,
              'urls': attachmentUrls,
            });
          },
          error: (success, error, meta) {
            throw Exception('Failed to upload receipt files: ${error.message}');
          },
        );
      }

      // Step 2: Upload payment method attachment files
      Map<String, String> paymentAttachmentUrls = {};
      if (paymentAttachmentFilePaths.isNotEmpty) {
        LoggingService.auth('Uploading payment method attachment files', {
          'count': paymentAttachmentFilePaths.length,
        });

        // Upload each payment method attachment file
        for (var entry in paymentAttachmentFilePaths.entries) {
          final paymentMethodType = entry.key; // e.g., "bank_transfer"
          final filePath = entry.value;

          final uploadResponse = await _uploadService.uploadFile(filePath);
          uploadResponse.when(
            success: (success, message, data, meta, pagination) {
              // Extract URL from upload response
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

      // Step 3: Build transaction model with uploaded URLs
      // Update payment methods with attachment URLs
      List<PaymentMethodModel>? updatedPaymentMethods;
      if (request.paymentMethods != null && request.paymentMethods!.isNotEmpty) {
        updatedPaymentMethods = request.paymentMethods!.map((pm) {
          // Find matching attachment URL by payment method type
          // PaymentMethodType has toApiString() extension method
          final methodType = pm.method; // Convert enum to API string
          final attachmentUrl = paymentAttachmentUrls[methodType];
          
          // Use copyWith to update attachment field
          return pm.copyWith(
            attachment: attachmentUrl,
          );
        }).toList();
      }

      // Create updated request with URLs
      final updatedRequest = request.copyWith(
        attachments: attachmentUrls.isNotEmpty ? attachmentUrls : [],
        paymentMethods: updatedPaymentMethods,
      );

      // Step 4: Send transaction as JSON (not FormData)
      var requestJson = updatedRequest.toJson();
      // Remove null/empty fields
      if (requestJson['attachments'] == null || 
          (requestJson['attachments'] as List).isEmpty) {
        requestJson.remove('attachments');
      }
      if (requestJson['paymentMethods'] == null || 
          (requestJson['paymentMethods'] as List).isEmpty) {
        requestJson.remove('paymentMethods');
      } else {
        // Remove attachment field from payment methods if null
        final paymentMethods = requestJson['paymentMethods'] as List;
        for (var i = 0; i < paymentMethods.length; i++) {
          final pm = paymentMethods[i] as Map<String, dynamic>;
          if (pm['attachment'] == null) {
            pm.remove('attachment');
          }
        }
      }


      // ApiService.post will automatically wrap with RequestWrapper
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createTransaction,
        data: requestJson,
        skipWrapping: false, // Let ApiService wrap it
      );

      LoggingService.apiResponse(
        'POST',
        ApiEndpoints.createTransaction,
        response.statusCode ?? 0,
        response.data,
      );

      final apiResponse = ApiResponse<TransactionModel>.fromJson(
        response.data!,
        (json) => TransactionModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create transaction: $e');
      rethrow;
    }
  }

  /// Reverse a transaction (sale or purchase)
  /// 
  /// Creates a reversal transaction for the specified transaction ID
  /// [transactionType] - The reversal type (purchase_reverse or sale_reverse)
  /// [reversesTransactionId] - The ID of the transaction to reverse
  /// [notes] - Optional note for the reversal
  Future<ApiResponse<TransactionModel>> reverseTransaction({
    required TransactionType transactionType,
    required int reversesTransactionId,
    String? notes,
  }) async {
    try {

      final requestJson = <String, dynamic>{
        'transactionType': transactionType.name,
        'reversesTransactionId': reversesTransactionId,
      };

      // Only add notes if provided and not empty
      if (notes != null && notes.isNotEmpty) {
        requestJson['notes'] = notes;
      }

      // ApiService.post will automatically wrap with RequestWrapper
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createTransaction,
        data: requestJson,
        skipWrapping: false,
      );

      LoggingService.apiResponse(
        'POST',
        ApiEndpoints.createTransaction,
        response.statusCode ?? 0,
        response.data,
      );

      final apiResponse = ApiResponse<TransactionModel>.fromJson(
        response.data!,
        (json) => TransactionModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to reverse transaction: $e');
      rethrow;
    }
  }
}

