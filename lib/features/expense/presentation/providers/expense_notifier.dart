import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/models/pagination_model.dart';
import '../../domain/entities/expense.dart';
import 'expense_providers.dart';
import 'expense_events.dart';
import 'expense_loading_providers.dart';

part 'expense_notifier.g.dart';

@riverpod
class ExpenseNotifier extends _$ExpenseNotifier {
  // State: List of all loaded expenses (accumulated)
  @override
  Future<List<Expense>> build() async {
    return await _loadInitial();
  }

  // Current pagination info
  PaginationModel? _currentPagination;
  bool _isLoadingMore = false;
  // Filter state
  String? _currentCategoryId;
  DateTime? _currentFromDate;
  DateTime? _currentToDate;
  String? _currentSearch;
  int? _currentBranchId;

  /// Load initial page (page 1)
  Future<List<Expense>> _loadInitial({String? search, String? categoryId, DateTime? fromDate, DateTime? toDate, int? branchId}) async {
    final useCase = ref.read(getExpensesUseCaseProvider);
    final result = await useCase.call(
      page: 1,
      limit: 25,
      categoryId: categoryId ?? _currentCategoryId,
      fromDate: fromDate ?? _currentFromDate,
      toDate: toDate ?? _currentToDate,
      search: search ?? _currentSearch,
      branchId: branchId ?? _currentBranchId,
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
    _currentFromDate = null; // Reset date filters on refresh
    _currentToDate = null;
    _currentBranchId = null;
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

      final useCase = ref.read(getExpensesUseCaseProvider);
      final result = await useCase.call(
        page: nextPage,
        limit: 25,
        categoryId: _currentCategoryId,
        fromDate: _currentFromDate,
        toDate: _currentToDate,
        search: _currentSearch,
        branchId: _currentBranchId,
      );

      result.fold(
        (failure) {
          // Don't throw, just stop loading
          _isLoadingMore = false;
        },
        (paginatedResponse) {
          // Append new data to existing list
          final currentList = state.value ?? const <Expense>[];
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

  Future<void> createExpense({
    required String? categoryId,
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentFilePaths,
    required List<Map<String, dynamic>> paymentMethods,
  }) async {
    final createLoading = ref.read(expenseCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createExpenseUseCaseProvider);
    final result = await useCase.call(
      categoryId: categoryId,
      expenseDate: expenseDate,
      name: name,
      notes: notes,
      attachmentFilePaths: attachmentFilePaths,
      paymentMethods: paymentMethods,
    );

    result.fold(
      (failure) {
        ref.read(expenseUiEventsProvider.notifier).emit(ExpenseFailure(failure));
      },
      (created) {
        final current = state.value ?? const <Expense>[];
        state = AsyncValue.data([created, ...current]);
        ref.read(expenseUiEventsProvider.notifier).emit(
          ExpenseCreated(created, 'Expense created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateExpense({
    required String id,
    required String? categoryId,
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentFilePaths,
  }) async {
    final updating = ref.read(expenseUpdateLoadingProvider.notifier);
    updating.start(id);
    final useCase = ref.read(updateExpenseUseCaseProvider);
    final result = await useCase.call(
      id: id,
      categoryId: categoryId,
      expenseDate: expenseDate,
      name: name,
      notes: notes,
      attachmentFilePaths: attachmentFilePaths,
    );

    result.fold(
      (failure) {
        ref.read(expenseUiEventsProvider.notifier).emit(ExpenseFailure(failure));
      },
      (updated) {
        final list = List<Expense>.from(state.value ?? const <Expense>[]);
        final idx = list.indexWhere((e) => e.id == id);
        if (idx != -1) list[idx] = updated;
        state = AsyncValue.data(list);
        ref.read(expenseUiEventsProvider.notifier).emit(
          ExpenseUpdated(updated, 'Expense updated successfully'),
        );
      },
    );

    updating.stop(id);
  }

  Future<void> deleteExpense({
    required String id,
  }) async {
    final deleting = ref.read(expenseDeleteLoadingProvider.notifier);
    deleting.start(id);

    final useCase = ref.read(deleteExpenseUseCaseProvider);
    final result = await useCase.call(id: id);

    result.fold(
      (failure) {
        ref.read(expenseUiEventsProvider.notifier).emit(ExpenseFailure(failure));
      },
      (deletedEntity) {
        final list = List<Expense>.from(state.value ?? const <Expense>[]);
        list.removeWhere((e) => e.id == id);
        state = AsyncValue.data(list);
        ref.read(expenseUiEventsProvider.notifier).emit(
          ExpenseDeleted(id, 'Expense deleted successfully'),
        );
      },
    );

    deleting.stop(id);
  }

  /// Search expenses
  Future<void> search({
    String? categoryId,
    DateTime? fromDate,
    DateTime? toDate,
    String? search,
    int? branchId,
  }) async {
    _currentCategoryId = categoryId;
    _currentFromDate = fromDate;
    _currentToDate = toDate;
    _currentSearch = search?.trim().isEmpty == true ? null : search?.trim();
    _currentBranchId = branchId;

    _currentPagination = null; // Reset pagination when searching
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitial());
  }

}
