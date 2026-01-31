import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/transfer_model.dart';
import '../models/transfer_response_model.dart';
import 'transfer_api_service.dart';
import 'transfer_remote_data_source.dart';

class TransferRemoteDataSourceImpl implements TransferRemoteDataSource {
  final TransferApiService _api;

  TransferRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, List<TransferResponseModel>>> getTransfers({
    int page = 1,
    int limit = 25,
  }) async {
    LoggingService.auth('Starting get transfers process');
    try {
      final ApiResponse<List<TransferResponseModel>> response = await _api.getAll(
        page: page,
        limit: limit,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get transfers successful', {
            'count': data.length,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get transfers failed - server error', {
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
      LoggingService.error('Get transfers data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get transfers response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get transfers unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get transfers failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, TransferResponseModel>> getTransferDetail(int id) async {
    LoggingService.auth('Starting get transfer detail process', {'id': id});
    try {
      final ApiResponse<TransferResponseModel> response = await _api.getById(id);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get transfer detail successful', {
            'id': data.id,
            'transferNumber': data.transferNumber,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get transfer detail failed - server error', {
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
      LoggingService.error('Get transfer detail unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get transfer detail failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, TransferResponseModel>> createTransfer({
    required TransferModel request,
  }) async {
    LoggingService.auth('Starting create transfer process');
    try {
      final ApiResponse<TransferResponseModel> response = await _api.create(
        request: request,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create transfer successful', {
            'id': data.id,
            'transferNumber': data.transferNumber,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create transfer failed - server error', {
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
      LoggingService.error('Create transfer unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create transfer failed: ${e.toString()}'));
    }
  }
}













