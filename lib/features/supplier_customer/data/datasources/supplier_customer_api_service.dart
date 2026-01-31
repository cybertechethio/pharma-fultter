import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/supplier_customer_model.dart';

class SupplierCustomerApiService {
  const SupplierCustomerApiService();

  factory SupplierCustomerApiService.create() {
    return const SupplierCustomerApiService();
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
}


