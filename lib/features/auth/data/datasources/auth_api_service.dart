import 'dart:io';

import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/auth_token_model.dart';
import '../models/generic_response_model.dart';
import '../models/user_model.dart';
import '../models/user_or_null_response_model.dart';
import '../models/current_context_model.dart';

class AuthApiService {
  const AuthApiService();

  factory AuthApiService.create() {
    return const AuthApiService();
  }
  
  /// Helper function to parse UserModel from JSON that might have nested user data
  static UserModel _parseUserModel(dynamic json) {
    print('🔍 USER MODEL PARSING DEBUG:');
    print('📍 JSON Type: ${json.runtimeType}');
    print('📍 JSON: $json');
    
    if (json is Map<String, dynamic>) {
      print('📍 JSON Keys: ${json.keys.toList()}');
      
      // Check if user data is nested under 'user' key
      if (json.containsKey('user') && json['user'] is Map<String, dynamic>) {
        final userData = json['user'] as Map<String, dynamic>;
        print('📍 Found nested user data: $userData');
        print('📍 User data keys: ${userData.keys.toList()}');
        print('📍 User ID: ${userData['id']} (Type: ${userData['id'].runtimeType})');
        
        try {
          final userModel = UserModel.fromJson(userData);
          print('📍 Parsed UserModel ID: ${userModel.id} (Type: ${userModel.id.runtimeType})');
          print('📍 Parsed UserModel: $userModel');
          return userModel;
        } catch (e, stackTrace) {
          print('❌ ERROR PARSING NESTED USER MODEL:');
          print('📍 Error: $e');
          print('📍 Stack Trace: $stackTrace');
          rethrow;
        }
      } else {
        // Try parsing the entire JSON as UserModel (original behavior)
        print('📍 No nested user data found, trying direct parsing');
        print('📍 ID in JSON: ${json['id']} (Type: ${json['id'].runtimeType})');
        
        try {
          final userModel = UserModel.fromJson(json);
          print('📍 Parsed UserModel ID: ${userModel.id} (Type: ${userModel.id.runtimeType})');
          print('📍 Parsed UserModel: $userModel');
          return userModel;
        } catch (e, stackTrace) {
          print('❌ ERROR PARSING USER MODEL:');
          print('📍 Error: $e');
          print('📍 Stack Trace: $stackTrace');
          rethrow;
        }
      }
    }
    
    throw ArgumentError('Expected Map<String, dynamic> for user data, got ${json.runtimeType}');
  }

