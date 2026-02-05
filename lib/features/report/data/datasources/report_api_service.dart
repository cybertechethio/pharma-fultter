import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/salesreport/sales_report_model.dart';
import '../models/purchasereport/purchase_report_model.dart';
import '../models/customerreport/customer_report_model.dart';
import '../models/expensereport/expense_report_model.dart';
import '../models/bestsellerreport/best_seller_model.dart';
import '../models/annualreport/annual_report_model.dart';
import '../models/profitlossreport/profit_loss_report_model.dart';

class ReportApiService {
  const ReportApiService();

  factory ReportApiService.create() {
    return const ReportApiService();
  }

  /// Get sales report
  Future<ApiResponse<SalesReportModel>> getSalesReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? productId,
    int? categoryId,
    int? customerId,
    String? status,
    int page = 1,
    int limit = 25,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'page': page,
        'limit': limit,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
      };
      if (branchId != null) {
        queryParameters['branchId'] = branchId;
      }
      if (productId != null) {
        queryParameters['productId'] = productId;
      }
      if (categoryId != null) {
        queryParameters['categoryId'] = categoryId;
      }
      if (customerId != null) {
        queryParameters['customerId'] = customerId;
      }
      if (status != null) {
        queryParameters['status'] = status;
      }

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getSalesReport,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<SalesReportModel>.fromJson(
        response.data!,
        (json) => SalesReportModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get sales report: $e');
      rethrow;
    }
  }

  /// Get purchase report
  Future<ApiResponse<PurchaseReportModel>> getPurchaseReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? productId,
    int? categoryId,
    int? supplierId,
    String? status,
    int page = 1,
    int limit = 25,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'page': page,
        'limit': limit,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
      };
      if (branchId != null) {
        queryParameters['branchId'] = branchId;
      }
      if (productId != null) {
        queryParameters['productId'] = productId;
      }
      if (categoryId != null) {
        queryParameters['categoryId'] = categoryId;
      }
      if (supplierId != null) {
        queryParameters['supplierId'] = supplierId;
      }
      if (status != null) {
        queryParameters['status'] = status;
      }

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getPurchaseReport,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<PurchaseReportModel>.fromJson(
        response.data!,
        (json) => PurchaseReportModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get purchase report: $e');
      rethrow;
    }
  }

  /// Get customer report
  Future<ApiResponse<CustomerReportModel>> getCustomerReport({
    DateTime? startDate,
    DateTime? endDate,
    int? branchId,
    int? customerId,
    int page = 1,
    int limit = 25,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'page': page,
        'limit': limit,
      };

      if (startDate != null) {
        queryParameters['startDate'] = startDate.toIso8601String();
      }
      if (endDate != null) {
        queryParameters['endDate'] = endDate.toIso8601String();
      }
      if (branchId != null) {
        queryParameters['branchId'] = branchId;
      }
      if (customerId != null) {
        queryParameters['customerId'] = customerId;
      }

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getCustomerReport,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<CustomerReportModel>.fromJson(
        response.data!,
        (json) => CustomerReportModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get customer report: $e');
      rethrow;
    }
  }

  /// Get expense report
  Future<ApiResponse<ExpenseReportModel>> getExpenseReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? categoryId,
    int page = 1,
    int limit = 25,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'page': page,
        'limit': limit,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
      };
      if (branchId != null) {
        queryParameters['branchId'] = branchId;
      }
      if (categoryId != null) {
        queryParameters['categoryId'] = categoryId;
      }

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getExpenseReport,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<ExpenseReportModel>.fromJson(
        response.data!,
        (json) => ExpenseReportModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get expense report: $e');
      rethrow;
    }
  }

  /// Get best seller report
  Future<ApiResponse<List<BestSellerModel>>> getBestSellerReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? productId,
    int? categoryId,
    int limit = 25,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
      };
      if (branchId != null) {
        queryParameters['branchId'] = branchId;
      }
      if (productId != null) {
        queryParameters['productId'] = productId;
      }
      if (categoryId != null) {
        queryParameters['categoryId'] = categoryId;
      }
      queryParameters['limit'] = limit;

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getBestSellerReport,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<List<BestSellerModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => BestSellerModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get best seller report: $e');
      rethrow;
    }
  }

  /// Get annual report
  Future<ApiResponse<AnnualReportModel>> getAnnualReport({
    required DateTime startDate,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'startDate': startDate.toIso8601String().split('T')[0], // YYYY-MM-DD format
      };

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getAnnualReport,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<AnnualReportModel>.fromJson(
        response.data!,
        (json) => AnnualReportModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get annual report: $e');
      rethrow;
    }
  }

  /// Get profit-loss report
  Future<ApiResponse<ProfitLossReportModel>> getProfitLossReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'startDate': startDate.toIso8601String().split('T')[0],
        'endDate': endDate.toIso8601String().split('T')[0],
      };
      if (branchId != null) {
        queryParameters['branchId'] = branchId;
      }

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getProfitLossReport,
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<ProfitLossReportModel>.fromJson(
        response.data!,
        (json) => ProfitLossReportModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get profit-loss report: $e');
      rethrow;
    }
  }
}

