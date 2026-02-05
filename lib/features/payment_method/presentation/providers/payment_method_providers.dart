import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/payment_method_api_service.dart';
import '../../data/datasources/payment_method_remote_data_source.dart';
import '../../data/datasources/payment_method_remote_data_source_impl.dart';
import '../../data/repositories/payment_method_repository_impl.dart';
import '../../domain/repositories/payment_method_repository.dart';
import '../../domain/usecases/create_payment_method_usecase.dart';
import '../../domain/usecases/update_payment_method_usecase.dart';
import '../../domain/usecases/delete_payment_method_usecase.dart';

part 'payment_method_providers.g.dart';

@Riverpod(keepAlive: true)
PaymentMethodApiService paymentMethodApiService(Ref ref) {
  return PaymentMethodApiService.create();
}

@Riverpod(keepAlive: true)
PaymentMethodRemoteDataSource paymentMethodRemoteDataSource(Ref ref) {
  return PaymentMethodRemoteDataSourceImpl(
    ref.watch(paymentMethodApiServiceProvider),
  );
}

@Riverpod(keepAlive: true)
PaymentMethodRepository paymentMethodRepository(Ref ref) {
  return PaymentMethodRepositoryImpl(
    ref.watch(paymentMethodRemoteDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
CreatePaymentMethodUseCase createPaymentMethodUseCase(Ref ref) {
  return CreatePaymentMethodUseCase(
    ref.watch(paymentMethodRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
UpdatePaymentMethodUseCase updatePaymentMethodUseCase(Ref ref) {
  return UpdatePaymentMethodUseCase(
    ref.watch(paymentMethodRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
DeletePaymentMethodUseCase deletePaymentMethodUseCase(Ref ref) {
  return DeletePaymentMethodUseCase(
    ref.watch(paymentMethodRepositoryProvider),
  );
}