  Future<ApiResponse<GenericResponseModel>> loginUser({
    required String identifier,
    required String password,
  }) async {
    final data = {
      'identifier': identifier,
      'password': password,
    };
    
    LoggingService.apiRequest('POST', ApiEndpoints.login, data);
    
    final response = await ApiService.post(
      ApiEndpoints.login,
      data: data,
    );

    LoggingService.apiResponse('POST', ApiEndpoints.login, response.statusCode ?? 0, response.data);

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) => GenericResponseModel.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<UserModel>> registerUser({
    required String phone,
    String? email,
    required String password,
    required String firstName,
    required String lastName,
    required String companyName,
  }) async {
    print('18...................................................🚀 AUTH API SERVICE STARTED:');
    print('📍 Phone: $phone');
    print('📍 Email: $email');
    print('📍 First Name: $firstName');
    print('📍 Last Name: $lastName');
    print('📍 Company Name: $companyName');
    final data = {
      'phone': phone,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'companyName': companyName,
    };
    if (email != null && email.isNotEmpty) {
      data['email'] = email;
    }
    
    // Print final request details
    print('🚀 FINAL BACKEND REQUEST:');
    print('📍 Base URL: ${ApiService.baseUrl}');
    print('📍 Endpoint: ${ApiEndpoints.register}');
    print('📍 Full URL: ${ApiService.baseUrl}${ApiEndpoints.register}');
    print('🔧 Method: POST');
    print('📦 Headers: {Content-Type: application/json, Accept: application/json}');
    print('📋 Request Data: ${data.toString()}');
    print('---');
    
    // Direct console logging for debugging
    print('🔐 AUTH API SERVICE - Registration Request:');
    print('📍 Method: POST');
    print('📍 Endpoint: ${ApiEndpoints.register}');
    print('📍 Data: $data');
    print('---');
    
    LoggingService.apiRequest('POST', ApiEndpoints.register, data);
    
    final response = await ApiService.post(
      ApiEndpoints.register,
      data: data,
    );

    // Print response details
    print('📥 BACKEND RESPONSE:');
    print('📊 Status Code: ${response.statusCode}');
    print('📋 Response Data: ${response.data}');
    print('---');

    // Direct console logging for debugging
    print('🔐 AUTH API SERVICE - Registration Response:');
    print('📍 Status Code: ${response.statusCode}');
    print('📍 Response Data: ${response.data}');
    print('---');
    
    LoggingService.apiResponse('POST', ApiEndpoints.register, response.statusCode ?? 0, response.data);

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      _parseUserModel,
    );
  }

  Future<ApiResponse<AuthTokenModel>> refreshToken({
    required String refreshToken,
  }) async {
    final data = {'refreshToken': refreshToken};
    
    final response = await ApiService.post(
      ApiEndpoints.refreshToken,
      data: data,
    );

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) => AuthTokenModel.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Logout user
  /// Note: Backend may return user data, but we ignore it and return Unit
  Future<void> logoutUser() async {
    final data = <String, dynamic>{};
    
   await ApiService.post(
      ApiEndpoints.logout,
      data: data,
    );
  }

  Future<ApiResponse<GenericResponseModel>> verifyAccount({
    required String identifier,
    required String otp,
  }) async {
    final data = {
      'identifier': identifier,
      'otp': otp,
    };
    
    LoggingService.apiRequest('POST', ApiEndpoints.verifyAccount, data);
    
    final response = await ApiService.post(
      ApiEndpoints.verifyAccount,
      data: data,
    );

    LoggingService.apiResponse('POST', ApiEndpoints.verifyAccount, response.statusCode ?? 0, response.data);

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) => GenericResponseModel.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<UserOrNullResponseModel>> forgotPassword({
    required String identifier,
  }) async {
    final data = {'identifier': identifier};
    
    LoggingService.apiRequest('POST', ApiEndpoints.forgotPassword, data);
    
    final response = await ApiService.post(
      ApiEndpoints.forgotPassword,
      data: data,
    );

    LoggingService.apiResponse('POST', ApiEndpoints.forgotPassword, response.statusCode ?? 0, response.data);

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) {
        // Handle the case where data field is null
        if (json == null) {
          return const UserOrNullResponseModel(user: null);
        }
        
        // If json is a Map, try to extract user data
        if (json is Map<String, dynamic>) {
          // Check if there's a 'user' field in the data
          if (json.containsKey('user')) {
            final userData = json['user'];
            if (userData == null) {
              return const UserOrNullResponseModel(user: null);
            } else if (userData is Map<String, dynamic>) {
              return UserOrNullResponseModel(
                user: UserModel.fromJson(userData),
              );
            }
          }
          
          // If no 'user' field, treat the entire json as user data
          return UserOrNullResponseModel(
            user: UserModel.fromJson(json),
          );
        }
        
        // Fallback: return null user
        return const UserOrNullResponseModel(user: null);
      },
    );
  }

  Future<ApiResponse<UserOrNullResponseModel>> resendOtp({
    required String identifier,
  }) async {
    final data = {'identifier': identifier};
    
    LoggingService.apiRequest('POST', ApiEndpoints.resendOtp, data);
    
    final response = await ApiService.post(
      ApiEndpoints.resendOtp,
      data: data,
    );

    LoggingService.apiResponse('POST', ApiEndpoints.resendOtp, response.statusCode ?? 0, response.data);

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) {
        // Handle the case where data field is null
        if (json == null) {
          return const UserOrNullResponseModel(user: null);
        }
        
        // If json is a Map, try to extract user data
        if (json is Map<String, dynamic>) {
          // Check if there's a 'user' field in the data
          if (json.containsKey('user')) {
            final userData = json['user'];
            if (userData == null) {
              return const UserOrNullResponseModel(user: null);
            } else if (userData is Map<String, dynamic>) {
              return UserOrNullResponseModel(
                user: UserModel.fromJson(userData),
              );
            }
          }
          
          // If no 'user' field, treat the entire json as user data
          return UserOrNullResponseModel(
            user: UserModel.fromJson(json),
          );
        }
        
        // Fallback: return null user
        return const UserOrNullResponseModel(user: null);
      },
    );
  }

  Future<ApiResponse<UserModel>> validateOtp({
    required String identifier,
    required String otp,
  }) async {
    final data = {
      'identifier': identifier,
      'otp': otp,
    };
    
    LoggingService.apiRequest('POST', ApiEndpoints.validateOtp, data);
    
    final response = await ApiService.post(
      ApiEndpoints.validateOtp,
      data: data,
    );

    // Detailed logging for OTP validation response
    print('🔍 OTP VALIDATION RESPONSE DEBUG:');
    print('📍 Status Code: ${response.statusCode}');
    print('📍 Response Data Type: ${response.data.runtimeType}');
    print('📍 Response Data: ${response.data}');
    
    if (response.data is Map<String, dynamic>) {
      final responseMap = response.data as Map<String, dynamic>;
      print('📍 Response Map Keys: ${responseMap.keys.toList()}');
      
      if (responseMap.containsKey('data')) {
        final dataField = responseMap['data'];
        print('📍 Data Field Type: ${dataField.runtimeType}');
        print('📍 Data Field: $dataField');
        
        if (dataField is Map<String, dynamic>) {
          print('📍 User Data Keys: ${dataField.keys.toList()}');
          print('📍 User ID Type: ${dataField['id'].runtimeType}');
          print('📍 User ID Value: ${dataField['id']}');
        }
      }
    }
    
    print('---');

    LoggingService.apiResponse('POST', ApiEndpoints.validateOtp, response.statusCode ?? 0, response.data);

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      _parseUserModel,
    );
  }

  Future<ApiResponse<UserModel>> updateUserProfile({
    required UserModel user,
  }) async {
    final data = user.toJson();
    
    final response = await ApiService.put(
      ApiEndpoints.updateProfile,
      data: data,
    );

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      _parseUserModel,
    );
  }

  Future<ApiResponse<UserModel>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final data = {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    };
    
    final response = await ApiService.post(
      ApiEndpoints.changePassword,
      data: data,
    );

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      _parseUserModel,
    );
  }

  Future<ApiResponse<GenericResponseModel>> resetPassword({
    required String identifier,
    required String resetToken,
    required String newPassword,
  }) async {
    final data = {
      'identifier': identifier,
      'resetToken': resetToken,
      'newPassword': newPassword,
    };
    
    LoggingService.apiRequest('POST', ApiEndpoints.resetPassword, data);
    
    final response = await ApiService.post(
      ApiEndpoints.resetPassword,
      data: data,
    );

    LoggingService.apiResponse('POST', ApiEndpoints.resetPassword, response.statusCode ?? 0, response.data);

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) => GenericResponseModel.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<UserModel>> deleteAccount({
    required String password,
  }) async {
    final data = {'password': password};
    
    final response = await ApiService.delete(
      ApiEndpoints.deleteAccount,
      data: data,
    );

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      _parseUserModel,
    );
  }

  Future<ApiResponse<UserModel>> uploadProfilePicture({
    required File imageFile,
  }) async {
    LoggingService.apiRequest('POST', ApiEndpoints.uploadProfileImage, {
      'filePath': imageFile.path,
      'fieldName': 'image',
    });

    final response = await ApiService.uploadFile(
      ApiEndpoints.uploadProfileImage,
      filePath: imageFile.path,
      fieldName: 'image',
    );

    LoggingService.apiResponse(
      'POST',
      ApiEndpoints.uploadProfileImage,
      response.statusCode ?? 0,
      response.data,
    );

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      _parseUserModel,
    );
  }

  Future<ApiResponse<UserModel>> getCurrentUser() async {
    final response = await ApiService.get(ApiEndpoints.getCurrentUser);

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      _parseUserModel,
    );
  }

  Future<ApiResponse<CurrentContextModel>> switchCompany({
    required String companyId,
  }) async {
    final data = {
      'companyId': companyId,
    };
    
    LoggingService.apiRequest('POST', ApiEndpoints.switchCompany, data);
    
    final response = await ApiService.post(
      ApiEndpoints.switchCompany,
      data: data,
    );

    LoggingService.apiResponse('POST', ApiEndpoints.switchCompany, response.statusCode ?? 0, response.data);

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) => CurrentContextModel.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<CurrentContextModel>> switchBranch({
    required String branchId,
  }) async {
    final data = {
      'branchId': branchId,
    };
    
    LoggingService.apiRequest('POST', ApiEndpoints.switchBranch, data);
    
    final response = await ApiService.post(
      ApiEndpoints.switchBranch,
      data: data,
    );

    LoggingService.apiResponse('POST', ApiEndpoints.switchBranch, response.statusCode ?? 0, response.data);

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) => CurrentContextModel.fromJson(json as Map<String, dynamic>),
    );
  }
}
