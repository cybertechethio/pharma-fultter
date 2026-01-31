import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/current_context.dart';
import 'auth_providers.dart';

part 'current_context_provider.g.dart';

@riverpod
class CurrentContextNotifier extends _$CurrentContextNotifier {
  @override
  Future<CurrentContext?> build() async {
    try {
      // Wait for Isar database to be ready
      await ref.read(isarDatabaseProvider.future);
      
    final localDataSource = await ref.read(authLocalDataSourceProvider.future);
    return await localDataSource.getCurrentContext();
    } catch (e, stackTrace) {
      // If there's an error (e.g., SharedPreferences not ready, JSON parsing error, etc.)
      // Log it for debugging but return null gracefully
      // This allows the UI to show "No context" instead of "Error loading context"
      LoggingService.error('Failed to load current context in provider', e, stackTrace);
      return null;
    }
  }

  Future<void> updateContext(CurrentContext context) async {
    final localDataSource = await ref.read(authLocalDataSourceProvider.future);
    await localDataSource.saveCurrentContext(context);
    state = AsyncValue.data(context);
  }

  Future<void> setCompany(String companyId) async {
    final localDataSource = await ref.read(authLocalDataSourceProvider.future);
    final snackbarService = ref.read(snackbarServiceProvider);
    
    // Create new context optimistically
    final optimisticContext = CurrentContext(
      currentCompanyId: companyId,
      currentBranchId: null, // Clear branch when company changes
    );
    
    // 1. Update local storage immediately (optimistic update)
    await localDataSource.saveCurrentContext(optimisticContext);
    
    // 2. Update UI state immediately (user sees change instantly)
    state = AsyncValue.data(optimisticContext);
    
    // 3. Call backend asynchronously in background (don't wait)
    unawaited(
      ref.read(switchCompanyUseCaseProvider.future).then((switchUseCase) {
        return switchUseCase.call(companyId: companyId);
      }).then(
        (result) {
          result.fold(
            (failure) {
              // Backend failed - show error but keep optimistic update
              snackbarService.showError(
                Failure.unexpectedError('failedToSyncCompanySwitch'),
              );
            },
            (context) {
              // Backend success - update with server response (might have different branch_id)
              // This ensures we're in sync with backend
              localDataSource.saveCurrentContext(context);
              state = AsyncValue.data(context);
            },
          );
        },
      ),
    );
  }

  Future<void> setBranch(String branchId) async {
    final localDataSource = await ref.read(authLocalDataSourceProvider.future);
    final snackbarService = ref.read(snackbarServiceProvider);
    
    // Get current context - load from storage if state is not available
    CurrentContext? current = state.value;
    if (current == null) {
      current = await localDataSource.getCurrentContext();
    }
    
    // Create new context optimistically - preserve company ID
    final optimisticContext = CurrentContext(
      currentCompanyId: current?.currentCompanyId, // Keep existing company
      currentBranchId: branchId,
    );
    
    // 1. Update local storage immediately (optimistic update)
    await localDataSource.saveCurrentContext(optimisticContext);
    
    // 2. Update UI state immediately (user sees change instantly)
    state = AsyncValue.data(optimisticContext);
    
    // 3. Call backend asynchronously in background (don't wait)
    unawaited(
      ref.read(switchBranchUseCaseProvider.future).then((switchUseCase) {
        return switchUseCase.call(branchId: branchId);
      }).then(
        (result) {
          result.fold(
            (failure) {
              // Backend failed - show error but keep optimistic update
              snackbarService.showError(
                Failure.unexpectedError('failedToSyncBranchSwitch'),
              );
            },
            (context) {
              // Backend success - merge with optimistic update to preserve company ID
              // When switching branch, company ID should never change
              // Only use backend's company ID if we didn't have one in optimistic update
              final mergedContext = CurrentContext(
                currentCompanyId: optimisticContext.currentCompanyId ?? context.currentCompanyId,
                currentBranchId: context.currentBranchId ?? branchId,
              );
              localDataSource.saveCurrentContext(mergedContext);
              state = AsyncValue.data(mergedContext);
            },
          );
        },
      ),
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final localDataSource = await ref.read(authLocalDataSourceProvider.future);
    final context = await localDataSource.getCurrentContext();
    state = AsyncValue.data(context);
  }
}

