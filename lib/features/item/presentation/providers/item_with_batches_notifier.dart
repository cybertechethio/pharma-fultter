import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/models/pagination_model.dart';
import '../../domain/entities/item_with_batches.dart';
import 'item_providers.dart';

part 'item_with_batches_notifier.g.dart';

@Riverpod(keepAlive: true)
class ItemWithBatchesNotifier extends _$ItemWithBatchesNotifier {
  @override
  Future<List<ItemWithBatches>> build() async {
    return await _loadInitial();
  }

  PaginationModel? _currentPagination;
  bool _isLoadingMore = false;
  String? _currentSearch;
  int? _currentCategoryId;

  Future<List<ItemWithBatches>> _loadInitial({
    String? search,
    int? categoryId,
  }) async {
    final useCase = ref.read(getItemsIncludeBatchesUseCaseProvider);
    final result = await useCase.call(
      page: 1,
      limit: 1000,
      search: search,
      categoryId: categoryId,
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

  Future<void> refresh() async {
    _currentSearch = null;
    _currentCategoryId = null;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitial());
  }

  Future<void> loadMore() async {
    if (_isLoadingMore ||
        _currentPagination == null ||
        !_currentPagination!.hasNextPage) {
      return;
    }

    _isLoadingMore = true;

    try {
      final nextPage = _currentPagination!.nextPage;
      if (nextPage == null) {
        _isLoadingMore = false;
        return;
      }

      final useCase = ref.read(getItemsIncludeBatchesUseCaseProvider);
      final result = await useCase.call(
        page: nextPage,
        limit: 1000,
        search: _currentSearch,
        categoryId: _currentCategoryId,
      );

      result.fold(
        (failure) {
          _isLoadingMore = false;
        },
        (paginatedResponse) {
          final currentList = state.value ?? const <ItemWithBatches>[];
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

  bool get canLoadMore =>
      _currentPagination != null &&
      _currentPagination!.hasNextPage &&
      !_isLoadingMore;

  bool get isLoadingMore => _isLoadingMore;

  Future<void> search(String query) async {
    _currentSearch = query.trim().isEmpty ? null : query.trim();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitial(
          search: _currentSearch,
          categoryId: _currentCategoryId,
        ));
  }

  Future<void> filterByCategory(int? categoryId) async {
    _currentCategoryId = categoryId;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitial(
          search: _currentSearch,
          categoryId: _currentCategoryId,
        ));
  }
}
