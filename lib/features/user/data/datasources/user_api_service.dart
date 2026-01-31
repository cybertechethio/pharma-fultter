import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/user_model.dart';

class UserApiService {
  const UserApiService();

  factory UserApiService.create() {
    return const UserApiService();
  }

  Future<ApiResponse<UserModel>> create({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    bool isActive = true,
  }) async {
    try {
      final response = await ApiService.post<Map<String, dynamic>>(
        ApiEndpoints.createUser,
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'phone': phone,
          'isActive': isActive,
        },
      );

      final apiResponse = ApiResponse<UserModel>.fromJson(
        response.data!,
        (json) => UserModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to create user: $e');
      rethrow;
    }
  }

  Future<ApiResponse<List<UserModel>>> getAll() async {
    try {
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getUsers,
      );

      final apiResponse = ApiResponse<List<UserModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => UserModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get users: $e');
      rethrow;
    }
  }

  Future<ApiResponse<UserModel>> update({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    bool isActive = true,
  }) async {
    try {
      final response = await ApiService.put<Map<String, dynamic>>(
        ApiEndpoints.updateUser(id),
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'phone': phone,
          'isActive': isActive,
        },
      );

      final apiResponse = ApiResponse<UserModel>.fromJson(
        response.data!,
        (json) => UserModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to update user: $e');
      rethrow;
    }
  }

  Future<ApiResponse<UserModel>> delete({
    required int id,
  }) async {
    try {
      final response = await ApiService.delete<Map<String, dynamic>>(
        ApiEndpoints.deleteUser(id),
      );

      final apiResponse = ApiResponse<UserModel>.fromJson(
        response.data!,
        (json) => UserModel.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to delete user: $e');
      rethrow;
    }
  }
}

