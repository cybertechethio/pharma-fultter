import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/transaction_api_service.dart';
import '../../data/datasources/transaction_remote_data_source.dart';
import '../../data/datasources/transaction_remote_data_source_impl.dart';
import '../../data/repositories/transaction_repository_impl.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/usecases/create_transaction_usecase.dart';
import '../../domain/usecases/get_transactions_usecase.dart';
import '../../domain/usecases/get_transaction_detail_usecase.dart';
import '../../domain/usecases/reverse_transaction_usecase.dart';

part 'transaction_providers.g.dart';

@riverpod
TransactionApiService transactionApiService(Ref ref) {
  return TransactionApiService.create();
}

@riverpod
TransactionRemoteDataSource transactionRemoteDataSource(Ref ref) {
  return TransactionRemoteDataSourceImpl(
    ref.watch(transactionApiServiceProvider),
  );
}

@riverpod
TransactionRepository transactionRepository(Ref ref) {
  return TransactionRepositoryImpl(
    ref.watch(transactionRemoteDataSourceProvider),
  );
}

@riverpod
CreateTransactionUseCase createTransactionUseCase(Ref ref) {
  return CreateTransactionUseCase(
    ref.watch(transactionRepositoryProvider),
  );
}

@riverpod
GetTransactionsUseCase getTransactionsUseCase(Ref ref) {
  return GetTransactionsUseCase(
    ref.watch(transactionRepositoryProvider),
  );
}

@riverpod
GetTransactionDetailUseCase getTransactionDetailUseCase(Ref ref) {
  return GetTransactionDetailUseCase(
    ref.watch(transactionRepositoryProvider),
  );
}

@riverpod
ReverseTransactionUseCase reverseTransactionUseCase(Ref ref) {
  return ReverseTransactionUseCase(
    ref.watch(transactionRepositoryProvider),
  );
}

