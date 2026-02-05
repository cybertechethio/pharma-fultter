import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/enums/stock_status_enum.dart';
import '../../../../shared/models/pagination_model.dart';
import '../../domain/entities/stock.dart';
import 'stock_providers.dart';
import 'stock_events.dart';
import 'stock_loading_providers.dart';

part 'stocks_provider.g.dart';

// Notifier for stocks list with pagination support
@riverpod
class StockNotifier extends _$StockNotifier {
  // State: List of all loaded stocks (accumulated)
  @override
  Future<List<Stock>> build() async {
    return await _loadInitial();
  }

  // Current pagination info
  PaginationModel? _currentPagination;
  bool _isLoadingMore = false;
  String? _currentSearch;

  /// Load initial page (page 1)
  Future<List<Stock>> _loadInitial({String? search}) async {
    final useCase = ref.read(getStocksUseCaseProvider);
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

      final useCase = ref.read(getStocksUseCaseProvider);
      final result = await useCase.call(page: nextPage, limit: 25, search: _currentSearch);

      result.fold(
        (failure) {
          // Don't throw, just stop loading
          _isLoadingMore = false;
        },
        (paginatedResponse) {
          // Append new data to existing list
          final currentList = state.value ?? const <Stock>[];
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

  /// Search stocks
  Future<void> search(String query) async {
    _currentSearch = query.trim().isEmpty ? null : query.trim();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitial(search: _currentSearch));
  }

  /// Update stock
  Future<void> updateStock({
    required int id,
    String? lowStockThreshold,
    String? location,
    StockStatus? lowStockStatus,
  }) async {
    final updateLoading = ref.read(stockUpdateLoadingProvider.notifier);
    updateLoading.start(id);

    final useCase = ref.read(updateStockUseCaseProvider);

    final result = await useCase.call(
      id: id,
      lowStockThreshold: lowStockThreshold,
      location: location,
      lowStockStatus: lowStockStatus,
    );

    result.fold(
      (failure) {
        ref.read(stockUiEventsProvider.notifier).emit(StockFailure(failure));
      },
      (updated) {
        // Emit success event
        ref.read(stockUiEventsProvider.notifier).emit(
          StockUpdated(updated, ''),
        );
      },
    );

    updateLoading.stop(id);
  }
}

