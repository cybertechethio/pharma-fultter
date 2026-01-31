import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/role_model.dart';

class RoleApiService {
  const RoleApiService();

  factory RoleApiService.create() {
    return const RoleApiService();
  }

  Future<ApiResponse<RoleModel>> create({
    required String name,
    String? description,
    required List<int> permissionIds,
    bool isActive = true,
  }) async {
    try {
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createRole,
        data: {
          'name': name,
          if (description != null) 'description': description,
          'permissionIds': permissionIds,
          'isActive': isActive,
        },
      );

      final apiResponse = ApiResponse<RoleModel>.fromJson(
        response.data!,
        (json) => RoleModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create role: $e');
      rethrow;
    }
  }

  Future<ApiResponse<List<RoleModel>>> getAll() async {
    try {
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getRoles,
      );

      final apiResponse = ApiResponse<List<RoleModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => RoleModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get roles: $e');
      rethrow;
    }
  }

  Future<ApiResponse<RoleModel>> update({
    required int id,
    required String name,
    String? description,
    required List<int> permissionIds,
    bool isActive = true,
  }) async {
    try {
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateRole(id),
        data: {
          'name': name,
          if (description != null) 'description': description,
          'permissionIds': permissionIds,
          'isActive': isActive,
        },
      );

      final apiResponse = ApiResponse<RoleModel>.fromJson(
        response.data!,
        (json) => RoleModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update role: $e');
      rethrow;
    }
  }

  Future<ApiResponse<RoleModel>> delete({
    required int id,
  }) async {
    try {
      final response = await ApiService.delete<Map<String, dynamic>>(
        ApiEndpoints.deleteRole(id),
      );

      final apiResponse = ApiResponse<RoleModel>.fromJson(
        response.data!,
        (json) => RoleModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to delete role: $e');
      rethrow;
    }
  }
}

