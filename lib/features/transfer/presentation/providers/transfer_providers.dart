import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/transfer_api_service.dart';
import '../../data/datasources/transfer_remote_data_source.dart';
import '../../data/datasources/transfer_remote_data_source_impl.dart';
import '../../data/repositories/transfer_repository_impl.dart';
import '../../domain/repositories/transfer_repository.dart';
import '../../domain/usecases/create_transfer_usecase.dart';
import '../../domain/usecases/get_transfers_usecase.dart';
import '../../domain/usecases/get_transfer_detail_usecase.dart';
import '../../domain/usecases/update_transfer_status_usecase.dart';

part 'transfer_providers.g.dart';

@riverpod
TransferApiService transferApiService(Ref ref) {
  return TransferApiService.create();
}

@riverpod
TransferRemoteDataSource transferRemoteDataSource(Ref ref) {
  return TransferRemoteDataSourceImpl(
    ref.watch(transferApiServiceProvider),
  );
}

@riverpod
TransferRepository transferRepository(Ref ref) {
  return TransferRepositoryImpl(
    ref.watch(transferRemoteDataSourceProvider),
  );
}

@riverpod
CreateTransferUseCase createTransferUseCase(Ref ref) {
  return CreateTransferUseCase(
    ref.watch(transferRepositoryProvider),
  );
}

@riverpod
GetTransfersUseCase getTransfersUseCase(Ref ref) {
  return GetTransfersUseCase(
    ref.watch(transferRepositoryProvider),
  );
}

@riverpod
GetTransferDetailUseCase getTransferDetailUseCase(Ref ref) {
  return GetTransferDetailUseCase(
    ref.watch(transferRepositoryProvider),
  );
}

@riverpod
UpdateTransferStatusUseCase updateTransferStatusUseCase(Ref ref) {
  return UpdateTransferStatusUseCase(
    ref.watch(transferRepositoryProvider),
  );
}

