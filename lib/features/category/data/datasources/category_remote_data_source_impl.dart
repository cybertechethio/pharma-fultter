import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/category_model.dart';
import 'category_api_service.dart';
import 'category_remote_data_source.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final CategoryApiService _api;

  CategoryRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, PaginatedResponse<CategoryModel>>> getAll({
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    LoggingService.auth('Starting get categories process', {
      'page': page,
      'limit': limit,
      if (search != null) 'search': search,
    });
    try {
      final ApiResponse<List<CategoryModel>> response = await _api.getAll(
        page: page,
        limit: limit,
        search: search,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          // For paginated endpoints, pagination should exist
          // But we handle gracefully if it doesn't (for backward compatibility)
          if (pagination == null) {
            LoggingService.warning('Get categories: pagination data missing - endpoint may not support pagination');
            // If pagination is missing, we can't use pagination features
            // For category feature, we REQUIRE pagination, so return error
            return Left(Failure.unexpectedError('Pagination data is required for this endpoint'));
          }

          LoggingService.auth('Get categories successful', {
            'count': data.length,
            'currentPage': pagination.currentPage,
            'totalPages': pagination.totalPages,
            'hasNextPage': pagination.hasNextPage,
            'message': message,
            if (search != null) 'search': search,
          });

          return Right(PaginatedResponse(
            data: data,
            pagination: pagination,
          ));
        },
        error: (success, error, meta) {
          LoggingService.auth('Get categories failed - server error', {
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
      LoggingService.error('Get categories data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get categories response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get categories unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get categories failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, CategoryModel>> create({
    required String name,
    required String description,
  }) async {
    LoggingService.auth('Starting create category process', {
      'name': name,
    });
    try {
      final response = await _api.create(
        name: name,
        description: description,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          // pagination is null for create/update/delete operations, ignore it
          LoggingService.auth('Create category successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create category failed - server error', {
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
      LoggingService.error('Create category data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Create category response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Create category unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create category failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, CategoryModel>> update({
    required String id,
    required String name,
    required String description,
  }) async {
    LoggingService.auth('Starting update category process', {
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
          // pagination is null for create/update/delete operations, ignore it
          LoggingService.auth('Update category successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update category failed - server error', {
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
      LoggingService.error('Update category data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Update category response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Update category unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update category failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, CategoryModel>> delete({
    required String id,
  }) async {
    LoggingService.auth('Starting delete category process', {
      'id': id,
    });
    try {
      final response = await _api.delete(id: id);
      return response.when(
        success: (success, message, data, meta, pagination) {
          // pagination is null for create/update/delete operations, ignore it
          LoggingService.auth('Delete category successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Delete category failed - server error', {
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
      LoggingService.error('Delete category data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Delete category response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Delete category unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete category failed: ${e.toString()}'));
    }
  }
}

