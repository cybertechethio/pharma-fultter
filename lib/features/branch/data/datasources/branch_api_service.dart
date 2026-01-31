import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/branch_model.dart';

class BranchApiService {
  const BranchApiService();

  factory BranchApiService.create() {
    return const BranchApiService();
  }

  /// Create a new branch
  Future<ApiResponse<BranchModel>> createBranch({
    required String name,
  }) async {
    try {
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createBranch,
        data: {'name': name},
      );

      final apiResponse = ApiResponse<BranchModel>.fromJson(
        response.data!,
        (json) => BranchModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create branch: $e');
      rethrow;
    }
  }

  /// Get all branches
  Future<ApiResponse<List<BranchModel>>> getBranches() async {
    try {
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getBranches,
      );

      final apiResponse = ApiResponse<List<BranchModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => BranchModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get branches: $e');
      rethrow;
    }
  }

  /// Update an existing branch
  Future<ApiResponse<BranchModel>> updateBranch({
    required String branchId,
    required String name,
  }) async {
    try {
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateBranch(branchId),
        data: {'name': name},
      );

      final apiResponse = ApiResponse<BranchModel>.fromJson(
        response.data!,
        (json) => BranchModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update branch: $e');
      rethrow;
    }
  }

  /// Delete a branch
  Future<ApiResponse<BranchModel>> deleteBranch({
    required String branchId,
  }) async {
    try {
      final response = await ApiService.delete<Map<String, dynamic>>(
        ApiEndpoints.deleteBranch(branchId),
      );

      final apiResponse = ApiResponse<BranchModel>.fromJson(
        response.data!,
        (json) => BranchModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to delete branch: $e');
      rethrow;
    }
  }
}
