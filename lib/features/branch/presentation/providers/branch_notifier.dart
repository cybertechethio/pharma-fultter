import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/branch.dart';
import 'branch_providers.dart';
import 'branch_events.dart';
import 'branch_loading_providers.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

part 'branch_notifier.g.dart';

@Riverpod(keepAlive: true)
class BranchNotifier extends _$BranchNotifier {
  @override
  Future<List<Branch>> build() async {
    return await _load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load());
  }

  Future<void> createBranch(String name) async {
    final createLoading = ref.read(branchCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createBranchUseCaseProvider);
    final result = await useCase.call(name: name);

    await result.fold(
      (failure) async {
        ref.read(branchUiEventsProvider.notifier).emit(BranchFailure(failure));
      },
      (created) async {
        final current = state.value ?? const <Branch>[];
        final updatedList = [created, ...current];
        state = AsyncValue.data(updatedList);
        
        // Update local storage after backend success
        // Get all branches from local storage, add new one, and save
        final localDataSource = await ref.read(authLocalDataSourceProvider.future);
        final allBranches = await localDataSource.getBranches();
        // Check if branch already exists (shouldn't, but to be safe)
        if (!allBranches.any((b) => b.id == created.id)) {
          allBranches.add(created);
        }
        await localDataSource.saveBranches(allBranches);
        ref.invalidate(localBranchesProviderProvider);
        
        ref.read(branchUiEventsProvider.notifier).emit(
          BranchCreated(created, 'Branch created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateBranch(String branchId, String name) async {
    final updating = ref.read(branchUpdateLoadingProvider.notifier);
    updating.start(branchId);
    final useCase = ref.read(updateBranchUseCaseProvider);
    final result = await useCase.call(branchId: branchId, name: name);

    await result.fold(
      (failure) async {
        ref.read(branchUiEventsProvider.notifier).emit(BranchFailure(failure));
      },
      (updated) async {
        final list = List<Branch>.from(state.value ?? const <Branch>[]);
        final idx = list.indexWhere((e) => e.id == branchId);
        if (idx != -1) list[idx] = updated;
        state = AsyncValue.data(list);
        
        // Update local storage after backend success
        // Get all branches from local storage, update the one, and save
        final localDataSource = await ref.read(authLocalDataSourceProvider.future);
        final allBranches = await localDataSource.getBranches();
        final branchIdx = allBranches.indexWhere((b) => b.id == branchId);
        if (branchIdx != -1) {
          allBranches[branchIdx] = updated;
        } else {
          // If not found, add it (shouldn't happen, but to be safe)
          allBranches.add(updated);
        }
        await localDataSource.saveBranches(allBranches);
        ref.invalidate(localBranchesProviderProvider);
        
        ref.read(branchUiEventsProvider.notifier).emit(
          BranchUpdated(updated, 'Branch updated successfully'),
        );
      },
    );

    updating.stop(branchId);
  }

  Future<void> deleteBranch(String branchId) async {
    final deleting = ref.read(branchDeleteLoadingProvider.notifier);
    deleting.start(branchId);

    final useCase = ref.read(deleteBranchUseCaseProvider);
    final result = await useCase.call(branchId: branchId);

    await result.fold(
      (failure) async {
        ref.read(branchUiEventsProvider.notifier).emit(BranchFailure(failure));
      },
      (deletedEntity) async {
        final list = List<Branch>.from(state.value ?? const <Branch>[]);
        list.removeWhere((e) => e.id == branchId);
        state = AsyncValue.data(list);
        
        // Update local storage after backend success
        // Get all branches from local storage, remove the deleted one, and save
        final localDataSource = await ref.read(authLocalDataSourceProvider.future);
        final allBranches = await localDataSource.getBranches();
        allBranches.removeWhere((b) => b.id == branchId);
        await localDataSource.saveBranches(allBranches);
        ref.invalidate(localBranchesProviderProvider);
        
        ref.read(branchUiEventsProvider.notifier).emit(
          BranchDeleted(branchId, 'Branch deleted successfully'),
        );
      },
    );

    deleting.stop(branchId);
  }

  Future<List<Branch>> _load() async {
    final useCase = ref.read(getBranchesUseCaseProvider);
    final result = await useCase.call();
    return result.fold(
      (failure) {
        throw failure;
      },
      (items) {
        // Save fetched branches to local storage to keep drawer in sync
        // Do this asynchronously without blocking the return
        _saveBranchesToLocalStorage(items);
        return items;
      },
    );
  }

  Future<void> _saveBranchesToLocalStorage(List<Branch> branches) async {
    try {
      final localDataSource = await ref.read(authLocalDataSourceProvider.future);
      await localDataSource.saveBranches(branches);
      // Invalidate local branches provider to trigger drawer refresh
      ref.invalidate(localBranchesProviderProvider);
    } catch (e) {
      // Log error but don't fail the load operation
      // Local storage update failure shouldn't prevent branches from being displayed
      // The drawer will show stale data, but branches list will be correct
    }
  }
}