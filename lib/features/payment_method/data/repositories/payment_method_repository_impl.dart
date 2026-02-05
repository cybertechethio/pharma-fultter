import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../transaction/domain/entities/payment_method.dart';
import '../../../transaction/data/models/payment_method_model.dart';
import '../../../transaction/data/mappers/transaction_mapper.dart';
import '../../domain/repositories/payment_method_repository.dart';
import '../datasources/payment_method_remote_data_source.dart';
import '../models/payment_method_request.dart';

class PaymentMethodRepositoryImpl implements PaymentMethodRepository {
  final PaymentMethodRemoteDataSource _remote;

  PaymentMethodRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, List<PaymentMethod>>> createPaymentMethod({
    required int paymentId,
    required PaymentMethodRequest request,
    String? attachmentFilePath,
  }) async {
    // Validate request
    final validationError = request.validate();
    if (validationError != null) {
      return Left(Failure.validationError(validationError));
    }

    final response = await _remote.createPaymentMethod(
      paymentId: paymentId,
      request: request,
      attachmentFilePath: attachmentFilePath,
    );

    return response.fold(
      (failure) => Left(failure),
      (models) => Right(models.map((model) => model.toDomain()).toList()),
    );
  }

  @override
  Future<Either<Failure, PaymentMethod>> updatePaymentMethod({
    required int paymentId,
    required int methodId,
    required PaymentMethodRequest request,
    String? attachmentFilePath,
  }) async {
    // Validate request (for update, at least one field should be provided)
    final validationError = request.validate(isUpdate: true);
    if (validationError != null) {
      return Left(Failure.validationError(validationError));
    }

    final response = await _remote.updatePaymentMethod(
      paymentId: paymentId,
      methodId: methodId,
      request: request,
      attachmentFilePath: attachmentFilePath,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, void>> deletePaymentMethod({
    required int paymentId,
    required int methodId,
  }) async {
    final response = await _remote.deletePaymentMethod(
      paymentId: paymentId,
      methodId: methodId,
    );

    return response.fold(
      (failure) => Left(failure),
      (_) => const Right(null),
    );
  }
}

