import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/bank_model.dart';
import 'bank_api_service.dart';
import 'bank_remote_data_source.dart';

class BankRemoteDataSourceImpl implements BankRemoteDataSource {
  final BankApiService _api;

  BankRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, List<BankModel>>> getBanks({
    String? search,
  }) async {
    LoggingService.auth('Starting get banks process', {
      if (search != null) 'search': search,
    });
    try {
      final ApiResponse<List<BankModel>> response = await _api.getAll(
        search: search,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get banks successful', {
            'count': data.length,
            'message': message,
            if (search != null) 'search': search,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get banks failed - server error', {
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
      LoggingService.error('Get banks data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get banks response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get banks unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get banks failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, BankModel>> createBank({
    required String name,
  }) async {
    LoggingService.auth('Starting create bank process', {
      'name': name,
    });
    try {
      final response = await _api.create(
        name: name,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create bank successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create bank failed - server error', {
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
      LoggingService.error('Create bank data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Create bank response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Create bank unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create bank failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, BankModel>> updateBank({
    required int id,
    required String name,
  }) async {
    LoggingService.auth('Starting update bank process', {
      'id': id,
    });
    try {
      final response = await _api.update(
        id: id,
        name: name,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Update bank successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update bank failed - server error', {
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
      LoggingService.error('Update bank data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Update bank response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Update bank unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update bank failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, BankModel>> deleteBank({required int id}) async {
    LoggingService.auth('Starting delete bank process', {
      'id': id,
    });
    try {
      final response = await _api.delete(id: id);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Delete bank successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Delete bank failed - server error', {
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
      LoggingService.error('Delete bank data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Delete bank response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Delete bank unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete bank failed: ${e.toString()}'));
    }
  }
}

