import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/item_model.dart';
import '../models/item_request_model.dart';
import '../models/item_with_batches_model.dart';
import 'item_api_service.dart';
import 'item_remote_data_source.dart';

class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  final ItemApiService _api;

  ItemRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, PaginatedResponse<ItemModel>>> getItems({
    int page = 1,
    int limit = 25,
    String? search,
    int? categoryId,
  }) async {
    LoggingService.info('Starting get items process', {
      'page': page,
      'limit': limit,
      'search': search,
      'categoryId': categoryId,
    });
    try {
      final ApiResponse<List<ItemModel>> response = await _api.getAll(
        page: page,
        limit: limit,
        search: search,
        categoryId: categoryId,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          // For paginated endpoints, pagination should exist
          if (pagination == null) {
            LoggingService.warning('Get items: pagination data missing - endpoint may not support pagination');
            return Left(Failure.unexpectedError('Pagination data is required for this endpoint'));
          }

          LoggingService.info('Get items successful', {
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
          LoggingService.error('Get items failed - server error', {
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
      LoggingService.error('Get items data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get items response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get items unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get items failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, PaginatedResponse<ItemWithBatchesModel>>>
      getItemsIncludeBatches({
    int page = 1,
    int limit = 1000,
    String? search,
    int? categoryId,
  }) async {
    LoggingService.info('Starting get items include batches process', {
      'page': page,
      'limit': limit,
      'search': search,
      'categoryId': categoryId,
    });
    try {
      final ApiResponse<List<ItemWithBatchesModel>> response =
          await _api.getItemsIncludeBatches(
        page: page,
        limit: limit,
        search: search,
        categoryId: categoryId,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          if (pagination == null) {
            LoggingService.warning(
                'Get items include batches: pagination data missing');
            return Left(Failure.unexpectedError(
                'Pagination data is required for this endpoint'));
          }
          LoggingService.info('Get items include batches successful', {
            'count': data.length,
            'currentPage': pagination.currentPage,
            'message': message,
          });
          return Right(PaginatedResponse(
            data: data,
            pagination: pagination,
          ));
        },
        error: (success, error, meta) {
          LoggingService.error('Get items include batches failed - server error',
              {'error': error.message, 'code': error.statusCode});
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } on TypeError catch (e) {
      LoggingService.error(
          'Get items include batches data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error(
          'Get items include batches response format error',
          e,
          StackTrace.current);
      return Left(Failure.unexpectedError(
          'Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error(
          'Get items include batches unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError(
          'Get items include batches failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ItemModel>> createItem(ItemRequestModel request) async {
    LoggingService.info('Starting create item process', {
      'name': request.name,
      'code': request.code,
    });
    try {
      final response = await _api.create(request);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.info('Create item successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.error('Create item failed - server error', {
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
      LoggingService.error('Create item data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Create item response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Create item unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create item failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ItemModel>> updateItem({
    required int id,
    required ItemRequestModel request,
  }) async {
    LoggingService.info('Starting update item process', {
      'id': id,
    });
    try {
      final response = await _api.update(
        id: id,
        request: request,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.info('Update item successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.error('Update item failed - server error', {
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
      LoggingService.error('Update item data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Update item response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Update item unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update item failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ItemModel>> deleteItem({
    required int id,
  }) async {
    LoggingService.info('Starting delete item process', {
      'id': id,
    });
    try {
      final response = await _api.delete(id: id);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.info('Delete item successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.error('Delete item failed - server error', {
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
      LoggingService.error('Delete item data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Delete item response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Delete item unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete item failed: ${e.toString()}'));
    }
  }
}

