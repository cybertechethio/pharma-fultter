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
    required String? categoryId,
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

      // Step 2: Create expense with uploaded URLs
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createExpense,
        data: {
          'categoryId': categoryId,
          'expenseDate': expenseDate.toIso8601String(),
          'name': name,
          'notes': notes,
          'attachments': attachmentUrls,
          'paymentMethods': paymentMethods,
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
    String? categoryId,
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

      if (categoryId != null) queryParameters['categoryId'] = categoryId;
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
    required String? categoryId,
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentFilePaths,
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

      // Step 2: Update expense with uploaded URLs
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateExpense(id),
        data: {
          'categoryId': categoryId,
          'expenseDate': expenseDate.toIso8601String(),
          'name': name,
          'notes': notes,
          'attachments': attachmentUrls,
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
  }) async {
    try {
      final Map<String, dynamic> data = {
        'method': method,
        'amount': amount,
      };

      if (referenceNumber != null) data['referenceNumber'] = referenceNumber;
      if (bankId != null) data['bankId'] = bankId;

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
  }) async {
    try {
      final Map<String, dynamic> data = {};

      if (method != null) data['method'] = method;
      if (amount != null) data['amount'] = amount;
      if (referenceNumber != null) data['referenceNumber'] = referenceNumber;
      if (bankId != null) data['bankId'] = bankId;

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
