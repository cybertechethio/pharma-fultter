import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/models/pagination_model.dart';
import '../../domain/entities/sub_category.dart';
import 'sub_category_providers.dart';
import 'sub_category_events.dart';
import 'sub_category_loading_providers.dart';

part 'sub_category_notifier.g.dart';

@riverpod
class SubCategoryNotifier extends _$SubCategoryNotifier {
  // State: List of all loaded sub-categories (accumulated)
  @override
  Future<List<SubCategory>> build(String? categoryId) async {
    _categoryId = categoryId; // Store categoryId for use in loadMore
    if (categoryId != null) {
      return await _loadInitialByCategory(categoryId);
    } else {
      return await _loadInitial();
    }
  }

  // Current pagination info
  PaginationModel? _currentPagination;
  bool _isLoadingMore = false;
  String? _categoryId; // Store the categoryId parameter
  // Search query state
  String? _currentSearch;

  /// Load initial page (page 1) - all sub-categories
  Future<List<SubCategory>> _loadInitial() async {
    final useCase = ref.read(getSubCategoriesUseCaseProvider);
    final result = await useCase.call(page: 1, limit: 25, search: _currentSearch);

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

  /// Load initial page (page 1) - by category
  Future<List<SubCategory>> _loadInitialByCategory(String categoryId) async {
    final useCase = ref.read(getSubCategoriesByCategoryUseCaseProvider);
    final result = await useCase.call(
      categoryId: categoryId,
      page: 1,
      limit: 25,
      search: _currentSearch,
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
    _currentSearch = null; // Reset search when manually refreshing
    state = const AsyncValue.loading();
    if (_categoryId != null) {
      state = await AsyncValue.guard(() => _loadInitialByCategory(_categoryId!));
    } else {
      state = await AsyncValue.guard(() => _loadInitial());
    }
  }

  /// Search sub-categories (resets to page 1)
  Future<void> search(String query) async {
    _currentSearch = query.trim().isEmpty ? null : query.trim();
    _currentPagination = null; // Reset pagination when searching
    state = const AsyncValue.loading();
    if (_categoryId != null) {
      state = await AsyncValue.guard(() => _loadInitialByCategory(_categoryId!));
    } else {
      state = await AsyncValue.guard(() => _loadInitial());
    }
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

      final result = _categoryId != null
          ? await ref.read(getSubCategoriesByCategoryUseCaseProvider).call(
              categoryId: _categoryId!,
              page: nextPage,
              limit: 25,
              search: _currentSearch,
            )
          : await ref.read(getSubCategoriesUseCaseProvider).call(
              page: nextPage,
              limit: 25,
              search: _currentSearch,
            );

      result.fold(
        (failure) {
          // Don't throw, just stop loading
          _isLoadingMore = false;
        },
        (paginatedResponse) {
          // Append new data to existing list
          final currentList = state.value ?? const <SubCategory>[];
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
    required int categoryId,
    required String description,
  }) async {
    final createLoading = ref.read(subCategoryCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createSubCategoryUseCaseProvider);
    final result = await useCase.call(
      name: name,
      categoryId: categoryId,
      description: description,
    );

    result.fold(
      (failure) {
        ref.read(subCategoryUiEventsProvider.notifier).emit(SubCategoryFailure(failure));
      },
      (created) {
        final current = state.value ?? const <SubCategory>[];
        state = AsyncValue.data([created, ...current]);
        ref.read(subCategoryUiEventsProvider.notifier).emit(
          SubCategoryCreated(created, 'Sub-category created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateSubCategory({
    required String id,
    required String name,
    required int categoryId,
    required String description,
  }) async {
    final updating = ref.read(subCategoryUpdateLoadingProvider.notifier);
    updating.start(id);
    final useCase = ref.read(updateSubCategoryUseCaseProvider);
    final result = await useCase.call(
      id: id,
      name: name,
      categoryId: categoryId,
      description: description,
    );

    result.fold(
      (failure) {
        ref.read(subCategoryUiEventsProvider.notifier).emit(SubCategoryFailure(failure));
      },
      (updated) {
        final list = List<SubCategory>.from(state.value ?? const <SubCategory>[]);
        final idx = list.indexWhere((e) => e.id == id);
        if (idx != -1) list[idx] = updated;
        state = AsyncValue.data(list);
        ref.read(subCategoryUiEventsProvider.notifier).emit(
          SubCategoryUpdated(updated, 'Sub-category updated successfully'),
        );
      },
    );

    updating.stop(id);
  }

  Future<void> delete({
    required String id,
  }) async {
    final deleting = ref.read(subCategoryDeleteLoadingProvider.notifier);
    deleting.start(id);

    final useCase = ref.read(deleteSubCategoryUseCaseProvider);
    final result = await useCase.call(id: id);

    result.fold(
      (failure) {
        ref.read(subCategoryUiEventsProvider.notifier).emit(SubCategoryFailure(failure));
      },
      (deletedEntity) {
        final list = List<SubCategory>.from(state.value ?? const <SubCategory>[]);
        list.removeWhere((e) => e.id == id);
        state = AsyncValue.data(list);
        ref.read(subCategoryUiEventsProvider.notifier).emit(
          SubCategoryDeleted(id, 'Sub-category deleted successfully'),
        );
      },
    );

    deleting.stop(id);
  }

}
