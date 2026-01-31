import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/transfer_api_service.dart';
import '../../data/datasources/transfer_remote_data_source.dart';
import '../../data/datasources/transfer_remote_data_source_impl.dart';
import '../../data/repositories/transfer_repository_impl.dart';
import '../../domain/repositories/transfer_repository.dart';
import '../../domain/usecases/get_transfers_usecase.dart';
import '../../domain/usecases/get_transfer_detail_usecase.dart';
import '../../domain/usecases/create_transfer_usecase.dart';

part 'transfer_providers.g.dart';

// ==================== API Service ====================

@riverpod
TransferApiService transferApiService(Ref ref) {
  return TransferApiService.create();
}

// ==================== Data Sources ====================

@riverpod
TransferRemoteDataSource transferRemoteDataSource(Ref ref) {
  final apiService = ref.watch(transferApiServiceProvider);
  return TransferRemoteDataSourceImpl(apiService);
}

// ==================== Repository ====================

@riverpod
TransferRepository transferRepository(Ref ref) {
  final remoteDataSource = ref.watch(transferRemoteDataSourceProvider);
  return TransferRepositoryImpl(remoteDataSource);
}

// ==================== Use Cases ====================

@riverpod
GetTransfersUseCase getTransfersUseCase(Ref ref) {
  final repository = ref.watch(transferRepositoryProvider);
  return GetTransfersUseCase(repository);
}

@riverpod
GetTransferDetailUseCase getTransferDetailUseCase(Ref ref) {
  final repository = ref.watch(transferRepositoryProvider);
  return GetTransferDetailUseCase(repository);
}

@riverpod
CreateTransferUseCase createTransferUseCase(Ref ref) {
  final repository = ref.watch(transferRepositoryProvider);
  return CreateTransferUseCase(repository);
}

