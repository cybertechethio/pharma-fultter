import 'package:cyber_pos/shared/models/upload_response_model.dart';

import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../core/services/upload_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/expense_model.dart';
import '../models/expense_detail_model.dart';

class ExpenseApiService {
  final UploadService _uploadService;

  const ExpenseApiService({
    required UploadService uploadService,
  }) : _uploadService = uploadService;

  factory ExpenseApiService.create() {
    return ExpenseApiService(
      uploadService: UploadService.create(),
    );
  }

  Future<ApiResponse<ExpenseModel>> create({
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentFilePaths,
    required List<Map<String, dynamic>> paymentMethods,
  }) async {
    try {
      // Step 1: Upload attachment files if any
      List<String> attachmentUrls = [];
      if (attachmentFilePaths != null && attachmentFilePaths.isNotEmpty) {
        LoggingService.auth('Uploading expense attachment files', {
          'count': attachmentFilePaths.length,
        });

        final uploadResponse = await _uploadService.uploadFiles(attachmentFilePaths);
        uploadResponse.when(
          success: (success, message, data, meta, pagination) {
            // Extract URLs from upload response
            attachmentUrls = data.when(
              single: (fileData) => [fileData.url],
              multiple: (filesData) => filesData.files.map((f) => f.url).toList(),
            );
            LoggingService.auth('Expense attachments uploaded successfully', {
              'count': attachmentUrls.length,
              'urls': attachmentUrls,
            });
          },
          error: (success, error, meta) {
            throw Exception('Failed to upload attachment files: ${error.message}');
          },
        );
      }

      // Step 2: Upload each payment method's attachment file (if file path) and get URLs
      final List<Map<String, dynamic>> paymentMethodsWithUrls = [];
      for (final pm in paymentMethods) {
        final attachment = pm['attachment'];
        String? attachmentUrl;
        if (attachment != null && attachment is String && attachment.isNotEmpty) {
          final isFilePath = !attachment.startsWith('http://') &&
              !attachment.startsWith('https://') &&
              !attachment.startsWith('/');
          if (isFilePath) {
            LoggingService.auth('Uploading payment method attachment file', {
              'file': attachment,
            });
            final uploadResponse = await _uploadService.uploadFile(attachment);
            uploadResponse.when(
              success: (success, message, data, meta, pagination) {
                attachmentUrl = data.when(
                  single: (fileData) => fileData.url,
                  multiple: (filesData) =>
                      filesData.files.isNotEmpty ? filesData.files.first.url : null,
                );
                if (attachmentUrl != null) {
                  LoggingService.auth(
                    'Payment method attachment uploaded successfully',
                    {'url': attachmentUrl},
                  );
                }
              },
              error: (success, error, meta) {
                throw Exception(
                  'Failed to upload payment method attachment: ${error.message}',
                );
              },
            );
          } else {
            attachmentUrl = attachment;
          }
        }
        final pmData = Map<String, dynamic>.from(pm);
        pmData['attachment'] = attachmentUrl;
        paymentMethodsWithUrls.add(pmData);
      }

      // Step 3: Create expense with uploaded URLs
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createExpense,
        data: {
          'expenseDate': expenseDate.toIso8601String(),
          'name': name,
          'notes': notes,
          'attachments': attachmentUrls,
          'paymentMethods': paymentMethodsWithUrls,
        },
      );

      final apiResponse = ApiResponse<ExpenseModel>.fromJson(
        response.data!,
        (json) => ExpenseModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create expense: $e');
      rethrow;
    }
  }

