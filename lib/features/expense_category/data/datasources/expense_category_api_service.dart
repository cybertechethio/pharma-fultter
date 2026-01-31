import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/expense_category_model.dart';

class ExpenseCategoryApiService {
  const ExpenseCategoryApiService();

  factory ExpenseCategoryApiService.create() {
    return const ExpenseCategoryApiService();
  }

  Future<ApiResponse<ExpenseCategoryModel>> create({
    required String name,
    required String description,
  }) async {
    try {
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createExpenseCategory,
        data: {
          'name': name,
          'description': description,
        },
      );

      final apiResponse = ApiResponse<ExpenseCategoryModel>.fromJson(
        response.data!,
        (json) => ExpenseCategoryModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create expense category: $e');
      rethrow;
    }
  }

  Future<ApiResponse<List<ExpenseCategoryModel>>> getAll() async {
    try {
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getExpenseCategories,
      );

      final apiResponse = ApiResponse<List<ExpenseCategoryModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => ExpenseCategoryModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get expense categories: $e');
      rethrow;
    }
  }

  Future<ApiResponse<ExpenseCategoryModel>> update({
    required String id,
    required String name,
    required String description,
  }) async {
    try {
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateExpenseCategory(id),
        data: {
          'name': name,
          'description': description,
        },
      );

      final apiResponse = ApiResponse<ExpenseCategoryModel>.fromJson(
        response.data!,
        (json) => ExpenseCategoryModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update expense category: $e');
      rethrow;
    }
  }

  Future<ApiResponse<ExpenseCategoryModel>> delete({
    required String id,
  }) async {
    try {
      final response = await ApiService.delete<Map<String, dynamic>>(
        ApiEndpoints.deleteExpenseCategory(id),
      );

      final apiResponse = ApiResponse<ExpenseCategoryModel>.fromJson(
        response.data!,
        (json) => ExpenseCategoryModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to delete expense category: $e');
      rethrow;
    }
  }
}
