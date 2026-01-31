import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/models/pagination_model.dart';
import '../../domain/entities/item.dart';
import 'item_providers.dart';
import 'item_events.dart';
import 'item_loading_providers.dart';

part 'item_notifier.g.dart';

@riverpod
class ItemNotifier extends _$ItemNotifier {
  // State: List of all loaded items (accumulated)
  @override
  Future<List<Item>> build() async {
    return await _loadInitial();
  }

  // Current pagination info
  PaginationModel? _currentPagination;
  bool _isLoadingMore = false;
  String? _currentSearch;
  int? _currentCategoryId;

  /// Load initial page (page 1)
  Future<List<Item>> _loadInitial({String? search, int? categoryId}) async {
    final useCase = ref.read(getItemsUseCaseProvider);
    final result = await useCase.call(
      page: 1,
      limit: 25,
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

  /// Refresh: Reload from page 1
  Future<void> refresh() async {
    _currentSearch = null; // Reset search on refresh
    _currentCategoryId = null; // Reset category filter on refresh
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

      final useCase = ref.read(getItemsUseCaseProvider);
      final result = await useCase.call(
        page: nextPage,
        limit: 25,
        search: _currentSearch,
        categoryId: _currentCategoryId,
      );

      result.fold(
        (failure) {
          // Don't throw, just stop loading
          _isLoadingMore = false;
        },
        (paginatedResponse) {
          // Append new data to existing list
          final currentList = state.value ?? const <Item>[];
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
    required String name,
    required String description,
    required String sku,
    required String code,
    required String barcode,
    required String color,
    required String size,
    required String material,
    required double weight,
    required bool isTaxable,
    required int taxRate,
    required bool isActive,
    String? imageUrl,
    int? categoryId,
    int? subCategoryId,
    int? brandId,
    int? unitId,
    int? modelId,
  }) async {
    final createLoading = ref.read(itemCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createItemUseCaseProvider);
    final result = await useCase.call(
      name: name,
      description: description,
      sku: sku,
      code: code,
      barcode: barcode,
      color: color,
      size: size,
      material: material,
      weight: weight,
      isTaxable: isTaxable,
      taxRate: taxRate,
      isActive: isActive,
      imageUrl: imageUrl,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      brandId: brandId,
      unitId: unitId,
      modelId: modelId,
    );

    result.fold(
      (failure) {
        ref.read(itemUiEventsProvider.notifier).emit(ItemFailure(failure));
      },
      (created) {
        final current = state.value ?? const <Item>[];
        state = AsyncValue.data([created, ...current]);
        ref.read(itemUiEventsProvider.notifier).emit(
          ItemCreated(created, 'Item created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateItem({
    required String id,
    required String name,
    required String description,
    required String sku,
    required String code,
    required String barcode,
    required String color,
    required String size,
    required String material,
    required double weight,
    required bool isTaxable,
    required int taxRate,
    required bool isActive,
    String? imageUrl,
    int? categoryId,
    int? subCategoryId,
    int? brandId,
    int? unitId,
    int? modelId,
  }) async {
    final updating = ref.read(itemUpdateLoadingProvider.notifier);
    updating.start(id);
    final useCase = ref.read(updateItemUseCaseProvider);
    final result = await useCase.call(
      id: id,
      name: name,
      description: description,
      sku: sku,
      code: code,
      barcode: barcode,
      color: color,
      size: size,
      material: material,
      weight: weight,
      isTaxable: isTaxable,
      taxRate: taxRate,
      isActive: isActive,
      imageUrl: imageUrl,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      brandId: brandId,
      unitId: unitId,
      modelId: modelId,
    );

    result.fold(
      (failure) {
        ref.read(itemUiEventsProvider.notifier).emit(ItemFailure(failure));
      },
      (updated) {
        final list = List<Item>.from(state.value ?? const <Item>[]);
        final idx = list.indexWhere((e) => e.id == id);
        if (idx != -1) list[idx] = updated;
        state = AsyncValue.data(list);
        ref.read(itemUiEventsProvider.notifier).emit(
          ItemUpdated(updated, 'Item updated successfully'),
        );
      },
    );

    updating.stop(id);
  }

  Future<void> delete({
    required String id,
  }) async {
    final deleting = ref.read(itemDeleteLoadingProvider.notifier);
    deleting.start(id);

    final useCase = ref.read(deleteItemUseCaseProvider);
    final result = await useCase.call(id: id);

    result.fold(
      (failure) {
        ref.read(itemUiEventsProvider.notifier).emit(ItemFailure(failure));
      },
      (deletedEntity) {
        final list = List<Item>.from(state.value ?? const <Item>[]);
        list.removeWhere((e) => e.id == id);
        state = AsyncValue.data(list);
        ref.read(itemUiEventsProvider.notifier).emit(
          ItemDeleted(id, 'Item deleted successfully'),
        );
      },
    );

    deleting.stop(id);
  }

  /// Search items
  Future<void> search(String query) async {
    _currentSearch = query.trim().isEmpty ? null : query.trim();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitial(
      search: _currentSearch,
      categoryId: _currentCategoryId,
    ));
  }

  /// Filter items by category
  Future<void> filterByCategory(int? categoryId) async {
    _currentCategoryId = categoryId;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitial(
      search: _currentSearch,
      categoryId: _currentCategoryId,
    ));
  }

}

