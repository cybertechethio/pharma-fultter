import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/user_model.dart';
import 'user_api_service.dart';
import 'user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UserApiService _api;

  UserRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, List<UserModel>>> getUsers() async {
    LoggingService.auth('Starting get users process');
    try {
      final ApiResponse<List<UserModel>> response = await _api.getAll();
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get users successful', {
            'count': data.length,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get users failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } on TypeError catch (e) {
      LoggingService.error('Get users data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get users response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get users unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get users failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    bool isActive = true,
  }) async {
    LoggingService.auth('Starting create user process', {
      'firstName': firstName,
      'email': email,
    });
    try {
      final response = await _api.create(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        isActive: isActive,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create user successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create user failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } on TypeError catch (e) {
      LoggingService.error('Create user data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Create user response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Create user unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create user failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUser({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    bool isActive = true,
  }) async {
    LoggingService.auth('Starting update user process', {
      'id': id,
    });
    try {
      final response = await _api.update(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        isActive: isActive,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Update user successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update user failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } on TypeError catch (e) {
      LoggingService.error('Update user data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Update user response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Update user unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update user failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> deleteUser({required int id}) async {
    LoggingService.auth('Starting delete user process', {
      'id': id,
    });
    try {
      final response = await _api.delete(id: id);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Delete user successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Delete user failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } on TypeError catch (e) {
      LoggingService.error('Delete user data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Delete user response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Delete user unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete user failed: ${e.toString()}'));
    }
  }
}

