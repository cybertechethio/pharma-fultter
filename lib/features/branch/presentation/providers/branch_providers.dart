import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/branch_api_service.dart';
import '../../data/datasources/branch_remote_data_source.dart';
import '../../data/datasources/branch_remote_data_source_impl.dart';
import '../../data/repositories/branch_repository_impl.dart';
import '../../domain/repositories/branch_repository.dart';
import '../../domain/usecases/create_branch_usecase.dart';
import '../../domain/usecases/get_branches_usecase.dart';
import '../../domain/usecases/update_branch_usecase.dart';
import '../../domain/usecases/delete_branch_usecase.dart';

part 'branch_providers.g.dart';

@Riverpod(keepAlive: true)
BranchApiService branchApiService(Ref ref) {
  return BranchApiService.create();
}

@Riverpod(keepAlive: true)
BranchRemoteDataSource branchRemoteDataSource(Ref ref) {
  return BranchRemoteDataSourceImpl(ref.watch(branchApiServiceProvider));
}

@Riverpod(keepAlive: true)
BranchRepository branchRepository(Ref ref) {
  return BranchRepositoryImpl(ref.watch(branchRemoteDataSourceProvider));
}

@Riverpod(keepAlive: true)
CreateBranchUseCase createBranchUseCase(Ref ref) {
  return CreateBranchUseCase(ref.watch(branchRepositoryProvider));
}

@Riverpod(keepAlive: true)
GetBranchesUseCase getBranchesUseCase(Ref ref) {
  return GetBranchesUseCase(ref.watch(branchRepositoryProvider));
}

@Riverpod(keepAlive: true)
UpdateBranchUseCase updateBranchUseCase(Ref ref) {
  return UpdateBranchUseCase(ref.watch(branchRepositoryProvider));
}

@Riverpod(keepAlive: true)
DeleteBranchUseCase deleteBranchUseCase(Ref ref) {
  return DeleteBranchUseCase(ref.watch(branchRepositoryProvider));
}

// BranchNotifier is defined in branch_notifier.dart
// The branchProvider is generated in branch_notifier.g.dart
