import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/models/pagination_model.dart';
import '../../domain/entities/stock_movement.dart';
import 'stock_movement_providers.dart';

part 'stock_movements_notifier.g.dart';

/// Notifier for stock movements list with pagination support
/// Requires itemId to be passed as a family parameter
@riverpod
class StockMovementsNotifier extends _$StockMovementsNotifier {
  // Current pagination info
  PaginationModel? _currentPagination;
  bool _isLoadingMore = false;
  late int _itemId;

  @override
  Future<List<StockMovement>> build(int itemId) async {
    _itemId = itemId;
    return await _loadInitial();
  }

  /// Load initial page (page 1)
  Future<List<StockMovement>> _loadInitial() async {
    final useCase = ref.read(getStockMovementsUseCaseProvider);
    final result = await useCase.call(
      itemId: _itemId,
      page: 1,
      limit: 500,
    );

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

      final useCase = ref.read(getStockMovementsUseCaseProvider);
      final result = await useCase.call(
        itemId: _itemId,
        page: nextPage,
        limit: 500,
      );

      result.fold(
        (failure) {
          _isLoadingMore = false;
        },
        (paginatedResponse) {
          final currentList = state.value ?? const <StockMovement>[];
          final updatedList = [...currentList, ...paginatedResponse.data];

          _currentPagination = paginatedResponse.pagination;
          state = AsyncValue.data(updatedList);
          _isLoadingMore = false;
        },
      );
    } catch (e) {
      _isLoadingMore = false;
    }
  }

  /// Check if more data can be loaded
  bool get canLoadMore =>
      _currentPagination != null &&
      _currentPagination!.hasNextPage &&
      !_isLoadingMore;

  /// Check if currently loading more
  bool get isLoadingMore => _isLoadingMore;
}
