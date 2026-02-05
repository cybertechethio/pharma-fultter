import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/models/pagination_model.dart';
import '../../domain/entities/customerreport/customer_item_data.dart';
import '../../domain/entities/customerreport/customer_summary.dart';
import 'report_providers.dart';

part 'customer_report_notifier.g.dart';

@riverpod
class CustomerReportNotifier extends _$CustomerReportNotifier {
  // State: List of all loaded customer report items (accumulated)
  @override
  Future<List<CustomerItemData>> build() async {
    return await _loadInitial();
  }

  // Current pagination info
  PaginationModel? _currentPagination;
  bool _isLoadingMore = false;
  
  // Summary from the first page (stored separately)
  CustomerSummary? _summary;
  
  // Optional filter state
  int? _currentBranchId;
  int? _currentCustomerId;

  /// Get the summary (from first page load)
  CustomerSummary? get summary => _summary;

  /// Load initial page (page 1)
  Future<List<CustomerItemData>> _loadInitial({
    int? branchId,
    int? customerId,
  }) async {
    final useCase = ref.read(getCustomerReportUseCaseProvider);
    final result = await useCase.call(
      page: 1,
      limit: 25,
      branchId: branchId ?? _currentBranchId,
      customerId: customerId ?? _currentCustomerId,
    );

    return result.fold(
      (failure) {
        throw failure;
      },
      (paginatedResponse) {
        _currentPagination = paginatedResponse.pagination;
        final report = paginatedResponse.data.first;
        // Store summary from first page
        _summary = report.summary;
        // Extract items from the report (report contains items and summary)
        return report.items;
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

      final useCase = ref.read(getCustomerReportUseCaseProvider);
      final result = await useCase.call(
        page: nextPage,
        limit: 25,
        branchId: _currentBranchId,
        customerId: _currentCustomerId,
      );

      result.fold(
        (failure) {
          // Don't throw, just stop loading
          _isLoadingMore = false;
        },
        (paginatedResponse) {
          // Append new data to existing list
          final currentList = state.value ?? const <CustomerItemData>[];
          final newItems = paginatedResponse.data.first.items;
          final updatedList = [...currentList, ...newItems];
          
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

  /// Apply optional filters
  Future<void> applyFilters({
    int? branchId,
    int? customerId,
  }) async {
    _currentBranchId = branchId;
    _currentCustomerId = customerId;

    _currentPagination = null; // Reset pagination when filtering
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitial(
      branchId: branchId,
      customerId: customerId,
    ));
  }
}

