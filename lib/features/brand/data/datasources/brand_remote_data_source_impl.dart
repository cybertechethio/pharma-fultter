import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/brand_model.dart';
import 'brand_api_service.dart';
import 'brand_remote_data_source.dart';

class BrandRemoteDataSourceImpl implements BrandRemoteDataSource {
  final BrandApiService _api;

  BrandRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, List<BrandModel>>> getBrands({
    String? search,
  }) async {
    LoggingService.auth('Starting get brands process', {
      if (search != null) 'search': search,
    });
    try {
      final ApiResponse<List<BrandModel>> response = await _api.getAll(
        search: search,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get brands successful', {
            'count': data.length,
            'message': message,
            if (search != null) 'search': search,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get brands failed - server error', {
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
      LoggingService.error('Get brands data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get brands response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get brands unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get brands failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, BrandModel>> createBrand({
    required String name,
    required String description,
  }) async {
    LoggingService.auth('Starting create brand process', {
      'name': name,
    });
    try {
      final response = await _api.create(
        name: name,
        description: description,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create brand successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create brand failed - server error', {
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
      LoggingService.error('Create brand data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Create brand response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Create brand unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create brand failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, BrandModel>> updateBrand({
    required String id,
    required String name,
    required String description,
  }) async {
    LoggingService.auth('Starting update brand process', {
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
          LoggingService.auth('Update brand successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update brand failed - server error', {
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
      LoggingService.error('Update brand data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Update brand response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Update brand unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update brand failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, BrandModel>> deleteBrand({required String id}) async {
    LoggingService.auth('Starting delete brand process', {
      'id': id,
    });
    try {
      final response = await _api.delete(id: id);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Delete brand successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Delete brand failed - server error', {
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
      LoggingService.error('Delete brand data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Delete brand response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Delete brand unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete brand failed: ${e.toString()}'));
    }
  }
}

