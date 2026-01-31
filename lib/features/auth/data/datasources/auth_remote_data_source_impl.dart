import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../models/auth_token_model.dart';
import '../models/generic_response_model.dart';
import '../models/user_model.dart';
import '../models/user_or_null_response_model.dart';
import '../models/current_context_model.dart';
import 'auth_remote_data_source.dart';
import 'auth_api_service.dart';
import '../../../../shared/models/api_response.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiService _apiService;

  AuthRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, GenericResponseModel>> loginUser({
    required String identifier,
    required String password,
  }) async {
    LoggingService.auth('Starting login process', {
      'identifier': identifier,
      'passwordLength': password.length,
    });
    
    try {
      final response = await _apiService.loginUser(
        identifier: identifier,
        password: password,
      );

      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Login successful', {
            'userId': data.user.id,
            'email': data.user.email,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Login failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      LoggingService.error('Login data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Login response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Login unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Login failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> registerUser({
    required String phone,
    String? email,
    required String password,
    required String firstName,
    required String lastName,
    required String companyName,
  }) async {
    print('15...................................................🚀 REMOTE DATA SOURCE STARTED:');
    print('📍 Phone: $phone');
    print('📍 Email: $email');
    print('📍 First Name: $firstName');
    print('📍 Last Name: $lastName');
    print('📍 Company Name: $companyName');
    
    LoggingService.auth('Starting registration process', {
      'email': email,
      'phone': phone,
      'firstName': firstName,
      'lastName': lastName,
      'companyName': companyName,
      'passwordLength': password.length,
    });
    
    try {
      print('16...................................................🚀 CALLING API SERVICE:');
      final response = await _apiService.registerUser(
        phone: phone,
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        companyName: companyName,
      );
      print('17...................................................🚀 API SERVICE RESPONSE: $response');

      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Registration successful', {
            'userId': data.id,
            'email': data.email,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Registration failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
     final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      LoggingService.error('Registration data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Registration response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Registration unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Registration failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, AuthTokenModel>> refreshToken({
    required String refreshToken,
  }) async {
    try {
      final response = await _apiService.refreshToken(
        refreshToken: refreshToken,
      );

      return response.when(
        success: (success, message, data, meta, pagination) => Right(data),
        error: (success, error, meta) => Left(Failure.serverError(error.message)),
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Token refresh failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logoutUser() async {
    try {
      await _apiService.logoutUser();
      return const Right(unit);

    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Logout failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> verifyAccount({
    required String identifier,
    required String otp,
  }) async {
    try {
      final response = await _apiService.verifyAccount(
        identifier: identifier,
        otp: otp,
      );

      return response.when(
        success: (success, message, data, meta, pagination) => Right(data),
        error: (success, error, meta) => Left(Failure.serverError(error.message)),
      );
    } on DioException catch (e) {
     final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Account verification failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserOrNullResponseModel>> forgotPassword({
    required String identifier,
  }) async {
    try {
      final response = await _apiService.forgotPassword(
        identifier: identifier,
      );

      return response.when(
        success: (success, message, data, meta, pagination) => Right(data),
        error: (success, error, meta) => Left(Failure.serverError(error.message)),
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      print('Data parsing error: ${e.toString()}');
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Forgot password failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserOrNullResponseModel>> resendOtp({
    required String identifier,
  }) async {
    try {
      final response = await _apiService.resendOtp(
        identifier: identifier,
      );

      return response.when(
        success: (success, message, data, meta, pagination) => Right(data),
        error: (success, error, meta) => Left(Failure.serverError(error.message)),
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Resend OTP failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> validateOtp({
    required String identifier,
    required String otp,
  }) async {
    try {
      print('🔍 REMOTE DATA SOURCE - OTP VALIDATION START:');
      print('📍 Identifier: $identifier');
      print('📍 OTP: $otp');
      
      final response = await _apiService.validateOtp(
        identifier: identifier,
        otp: otp,
      );

      print('🔍 REMOTE DATA SOURCE - API RESPONSE RECEIVED:');
      print('📍 Response Type: ${response.runtimeType}');

      return response.when(
        success: (success, message, data, meta, pagination) {
          print('🔍 REMOTE DATA SOURCE - SUCCESS RESPONSE:');
          print('📍 Success: $success');
          print('📍 Message: $message');
          print('📍 Data Type: ${data.runtimeType}');
          print('📍 Data: $data');
          print('📍 Meta: $meta');
          return Right(data);
        },
        error: (success, error, meta) {
          print('🔍 REMOTE DATA SOURCE - ERROR RESPONSE:');
          print('📍 Success: $success');
          print('📍 Error: $error');
          print('📍 Meta: $meta');
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      print('❌ REMOTE DATA SOURCE - DIO EXCEPTION:');
      print('📍 Error: $e');
      final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      print('❌ REMOTE DATA SOURCE - TYPE ERROR:');
      print('📍 Error: $e');
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      print('❌ REMOTE DATA SOURCE - FORMAT EXCEPTION:');
      print('📍 Error: $e');
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      print('❌ REMOTE DATA SOURCE - UNEXPECTED ERROR:');
      print('📍 Error: $e');
      return Left(Failure.unexpectedError('OTP validation failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUserProfile({
    required UserModel user,
  }) async {
    try {
      final response = await _apiService.updateUserProfile(
        user: user,
      );

      return response.when(
        success: (success, message, data, meta, pagination) => Right(data),
        error: (success, error, meta) => Left(Failure.serverError(error.message)),
      );
    } on DioException catch (e) {
     final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Profile update failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final response = await _apiService.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      return response.when(
        success: (success, message, data, meta, pagination) => Right(data),
        error: (success, error, meta) => Left(Failure.serverError(error.message)),
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Password change failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> resetPassword({
    required String identifier,
    required String resetToken,
    required String newPassword,
  }) async {
    try {
      final response = await _apiService.resetPassword(
        identifier: identifier,
        resetToken: resetToken,
        newPassword: newPassword,
      );

      return response.when(
        success: (success, message, data, meta, pagination) => Right(data),
        error: (success, error, meta) => Left(Failure.serverError(error.message)),
      );
    } on DioException catch (e) {
     final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Password reset failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> deleteAccount({
    required String password,
  }) async {
    try {
      final response = await _apiService.deleteAccount(
        password: password,
      );

      return response.when(
        success: (success, message, data, meta, pagination) => Right(data),
        error: (success, error, meta) => Left(Failure.serverError(error.message)),
      );
    } on DioException catch (e) {
     final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Account deletion failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> uploadProfilePicture({
    required File imageFile,
  }) async {
    LoggingService.auth('Starting profile picture upload', {
      'filePath': imageFile.path,
      'fileSize': await imageFile.length(),
    });

    try {
      final response = await _apiService.uploadProfilePicture(
        imageFile: imageFile,
      );

      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Profile picture upload successful', {
            'userId': data.id,
            'avatar': data.avatar,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Profile picture upload failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      LoggingService.error('Profile picture upload data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Profile picture upload response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Profile picture upload unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Profile picture upload failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getCurrentUser() async {
    try {
      final response = await _apiService.getCurrentUser();

      return response.when(
        success: (success, message, data, meta, pagination) => Right(data),
        error: (success, error, meta) => Left(Failure.serverError(error.message)),
      );
    } on DioException catch (e) {
     final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Get current user failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, CurrentContextModel>> switchCompany({
    required String companyId,
  }) async {
    try {
      final response = await _apiService.switchCompany(companyId: companyId);
      
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Switch company successful', {
            'companyId': data.currentCompanyId,
            'branchId': data.currentBranchId,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Switch company failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } catch (e) {
      LoggingService.error('Switch company unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Switch company failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, CurrentContextModel>> switchBranch({
    required String branchId,
  }) async {
    try {
      final response = await _apiService.switchBranch(branchId: branchId);
      
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Switch branch successful', {
            'companyId': data.currentCompanyId,
            'branchId': data.currentBranchId,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Switch branch failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } catch (e) {
      LoggingService.error('Switch branch unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Switch branch failed: ${e.toString()}'));
    }
  }
}
