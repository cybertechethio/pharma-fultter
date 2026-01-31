import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/unit_model.dart';
import 'unit_api_service.dart';
import 'unit_remote_data_source.dart';

class UnitRemoteDataSourceImpl implements UnitRemoteDataSource {
  final UnitApiService _api;

  UnitRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, List<UnitModel>>> getUnits({String? search}) async {
    LoggingService.auth('Starting get units process', {'search': search});
    try {
      final ApiResponse<List<UnitModel>> response = await _api.getAll(search: search);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get units successful', {
            'count': data.length,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get units failed - server error', {
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
      LoggingService.error('Get units data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get units response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get units unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get units failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UnitModel>> createUnit({
    required String name,
    required String description,
  }) async {
    LoggingService.auth('Starting create unit process', {
      'name': name,
    });
    try {
      final response = await _api.create(
        name: name,
        description: description,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create unit successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create unit failed - server error', {
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
      LoggingService.error('Create unit data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Create unit response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Create unit unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create unit failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UnitModel>> updateUnit({
    required String id,
    required String name,
    required String description,
  }) async {
    LoggingService.auth('Starting update unit process', {
      'id': id,
    });
    try {
      final response = await _api.update(
        id: id,
        name: name,
        description: description,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Update unit successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update unit failed - server error', {
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
      LoggingService.error('Update unit data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Update unit response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Update unit unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update unit failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UnitModel>> deleteUnit({required String id}) async {
    LoggingService.auth('Starting delete unit process', {
      'id': id,
    });
    try {
      final response = await _api.delete(id: id);
      return response.when(
        success: (success, message, data, meta, pagination  ) {
          LoggingService.auth('Delete unit successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Delete unit failed - server error', {
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
      LoggingService.error('Delete unit data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Delete unit response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Delete unit unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete unit failed: ${e.toString()}'));
    }
  }
}

