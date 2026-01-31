import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/permission_model.dart';

class PermissionApiService {
  const PermissionApiService();

  factory PermissionApiService.create() {
    return const PermissionApiService();
  }

  /// Fetches all permissions grouped by dynamic categories from backend
  /// API returns: { "data": { "user_management": [...], "company_management": [...] } }
  Future<ApiResponse<Map<String, List<PermissionModel>>>> getAll({
    int page = 1,
    int limit = 1000,
    String? search,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
        if (search != null && search.isNotEmpty) 'search': search,
      };

      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getPermissions,
        queryParameters: queryParams,
      );

      // Parse the dynamic grouped response
      final apiResponse = ApiResponse<Map<String, List<PermissionModel>>>.fromJson(
        response.data!,
        (json) => _parseGroupedPermissions(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get permissions: $e');
      rethrow;
    }
  }

  /// Parse the dynamic grouped permissions response
  /// Backend returns permissions grouped by category as map keys
  Map<String, List<PermissionModel>> _parseGroupedPermissions(
    Map<String, dynamic> json,
  ) {
    final Map<String, List<PermissionModel>> grouped = {};

    json.forEach((category, permissionsList) {
      if (permissionsList is List) {
        final permissions = permissionsList
            .map((p) => PermissionModel.fromJson({
                  ...p as Map<String, dynamic>,
                  'category': category, // Inject category from map key
                }))
            .toList();
        grouped[category] = permissions;
      }
    });

    return grouped;
  }
}

