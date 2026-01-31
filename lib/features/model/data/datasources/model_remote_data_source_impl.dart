import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/model_model.dart';
import 'model_api_service.dart';
import 'model_remote_data_source.dart';

class ModelRemoteDataSourceImpl implements ModelRemoteDataSource {
  final ModelApiService _api;

  ModelRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, List<ModelModel>>> getModels() async {
    LoggingService.auth('Starting get models process');
    try {
      final ApiResponse<List<ModelModel>> response = await _api.getAll();
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get models successful', {
            'count': data.length,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get models failed - server error', {
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
      LoggingService.error('Get models data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get models response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get models unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get models failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ModelModel>> createModel({
    required String name,
    required String description,
  }) async {
    LoggingService.auth('Starting create model process', {
      'name': name,
    });
    try {
      final response = await _api.create(
        name: name,
        description: description,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create model successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create model failed - server error', {
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
      LoggingService.error('Create model data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Create model response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Create model unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create model failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ModelModel>> updateModel({
    required String id,
    required String name,
    required String description,
  }) async {
    LoggingService.auth('Starting update model process', {
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
          LoggingService.auth('Update model successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update model failed - server error', {
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
      LoggingService.error('Update model data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Update model response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Update model unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update model failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ModelModel>> deleteModel({required String id}) async {
    LoggingService.auth('Starting delete model process', {
      'id': id,
    });
    try {
      final response = await _api.delete(id: id);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Delete model successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Delete model failed - server error', {
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
      LoggingService.error('Delete model data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Delete model response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Delete model unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete model failed: ${e.toString()}'));
    }
  }
}

