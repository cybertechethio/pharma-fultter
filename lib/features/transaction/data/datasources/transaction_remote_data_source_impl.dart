import 'package:cyber_pos/core/enums/transaction_type_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/create_trans_request.dart';
import '../models/transaction_model.dart';
import 'transaction_api_service.dart';
import 'transaction_remote_data_source.dart';

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final TransactionApiService _api;

  TransactionRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, PaginatedResponse<TransactionModel>>> getTransactions({
    int page = 1,
    int limit = 25,
    TransactionType? transactionType,
  }) async {
    LoggingService.auth('Starting get transactions process', {
      'page': page,
      'limit': limit,
      'transactionType': transactionType?.name,
    });
    try {
      final ApiResponse<List<TransactionModel>> response = await _api.getAll(
        page: page,
        limit: limit,
        transactionType: transactionType,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          // For paginated endpoints, pagination should exist
          if (pagination == null) {
            LoggingService.warning('Get transactions: pagination data missing - endpoint may not support pagination');
            return Left(Failure.unexpectedError('Pagination data is required for this endpoint'));
          }

          LoggingService.auth('Get transactions successful', {
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
          LoggingService.auth('Get transactions failed - server error', {
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
      LoggingService.error('Get transactions data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get transactions response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get transactions unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get transactions failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, TransactionModel>> getTransactionDetail(int id) async {
    LoggingService.auth('Starting get transaction detail process', {'id': id});
    try {
      final ApiResponse<TransactionModel> response = await _api.getById(id);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get transaction detail successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get transaction detail failed - server error', {
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
      LoggingService.error('Get transaction detail data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get transaction detail response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get transaction detail unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get transaction detail failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, TransactionModel>> createTransaction({
    required CreateTransRequest request,
    required List<String> receiptFilePaths,
    required Map<String, String> paymentAttachmentFilePaths,
  }) async {
    

    try {
      final ApiResponse<TransactionModel> response = await _api.create(
        request: request,
        receiptFilePaths: receiptFilePaths,
        paymentAttachmentFilePaths: paymentAttachmentFilePaths,
      );

      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create transaction successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create transaction failed - server error', {
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
      LoggingService.error('Create transaction data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Create transaction response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Create transaction unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create transaction failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, TransactionModel>> reverseTransaction({
    required TransactionType transactionType,
    required int reversesTransactionId,
    String? notes,
  }) async {
    LoggingService.auth('Starting reverse transaction process', {
      'transactionType': transactionType.name,
      'reversesTransactionId': reversesTransactionId,
      'hasNotes': notes?.isNotEmpty ?? false,
    });

    try {
      final ApiResponse<TransactionModel> response = await _api.reverseTransaction(
        transactionType: transactionType,
        reversesTransactionId: reversesTransactionId,
        notes: notes,
      );

      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Reverse transaction successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Reverse transaction failed - server error', {
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
      LoggingService.error('Reverse transaction data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Reverse transaction response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Reverse transaction unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Reverse transaction failed: ${e.toString()}'));
    }
  }
}

