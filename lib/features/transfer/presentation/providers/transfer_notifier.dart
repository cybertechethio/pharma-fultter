import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/models/pagination_model.dart';
import '../../domain/entities/transfer.dart';
import '../../domain/entities/transfer_data.dart';
import 'transfer_providers.dart';
import 'transfer_events.dart';
import 'transfer_loading_providers.dart';

part 'transfer_notifier.g.dart';

@riverpod
class TransferNotifier extends _$TransferNotifier {
  // State: List of all loaded transfers (accumulated)
  @override
  FutureOr<List<Transfer>> build() async {
    return await _loadInitial();
  }

  // Current pagination info
  PaginationModel? _currentPagination;
  bool _isLoadingMore = false;

  /// Load initial page (page 1)
  Future<List<Transfer>> _loadInitial() async {
    final useCase = ref.read(getTransfersUseCaseProvider);
    final result = await useCase.call(page: 1, limit: 25);

    return result.fold(
      (failure) {
        throw failure;
      },
      (paginatedResponse) {
        _currentPagination = paginatedResponse.pagination;
        return paginatedResponse.data;
      },
    );
  }

  /// Refresh: Reload from page 1
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitial());
  }

  /// Load more: Load next page and append to current list
  Future<void> loadMore() async {
    // Don't load if already loading or no more pages
    if (_isLoadingMore || _currentPagination == null || !_currentPagination!.hasNextPage) {
      return;
    }

    _isLoadingMore = true;

    try {
      final nextPage = _currentPagination!.nextPage;
      if (nextPage == null) {
        _isLoadingMore = false;
        return;
      }

      final useCase = ref.read(getTransfersUseCaseProvider);
      final result = await useCase.call(page: nextPage, limit: 25);

      result.fold(
        (failure) {
          // Don't throw, just stop loading
          _isLoadingMore = false;
        },
        (paginatedResponse) {
          // Append new data to existing list
          final currentList = state.value ?? const <Transfer>[];
          final updatedList = [...currentList, ...paginatedResponse.data];
          
          _currentPagination = paginatedResponse.pagination;
          state = AsyncValue.data(updatedList);
          _isLoadingMore = false;
        },
      );
    } catch (e) {
      _isLoadingMore = false;
      // Error is handled by state
    }
  }

  /// Check if more data can be loaded
  bool get canLoadMore => 
      _currentPagination != null && 
      _currentPagination!.hasNextPage && 
      !_isLoadingMore;

  /// Check if currently loading more
  bool get isLoadingMore => _isLoadingMore;

  Future<void> createTransfer({
    required TransferData data,
  }) async {
    // Read providers before async operation to avoid disposed ref issues
    final createLoading = ref.read(transferCreateLoadingProvider.notifier);
    // Start loading
    createLoading.setLoading(true);

    final useCase = ref.read(createTransferUseCaseProvider);

    // Call use case
    final result = await useCase.call(data: data);

    // Handle result
    result.fold(
      (failure) {
        // Emit failure event
        ref.read(transferUiEventsProvider.notifier).emit(TransferFailure(failure));
      },
      (created) {
        // Add to beginning of list (newest first)
        final current = state.value ?? const <Transfer>[];
        state = AsyncValue.data([created, ...current]);
        ref.read(transferUiEventsProvider.notifier).emit(TransferCreated(created, 'Transfer created successfully'));
      },
    );

    createLoading.setLoading(false);
  }
}













