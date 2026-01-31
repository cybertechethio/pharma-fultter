import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/user_role_model.dart';

class UserRoleApiService {
  const UserRoleApiService();

  factory UserRoleApiService.create() {
    return const UserRoleApiService();
  }

  Future<ApiResponse<List<UserBranchRoleAssignmentModel>>> getUserRoleAssignments({
    required int userId,
  }) async {
    try {
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getUserRoleAssignments(userId),
      );

      final apiResponse = ApiResponse<List<UserBranchRoleAssignmentModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => UserBranchRoleAssignmentModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get user role assignments: $e');
      rethrow;
    }
  }

  Future<ApiResponse<List<UserBranchRoleAssignmentModel>>> assignUserRoles({
    required int userId,
    required List<Map<String, dynamic>> assignments,
  }) async {
    try {
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.assignUserRoles,
        data: {
          'userId': userId,
          'assignments': assignments,
        },
      );

      final apiResponse = ApiResponse<List<UserBranchRoleAssignmentModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => UserBranchRoleAssignmentModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to assign user roles: $e');
      rethrow;
    }
  }
}

