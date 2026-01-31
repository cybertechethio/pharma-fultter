import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/role_model.dart';
import 'role_api_service.dart';
import 'role_remote_data_source.dart';

class RoleRemoteDataSourceImpl implements RoleRemoteDataSource {
  final RoleApiService _api;

  RoleRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, List<RoleModel>>> getRoles() async {
    LoggingService.auth('Starting get roles process');
    try {
      final ApiResponse<List<RoleModel>> response = await _api.getAll();
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get roles successful', {
            'count': data.length,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get roles failed - server error', {
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
      LoggingService.error('Get roles data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get roles response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get roles unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get roles failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, RoleModel>> createRole({
    required String name,
    String? description,
    required List<int> permissionIds,
    bool isActive = true,
  }) async {
    LoggingService.auth('Starting create role process', {
      'name': name,
      'permissionIds': permissionIds.length,
    });
    try {
      final response = await _api.create(
        name: name,
        description: description,
        permissionIds: permissionIds,
        isActive: isActive,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create role successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create role failed - server error', {
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
      LoggingService.error('Create role data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Create role response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Create role unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create role failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, RoleModel>> updateRole({
    required int id,
    required String name,
    String? description,
    required List<int> permissionIds,
    bool isActive = true,
  }) async {
    LoggingService.auth('Starting update role process', {
      'id': id,
    });
    try {
      final response = await _api.update(
        id: id,
        name: name,
        description: description,
        permissionIds: permissionIds,
        isActive: isActive,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Update role successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update role failed - server error', {
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
      LoggingService.error('Update role data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Update role response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Update role unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update role failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, RoleModel>> deleteRole({required int id}) async {
    LoggingService.auth('Starting delete role process', {
      'id': id,
    });
    try {
      final response = await _api.delete(id: id);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Delete role successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Delete role failed - server error', {
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
      LoggingService.error('Delete role data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Delete role response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Delete role unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete role failed: ${e.toString()}'));
    }
  }
}

