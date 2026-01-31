import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/expense_category_model.dart';
import 'expense_category_api_service.dart';
import 'expense_category_remote_data_source.dart';

class ExpenseCategoryRemoteDataSourceImpl implements ExpenseCategoryRemoteDataSource {
  final ExpenseCategoryApiService _api;

  ExpenseCategoryRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, List<ExpenseCategoryModel>>> getAll() async {
    LoggingService.auth('Starting get expense categories process');
    try {
      final ApiResponse<List<ExpenseCategoryModel>> response = await _api.getAll();
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get expense categories successful', {
            'count': data.length,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get expense categories failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } catch (e) {
      LoggingService.error('Get expense categories unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get expense categories failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ExpenseCategoryModel>> create({
    required String name,
    required String description,
  }) async {
    LoggingService.auth('Starting create expense category process', {
      'name': name,
      'description': description,
    });
    try {
      final ApiResponse<ExpenseCategoryModel> response = await _api.create(
        name: name,
        description: description,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create expense category successful', {
            'id': data.id,
            'name': data.name,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create expense category failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } catch (e) {
      LoggingService.error('Create expense category unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create expense category failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ExpenseCategoryModel>> update({
    required String id,
    required String name,
    required String description,
  }) async {
    LoggingService.auth('Starting update expense category process', {
      'id': id,
      'name': name,
      'description': description,
    });
    try {
      final ApiResponse<ExpenseCategoryModel> response = await _api.update(
        id: id,
        name: name,
        description: description,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Update expense category successful', {
            'id': data.id,
            'name': data.name,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update expense category failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } catch (e) {
      LoggingService.error('Update expense category unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update expense category failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ExpenseCategoryModel>> delete({
    required String id,
  }) async {
    LoggingService.auth('Starting delete expense category process', {
      'id': id,
    });
    try {
      final ApiResponse<ExpenseCategoryModel> response = await _api.delete(
        id: id,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Delete expense category successful', {
            'id': data.id,
            'name': data.name,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Delete expense category failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } catch (e) {
      LoggingService.error('Delete expense category unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete expense category failed: ${e.toString()}'));
    }
  }
}
