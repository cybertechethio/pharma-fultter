import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../transaction/data/models/transaction_model.dart';
import '../models/supplier_customer_model.dart';
import '../models/supplier_customer_payment_request.dart';
import 'supplier_customer_api_service.dart';
import 'supplier_customer_remote_data_source.dart';

class SupplierCustomerRemoteDataSourceImpl implements SupplierCustomerRemoteDataSource {
  final SupplierCustomerApiService _api;

  SupplierCustomerRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, List<SupplierCustomerModel>>> getAll({
    String? search,
    String? type,
  }) async {
    LoggingService.auth('Starting get supplier/customers process', {
      if (search != null) 'search': search,
      if (type != null) 'type': type,
    });
    try {
      final ApiResponse<List<SupplierCustomerModel>> response = await _api.getAll(
        search: search,
        type: type,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get supplier/customers successful', {
            'count': data.length,
            'message': message,
            if (search != null) 'search': search,
            if (type != null) 'type': type,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get supplier/customers failed - server error', {
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
      LoggingService.error('Get supplier/customers data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get supplier/customers response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get supplier/customers unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get supplier/customers failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, SupplierCustomerModel>> create({
    required String name,
    required String phone,
    required String accountCode,
    required String tinNumber,
    required String type,
  }) async {
    LoggingService.auth('Starting create supplier/customer process', {
      'name': name,
      'type': type,
    });
    try {
      final response = await _api.create(
        name: name,
        phone: phone,
        accountCode: accountCode,
        tinNumber: tinNumber,
        type: type,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create supplier/customer successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create supplier/customer failed - server error', {
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
      LoggingService.error('Create supplier/customer data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Create supplier/customer response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Create supplier/customer unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create supplier/customer failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, SupplierCustomerModel>> update({
    required String id,
    required String name,
    required String phone,
    required String accountCode,
    required String tinNumber,
    required String type,
  }) async {
    LoggingService.auth('Starting update supplier/customer process', {
      'id': id,
      'type': type,
    });
    try {
      final response = await _api.update(
        id: id,
        name: name,
        phone: phone,
        accountCode: accountCode,
        tinNumber: tinNumber,
        type: type,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Update supplier/customer successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update supplier/customer failed - server error', {
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
      LoggingService.error('Update supplier/customer data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Update supplier/customer response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Update supplier/customer unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update supplier/customer failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, SupplierCustomerModel>> delete({
    required String id,
  }) async {
    LoggingService.auth('Starting delete supplier/customer process', {
      'id': id,
    });
    try {
      final response = await _api.delete(id: id);
      return response.when(
        success: (success, message, data, meta, pagination  ) {
          LoggingService.auth('Delete supplier/customer successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Delete supplier/customer failed - server error', {
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
      LoggingService.error('Delete supplier/customer data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Delete supplier/customer response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Delete supplier/customer unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete supplier/customer failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, SupplierCustomerModel>> getById({
    required String id,
  }) async {
    LoggingService.auth('Starting get supplier/customer by ID', {'id': id});
    try {
      final response = await _api.getById(id: id);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get supplier/customer by ID successful', {
            'id': data.id,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get supplier/customer by ID failed - server error', {
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
      LoggingService.error('Get supplier/customer by ID data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get supplier/customer by ID response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get supplier/customer by ID unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get supplier/customer failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> addBalance({
    required SupplierCustomerPaymentRequest request,
    required Map<String, String> paymentAttachmentFilePaths,
  }) async {
    LoggingService.auth('Starting add balance process', {'customerId': request.customerId});
    try {
      await _api.addBalance(
        request: request,
        paymentAttachmentFilePaths: paymentAttachmentFilePaths,
      );

      LoggingService.auth('Add balance successful', {'customerId': request.customerId});
      return const Right(unit);
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } catch (e) {
      LoggingService.error('Add balance unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Add balance failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> refund({
    required SupplierCustomerPaymentRequest request,
    required Map<String, String> paymentAttachmentFilePaths,
  }) async {
    LoggingService.auth('Starting refund process', {
      'customerId': request.customerId,
      'supplierId': request.supplierId,
    });
    try {
      await _api.refund(
        request: request,
        paymentAttachmentFilePaths: paymentAttachmentFilePaths,
      );

      LoggingService.auth('Refund successful', {
        'customerId': request.customerId,
        'supplierId': request.supplierId,
      });
      return const Right(unit);
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } catch (e) {
      LoggingService.error('Refund unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Refund failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<TransactionModel>>> getTransactions({
    required String supplierCustomerId,
  }) async {
    LoggingService.auth('Starting get supplier/customer transactions', {
      'supplierCustomerId': supplierCustomerId,
    });
    try {
      final response = await _api.getTransactions(
        supplierCustomerId: supplierCustomerId,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get transactions successful', {
            'supplierCustomerId': supplierCustomerId,
            'count': data.length,
            'message': message,
          });
          return Right(data);
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
}


