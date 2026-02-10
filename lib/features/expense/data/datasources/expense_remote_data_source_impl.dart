import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/expense_model.dart';
import '../models/expense_detail_model.dart';
import 'expense_api_service.dart';
import 'expense_remote_data_source.dart';

class ExpenseRemoteDataSourceImpl implements ExpenseRemoteDataSource {
  final ExpenseApiService _api;

  ExpenseRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, ExpenseModel>> create({
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentFilePaths,
    required List<Map<String, dynamic>> paymentMethods,
  }) async {
    LoggingService.auth('Starting create expense process', {
      'expenseDate': expenseDate.toIso8601String(),
      'name': name,
      'paymentMethodsCount': paymentMethods.length,
    });
    try {
      final ApiResponse<ExpenseModel> response = await _api.create(
        expenseDate: expenseDate,
        name: name,
        notes: notes,
        attachmentFilePaths: attachmentFilePaths,
        paymentMethods: paymentMethods,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create expense successful', {
            'id': data.id,
            'name': data.name,
            'amount': data.amount.toString(),
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create expense failed - server error', {
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
      LoggingService.error('Create expense unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create expense failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, PaginatedResponse<ExpenseModel>>> getAll({
    int page = 1,
    int limit = 25,
    DateTime? fromDate,
    DateTime? toDate,
    String? search,
    int? branchId,
  }) async {
    LoggingService.auth('Starting get expenses process', {
      'page': page,
      'limit': limit,
      'fromDate': fromDate?.toIso8601String(),
      'toDate': toDate?.toIso8601String(),
      'search': search,
      'branchId': branchId,
    });
    try {
      final ApiResponse<List<ExpenseModel>> response = await _api.getAll(
        page: page,
        limit: limit,
        fromDate: fromDate,
        toDate: toDate,
        search: search,
        branchId: branchId,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          if (pagination == null) {
            LoggingService.warning('Get expenses: pagination data missing - endpoint may not support pagination');
            return Left(Failure.unexpectedError('Pagination data is required for this endpoint'));
          }

          LoggingService.auth('Get expenses successful', {
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
          LoggingService.auth('Get expenses failed - server error', {
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
      LoggingService.error('Get expenses unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get expenses failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ExpenseDetailModel>> getById({
    required String id,
  }) async {
    LoggingService.auth('Starting get expense by id process', {
      'id': id,
    });
    try {
      final ApiResponse<ExpenseDetailModel> response = await _api.getById(id: id);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get expense by id successful', {
            'id': data.id,
            'name': data.name,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get expense by id failed - server error', {
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
      LoggingService.error('Get expense by id unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get expense by id failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ExpenseModel>> update({
    required String id,
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentUrls,
    required List<String>? attachmentFilePaths,
  }) async {
    LoggingService.auth('Starting update expense process', {
      'id': id,
      'name': name,
      'existingAttachments': attachmentUrls?.length ?? 0,
      'newFiles': attachmentFilePaths?.length ?? 0,
    });
    try {
      final ApiResponse<ExpenseModel> response = await _api.update(
        id: id,
        expenseDate: expenseDate,
        name: name,
        notes: notes,
        attachmentUrls: attachmentUrls,
        attachmentFilePaths: attachmentFilePaths,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Update expense successful', {
            'id': data.id,
            'name': data.name,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update expense failed - server error', {
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
      LoggingService.error('Update expense unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update expense failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ExpenseModel>> delete({
    required String id,
  }) async {
    LoggingService.auth('Starting delete expense process', {
      'id': id,
    });
    try {
      final ApiResponse<ExpenseModel> response = await _api.delete(id: id);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Delete expense successful', {
            'id': data.id,
            'name': data.name,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Delete expense failed - server error', {
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
      LoggingService.error('Delete expense unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete expense failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> createPaymentMethod({
    required String expenseId,
    required String method,
    required String amount,
    String? referenceNumber,
    int? bankId,
    String? attachment,
  }) async {
    LoggingService.auth('Starting create expense payment method process', {
      'expenseId': expenseId,
      'method': method,
      'amount': amount,
      'referenceNumber': referenceNumber,
      'bankId': bankId,
      'attachment': attachment,
    });
    try {
      final ApiResponse<ExpensePaymentMethodModel> response = await _api.createPaymentMethod(
        expenseId: expenseId,
        method: method,
        amount: amount,
        referenceNumber: referenceNumber,
        bankId: bankId,
        attachment: attachment,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create expense payment method successful', {
            'id': data.id,
            'method': data.method,
            'message': message,
          });
          return Right(unit);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create expense payment method failed - server error', {
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
      LoggingService.error('Create expense payment method unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create expense payment method failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePaymentMethod({
    required String expenseId,
    required String paymentMethodId,
    String? method,
    String? amount,
    String? referenceNumber,
    int? bankId,
    String? attachment,
  }) async {
    LoggingService.auth('Starting update expense payment method process', {
      'expenseId': expenseId,
      'paymentMethodId': paymentMethodId,
      'method': method,
      'amount': amount,
      'referenceNumber': referenceNumber,
      'bankId': bankId,
      'attachment': attachment,
    });
    try {
      final ApiResponse<ExpensePaymentMethodModel> response = await _api.updatePaymentMethod(
        expenseId: expenseId,
        paymentMethodId: paymentMethodId,
        method: method,
        amount: amount,
        referenceNumber: referenceNumber,
        bankId: bankId,
        attachment: attachment,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Update expense payment method successful', {
            'id': data.id,
            'method': data.method,
            'message': message,
          });
          return Right(unit);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update expense payment method failed - server error', {
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
      LoggingService.error('Update expense payment method unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update expense payment method failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePaymentMethod({
    required String expenseId,
    required String paymentMethodId,
  }) async {
    LoggingService.auth('Starting delete expense payment method process', {
      'expenseId': expenseId,
      'paymentMethodId': paymentMethodId,
    });
    try {
      final ApiResponse<ExpensePaymentMethodModel> response = await _api.deletePaymentMethod(
        expenseId: expenseId,
        paymentMethodId: paymentMethodId,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Delete expense payment method successful', {
            'id': data.id,
            'method': data.method,
            'message': message,
          });
          return Right(unit);
        },
        error: (success, error, meta) {
          LoggingService.auth('Delete expense payment method failed - server error', {
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
      LoggingService.error('Delete expense payment method unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete expense payment method failed: ${e.toString()}'));
    }
  }
}
