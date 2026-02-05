import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/batch_consolidation_request_model.dart';
import '../models/batch_model.dart';
import '../models/batch_request_model.dart';
import '../models/batch_split_request_model.dart';
import '../models/batch_transfer_request_model.dart';
import 'batch_api_service.dart';
import 'batch_remote_data_source.dart';

class BatchRemoteDataSourceImpl implements BatchRemoteDataSource {
  final BatchApiService _api;

  BatchRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, List<BatchModel>>> getBatchesByItemId(int itemId) async {
    LoggingService.auth('Starting get batches by item', {'itemId': itemId});
    try {
      final response = await _api.getByItemId(itemId);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get batches by item successful', {
            'itemId': itemId,
            'count': data.length,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get batches by item failed - server error', {
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
      LoggingService.error('Get batches by item data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get batches by item response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get batches by item unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get batches by item failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, PaginatedResponse<BatchModel>>> getBatches({
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    LoggingService.auth('Starting get batches process', {
      'page': page,
      'limit': limit,
      'search': search,
    });
    try {
      final ApiResponse<List<BatchModel>> response = await _api.getAll(
        page: page,
        limit: limit,
        search: search,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          // For paginated endpoints, pagination should exist
          if (pagination == null) {
            LoggingService.warning('Get batches: pagination data missing - endpoint may not support pagination');
            return Left(Failure.unexpectedError('Pagination data is required for this endpoint'));
          }

          LoggingService.auth('Get batches successful', {
            'count': data.length,
            'currentPage': pagination.currentPage,
            'totalPages': pagination.totalPages,
            'hasNextPage': pagination.hasNextPage,
            'message': message,
          });

          return Right(PaginatedResponse(
            data: data,
            pagination: pagination,
          ));
        },
        error: (success, error, meta) {
          LoggingService.auth('Get batches failed - server error', {
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
      LoggingService.error('Get batches data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get batches response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get batches unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get batches failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, BatchModel>> createBatch(BatchRequestModel request) async {
    LoggingService.auth('Starting create batch process', {
      'itemId': request.itemId,
      'batchName': request.batchName,
    });
    try {
      final response = await _api.create(request);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create batch successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create batch failed - server error', {
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
      LoggingService.error('Create batch data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Create batch response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Create batch unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create batch failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, BatchModel>> updateBatch(int id, BatchRequestModel request) async {
    LoggingService.auth('Starting update batch process', {'id': id});
    try {
      final response = await _api.update(id, request);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Update batch successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update batch failed - server error', {
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
      LoggingService.error('Update batch data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Update batch response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Update batch unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update batch failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> transfer(
    BatchTransferRequestModel request,
  ) async {
    try {
      final response = await _api.transfer(request);
      return response.when(
        success: (_, message, __, ___, ____) {
          LoggingService.auth('Batch transfer successful', {'message': message});
          return const Right(null);
        },
        error: (_, error, __) {
          LoggingService.auth('Batch transfer failed', {
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
      LoggingService.error('Batch transfer unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Batch transfer failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> consolidation(
    BatchConsolidationRequestModel request,
  ) async {
    try {
      final response = await _api.consolidation(request);
      return response.when(
        success: (_, message, __, ___, ____) {
          LoggingService.auth('Batch consolidation successful', {'message': message});
          return const Right(null);
        },
        error: (_, error, __) {
          LoggingService.auth('Batch consolidation failed', {
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
      LoggingService.error('Batch consolidation unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Batch consolidation failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> split(BatchSplitRequestModel request) async {
    try {
      final response = await _api.split(request);
      return response.when(
        success: (_, message, __, ___, ____) {
          LoggingService.auth('Batch split successful', {'message': message});
          return const Right(null);
        },
        error: (_, error, __) {
          LoggingService.auth('Batch split failed', {
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
      LoggingService.error('Batch split unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Batch split failed: ${e.toString()}'));
    }
  }
}

