import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../transaction/data/models/payment_method_model.dart';
import '../models/payment_method_request.dart';
import 'payment_method_api_service.dart';
import 'payment_method_remote_data_source.dart';

class PaymentMethodRemoteDataSourceImpl implements PaymentMethodRemoteDataSource {
  final PaymentMethodApiService _api;

  PaymentMethodRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, List<PaymentMethodModel>>> createPaymentMethod({
    required int paymentId,
    required PaymentMethodRequest request,
    String? attachmentFilePath,
  }) async {
    LoggingService.auth('Starting create payment method process', {
      'paymentId': paymentId,
    });
    try {
      final response = await _api.create(
        paymentId: paymentId,
        request: request,
        attachmentFilePath: attachmentFilePath,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create payment method successful', {
            'count': data.length,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create payment method failed - server error', {
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
      LoggingService.error('Create payment method data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Create payment method response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Create payment method unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create payment method failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, PaymentMethodModel>> updatePaymentMethod({
    required int paymentId,
    required int methodId,
    required PaymentMethodRequest request,
    String? attachmentFilePath,
  }) async {
    LoggingService.auth('Starting update payment method process', {
      'paymentId': paymentId,
      'methodId': methodId,
    });
    try {
      final response = await _api.update(
        paymentId: paymentId,
        methodId: methodId,
        request: request,
        attachmentFilePath: attachmentFilePath,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Update payment method successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update payment method failed - server error', {
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
      LoggingService.error('Update payment method data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Update payment method response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Update payment method unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update payment method failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deletePaymentMethod({
    required int paymentId,
    required int methodId,
  }) async {
    LoggingService.auth('Starting delete payment method process', {
      'paymentId': paymentId,
      'methodId': methodId,
    });
    try {
       await _api.delete(
        paymentId: paymentId,
        methodId: methodId,
      );
        return Right(null);
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } catch (e) {
      LoggingService.error('Delete payment method unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete payment method failed: ${e.toString()}'));
    }
  }
}