  Future<ApiResponse<List<ExpenseModel>>> getAll({
    int page = 1,
    int limit = 25,
    DateTime? fromDate,
    DateTime? toDate,
    String? search,
    int? branchId,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'page': page,
        'limit': limit,
      };

      if (fromDate != null) queryParameters['fromDate'] = fromDate.toIso8601String();
      if (toDate != null) queryParameters['toDate'] = toDate.toIso8601String();
      if (search != null && search.trim().isNotEmpty) queryParameters['search'] = search.trim();
      if (branchId != null) queryParameters['branchId'] = branchId;

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getExpenses,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<List<ExpenseModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => ExpenseModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get expenses: $e');
      rethrow;
    }
  }

  Future<ApiResponse<ExpenseDetailModel>> getById({
    required String id,
  }) async {
    try {
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getExpenseById(id),
      );

      final apiResponse = ApiResponse<ExpenseDetailModel>.fromJson(
        response.data!,
        (json) => ExpenseDetailModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get expense by id: $e');
      rethrow;
    }
  }

  Future<ApiResponse<ExpenseModel>> update({
    required String id,
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentUrls,
    required List<String>? attachmentFilePaths,
  }) async {
    try {
      // Step 1: Start with existing attachment URLs
      List<String> allAttachmentUrls = attachmentUrls ?? [];

      // Step 2: Upload new attachment files if any
      if (attachmentFilePaths != null && attachmentFilePaths.isNotEmpty) {
        LoggingService.auth('Uploading expense attachment files', {
          'count': attachmentFilePaths.length,
        });

        final uploadResponse = await _uploadService.uploadFiles(attachmentFilePaths);
        uploadResponse.when(
          success: (success, message, data, meta, pagination) {
            // Extract URLs from upload response
            final uploadedUrls = data.when(
              single: (fileData) => [fileData.url],
              multiple: (filesData) => filesData.files.map((f) => f.url).toList(),
            );
            // Combine existing URLs with newly uploaded URLs
            allAttachmentUrls.addAll(uploadedUrls);
            LoggingService.auth('Expense attachments uploaded successfully', {
              'uploadedCount': uploadedUrls.length,
              'totalCount': allAttachmentUrls.length,
              'urls': allAttachmentUrls,
            });
          },
          error: (success, error, meta) {
            throw Exception('Failed to upload attachment files: ${error.message}');
          },
        );
      }

      // Step 3: Update expense with complete attachment URLs
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateExpense(id),
        data: {
          'expenseDate': expenseDate.toIso8601String(),
          'name': name,
          'notes': notes,
          'attachments': allAttachmentUrls,
        },
      );

      final apiResponse = ApiResponse<ExpenseModel>.fromJson(
        response.data!,
        (json) => ExpenseModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update expense: $e');
      rethrow;
    }
  }

  Future<ApiResponse<ExpenseModel>> delete({
    required String id,
  }) async {
    try {
      final response = await ApiService.delete<Map<String, dynamic>>(
        ApiEndpoints.deleteExpense(id),
      );

      final apiResponse = ApiResponse<ExpenseModel>.fromJson(
        response.data!,
        (json) => ExpenseModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to delete expense: $e');
      rethrow;
    }
  }

  Future<ApiResponse<ExpensePaymentMethodModel>> createPaymentMethod({
    required String expenseId,
    required String method,
    required String amount,
    String? referenceNumber,
    int? bankId,
    String? attachment,
  }) async {
    try {
      // Step 1: Upload attachment file if provided
      String? attachmentUrl;
      if (attachment != null && attachment.isNotEmpty) {
        LoggingService.auth('Uploading expense payment method attachment file', {
          'file': attachment,
        });

        final uploadResponse = await _uploadService.uploadFile(attachment);
        uploadResponse.when(
          success: (success, message, data, meta, pagination) {
            // Extract URL from upload response
            attachmentUrl = data.when(
              single: (fileData) => fileData.url,
              multiple: (filesData) => filesData.files.isNotEmpty ? filesData.files.first.url : null,
            );
            if (attachmentUrl != null) {
              LoggingService.auth('Expense payment method attachment uploaded successfully', {
                'url': attachmentUrl,
              });
            }
          },
          error: (success, error, meta) {
            throw Exception('Failed to upload attachment file: ${error.message}');
          },
        );
      }

      // Step 2: Prepare request data
      final Map<String, dynamic> data = {
        'method': method,
        'amount': amount,
      };

      if (referenceNumber != null) data['referenceNumber'] = referenceNumber;
      if (bankId != null) data['bankId'] = bankId;
      if (attachmentUrl != null) data['attachment'] = attachmentUrl;

      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createExpensePaymentMethod(expenseId),
        data: data,
      );

      final apiResponse = ApiResponse<ExpensePaymentMethodModel>.fromJson(
        response.data!,
        (json) => ExpensePaymentMethodModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create expense payment method: $e');
      rethrow;
    }
  }

  Future<ApiResponse<ExpensePaymentMethodModel>> updatePaymentMethod({
    required String expenseId,
    required String paymentMethodId,
    String? method,
    String? amount,
    String? referenceNumber,
    int? bankId,
    String? attachment,
  }) async {
    try {
      // Step 1: Upload attachment file if provided
      String? attachmentUrl;
      if (attachment != null && attachment.isNotEmpty) {
        LoggingService.auth('Uploading expense payment method attachment file', {
          'file': attachment,
        });

        final uploadResponse = await _uploadService.uploadFile(attachment);
        uploadResponse.when(
          success: (success, message, data, meta, pagination) {
            // Extract URL from upload response
            attachmentUrl = data.when(
              single: (fileData) => fileData.url,
              multiple: (filesData) => filesData.files.isNotEmpty ? filesData.files.first.url : null,
            );
            if (attachmentUrl != null) {
              LoggingService.auth('Expense payment method attachment uploaded successfully', {
                'url': attachmentUrl,
              });
            }
          },
          error: (success, error, meta) {
            throw Exception('Failed to upload attachment file: ${error.message}');
          },
        );
      }

      // Step 2: Prepare request data
      final Map<String, dynamic> data = {};

      if (method != null) data['method'] = method;
      if (amount != null) data['amount'] = amount;
      if (referenceNumber != null) data['referenceNumber'] = referenceNumber;
      if (bankId != null) data['bankId'] = bankId;
      if (attachmentUrl != null) data['attachment'] = attachmentUrl;

      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateExpensePaymentMethod(expenseId, paymentMethodId),
        data: data,
      );

      final apiResponse = ApiResponse<ExpensePaymentMethodModel>.fromJson(
        response.data!,
        (json) => ExpensePaymentMethodModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update expense payment method: $e');
      rethrow;
    }
  }

  Future<ApiResponse<ExpensePaymentMethodModel>> deletePaymentMethod({
    required String expenseId,
    required String paymentMethodId,
  }) async {
    try {
      final response = await ApiService.delete<Map<String, dynamic>>(
        ApiEndpoints.deleteExpensePaymentMethod(expenseId, paymentMethodId),
      );

      final apiResponse = ApiResponse<ExpensePaymentMethodModel>.fromJson(
        response.data!,
        (json) => ExpensePaymentMethodModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to delete expense payment method: $e');
      rethrow;
    }
  }
}
