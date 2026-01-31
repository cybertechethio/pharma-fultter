import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/bank_api_service.dart';
import '../../data/datasources/bank_remote_data_source.dart';
import '../../data/datasources/bank_remote_data_source_impl.dart';
import '../../data/repositories/bank_repository_impl.dart';
import '../../domain/repositories/bank_repository.dart';
import '../../domain/usecases/get_banks_usecase.dart';
import '../../domain/usecases/create_bank_usecase.dart';
import '../../domain/usecases/update_bank_usecase.dart';
import '../../domain/usecases/delete_bank_usecase.dart';

part 'bank_providers.g.dart';

@riverpod
BankApiService bankApiService(Ref ref) {
  return const BankApiService();
}

@riverpod
BankRemoteDataSource bankRemoteDataSource(Ref ref) {
  return BankRemoteDataSourceImpl(
    ref.watch(bankApiServiceProvider),
  );
}

@riverpod
BankRepository bankRepository(Ref ref) {
  return BankRepositoryImpl(
    ref.watch(bankRemoteDataSourceProvider),
  );
}

@riverpod
GetBanksUseCase getBanksUseCase(Ref ref) {
  return GetBanksUseCase(
    ref.watch(bankRepositoryProvider),
  );
}

@riverpod
CreateBankUseCase createBankUseCase(Ref ref) {
  return CreateBankUseCase(
    ref.watch(bankRepositoryProvider),
  );
}

@riverpod
UpdateBankUseCase updateBankUseCase(Ref ref) {
  return UpdateBankUseCase(
    ref.watch(bankRepositoryProvider),
  );
}

@riverpod
DeleteBankUseCase deleteBankUseCase(Ref ref) {
  return DeleteBankUseCase(
    ref.watch(bankRepositoryProvider),
  );
}

