import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/models/pagination_model.dart';
import '../../domain/entities/category.dart';
import 'category_providers.dart';
import 'category_events.dart';
import 'category_loading_providers.dart';

part 'category_notifier.g.dart';

@Riverpod(keepAlive: true)
class CategoryNotifier extends _$CategoryNotifier {
  // State: List of all loaded categories (accumulated)
  @override
  Future<List<Category>> build() async {
    return await _loadInitial();
  }

  // Current pagination info
  PaginationModel? _currentPagination;
  bool _isLoadingMore = false;
  // Search query state
  String? _currentSearch;

  /// Load initial page (page 1)
  Future<List<Category>> _loadInitial() async {
    final useCase = ref.read(getCategoriesUseCaseProvider);
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

  /// Refresh: Reload from page 1
  Future<void> refresh() async {
    _currentSearch = null; // Reset search when manually refreshing
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitial());
  }

  /// Search categories (resets to page 1)
  Future<void> search(String query) async {
    _currentSearch = query.trim().isEmpty ? null : query.trim();
    _currentPagination = null; // Reset pagination when searching
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

      final useCase = ref.read(getCategoriesUseCaseProvider);
      final result = await useCase.call(page: nextPage, limit: 25, search: _currentSearch);

      result.fold(
        (failure) {
          // Don't throw, just stop loading
          _isLoadingMore = false;
        },
        (paginatedResponse) {
          // Append new data to existing list
          final currentList = state.value ?? const <Category>[];
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
  }) async {
    final createLoading = ref.read(categoryCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createCategoryUseCaseProvider);
    final result = await useCase.call(
      name: name,
      description: description,
    );

    result.fold(
      (failure) {
        ref.read(categoryUiEventsProvider.notifier).emit(CategoryFailure(failure));
      },
      (created) {
        final current = state.value ?? const <Category>[];
        state = AsyncValue.data([created, ...current]);
        ref.read(categoryUiEventsProvider.notifier).emit(
          CategoryCreated(created, 'Category created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateCategory({
    required String id,
    required String name,
    required String description,
  }) async {
    final updating = ref.read(categoryUpdateLoadingProvider.notifier);
    updating.start(id);
    final useCase = ref.read(updateCategoryUseCaseProvider);
    final result = await useCase.call(
      id: id,
      name: name,
      description: description,
    );

    result.fold(
      (failure) {
        ref.read(categoryUiEventsProvider.notifier).emit(CategoryFailure(failure));
      },
      (updated) {
        final list = List<Category>.from(state.value ?? const <Category>[]);
        final idx = list.indexWhere((e) => e.id == id);
        if (idx != -1) list[idx] = updated;
        state = AsyncValue.data(list);
        ref.read(categoryUiEventsProvider.notifier).emit(
          CategoryUpdated(updated, 'Category updated successfully'),
        );
      },
    );

    updating.stop(id);
  }

  Future<void> delete({
    required String id,
  }) async {
    final deleting = ref.read(categoryDeleteLoadingProvider.notifier);
    deleting.start(id);

    final useCase = ref.read(deleteCategoryUseCaseProvider);
    final result = await useCase.call(id: id);

    result.fold(
      (failure) {
        ref.read(categoryUiEventsProvider.notifier).emit(CategoryFailure(failure));
      },
      (deletedEntity) {
        final list = List<Category>.from(state.value ?? const <Category>[]);
        list.removeWhere((e) => e.id == id);
        state = AsyncValue.data(list);
        ref.read(categoryUiEventsProvider.notifier).emit(
          CategoryDeleted(id, 'Category deleted successfully'),
        );
      },
    );

    deleting.stop(id);
  }
}

