import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/sub_category_model.dart';
import 'sub_category_api_service.dart';
import 'sub_category_remote_data_source.dart';

class SubCategoryRemoteDataSourceImpl implements SubCategoryRemoteDataSource {
  final SubCategoryApiService _api;

  SubCategoryRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, PaginatedResponse<SubCategoryModel>>> getAll({
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    LoggingService.auth('Starting get sub-categories process', {
      'page': page,
      'limit': limit,
      if (search != null) 'search': search,
    });
    try {
      final ApiResponse<List<SubCategoryModel>> response = await _api.getAll(
        page: page,
        limit: limit,
        search: search,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          // For paginated endpoints, pagination should exist
          if (pagination == null) {
            LoggingService.warning('Get sub-categories: pagination data missing - endpoint may not support pagination');
            return Left(Failure.unexpectedError('Pagination data is required for this endpoint'));
          }

          LoggingService.auth('Get sub-categories successful', {
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
          LoggingService.auth('Get sub-categories failed - server error', {
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
      LoggingService.error('Get sub-categories data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get sub-categories response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get sub-categories unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get sub-categories failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, PaginatedResponse<SubCategoryModel>>> getByCategory({
    required String categoryId,
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    LoggingService.auth('Starting get sub-categories by category process', {
      'categoryId': categoryId,
      'page': page,
      'limit': limit,
      if (search != null) 'search': search,
    });
    try {
      final ApiResponse<List<SubCategoryModel>> response = await _api.getByCategory(
        categoryId: categoryId,
        page: page,
        limit: limit,
        search: search,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          // For paginated endpoints, pagination should exist
          if (pagination == null) {
            LoggingService.warning('Get sub-categories by category: pagination data missing - endpoint may not support pagination');
            return Left(Failure.unexpectedError('Pagination data is required for this endpoint'));
          }

          LoggingService.auth('Get sub-categories by category successful', {
            'categoryId': categoryId,
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
          LoggingService.auth('Get sub-categories by category failed - server error', {
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
      LoggingService.error('Get sub-categories by category data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get sub-categories by category response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get sub-categories by category unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get sub-categories by category failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, SubCategoryModel>> create({
    required String name,
    required int categoryId,
    required String description,
  }) async {
    LoggingService.auth('Starting create sub-category process', {
      'name': name,
      'categoryId': categoryId,
    });
    try {
      final response = await _api.create(
        name: name,
        categoryId: categoryId,
        description: description,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create sub-category successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create sub-category failed - server error', {
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
      LoggingService.error('Create sub-category data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Create sub-category response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Create sub-category unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create sub-category failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, SubCategoryModel>> update({
    required String id,
    required String name,
    required int categoryId,
    required String description,
  }) async {
    LoggingService.auth('Starting update sub-category process', {
      'id': id,
    });
    try {
      final response = await _api.update(
        id: id,
        name: name,
        categoryId: categoryId,
        description: description,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Update sub-category successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update sub-category failed - server error', {
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
      LoggingService.error('Update sub-category data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Update sub-category response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Update sub-category unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update sub-category failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, SubCategoryModel>> delete({
    required String id,
  }) async {
    LoggingService.auth('Starting delete sub-category process', {
      'id': id,
    });
    try {
      final response = await _api.delete(id: id);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Delete sub-category successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Delete sub-category failed - server error', {
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
      LoggingService.error('Delete sub-category data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Delete sub-category response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Delete sub-category unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete sub-category failed: ${e.toString()}'));
    }
  }
}

