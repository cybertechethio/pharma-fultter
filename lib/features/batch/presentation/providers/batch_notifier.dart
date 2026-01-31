import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/models/pagination_model.dart';
import '../../domain/entities/batch.dart';
import 'batch_providers.dart';
import 'batch_events.dart';
import 'batch_loading_providers.dart';

part 'batch_notifier.g.dart';

@riverpod
class BatchNotifier extends _$BatchNotifier {
  // State: List of all loaded batches (accumulated)
  @override
  Future<List<BatchEntity>> build() async {
    return await _loadInitial();
  }

  // Current pagination info
  PaginationModel? _currentPagination;
  bool _isLoadingMore = false;
  String? _currentSearch;

  /// Load initial page (page 1)
  Future<List<BatchEntity>> _loadInitial({String? search}) async {
    final useCase = ref.read(getBatchesUseCaseProvider);
    final result = await useCase.call(page: 1, limit: 25, search: search);

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
    _currentSearch = null; // Reset search on refresh
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

      final useCase = ref.read(getBatchesUseCaseProvider);
      final result = await useCase.call(page: nextPage, limit: 25, search: _currentSearch);

      result.fold(
        (failure) {
          // Don't throw, just stop loading
          _isLoadingMore = false;
        },
        (paginatedResponse) {
          // Append new data to existing list
          final currentList = state.value ?? const <BatchEntity>[];
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

  Future<void> create({
    required int itemId,
    required String batchName,
  }) async {
    final createLoading = ref.read(batchCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createBatchUseCaseProvider);
    final result = await useCase.call(
      itemId: itemId,
      batchName: batchName,
    );

    result.fold(
      (failure) {
        ref.read(batchUiEventsProvider.notifier).emit(BatchFailure(failure));
      },
      (created) {
        final current = state.value ?? const <BatchEntity>[];
        state = AsyncValue.data([created, ...current]);
        ref.read(batchUiEventsProvider.notifier).emit(
          BatchCreated(created, 'Batch created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateBatch({
    required int id,
    required String batchName,
  }) async {
    final updating = ref.read(batchUpdateLoadingProvider.notifier);
    updating.start(id);
    final useCase = ref.read(updateBatchUseCaseProvider);
    final result = await useCase.call(
      id: id,
      batchName: batchName,
    );

    result.fold(
      (failure) {
        ref.read(batchUiEventsProvider.notifier).emit(BatchFailure(failure));
      },
      (updated) {
        final list = List<BatchEntity>.from(state.value ?? const <BatchEntity>[]);
        final idx = list.indexWhere((e) => e.id == id);
        if (idx != -1) list[idx] = updated;
        state = AsyncValue.data(list);
        ref.read(batchUiEventsProvider.notifier).emit(
          BatchUpdated(updated, 'Batch updated successfully'),
        );
      },
    );

    updating.stop(id);
  }

  /// Search batches
  Future<void> search(String query) async {
    _currentSearch = query.trim().isEmpty ? null : query.trim();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitial(search: _currentSearch));
  }

}

