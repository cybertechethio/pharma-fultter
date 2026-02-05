import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/models/pagination_model.dart';
import '../../domain/entities/purchasereport/purchase_item_data.dart';
import '../../domain/entities/purchasereport/purchase_summary.dart';
import 'report_providers.dart';

part 'purchase_report_notifier.g.dart';

@riverpod
class PurchaseReportNotifier extends _$PurchaseReportNotifier {
  // State: List of all loaded purchase report items (accumulated)
  @override
  Future<List<PurchaseItemData>> build({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    _currentStartDate = startDate;
    _currentEndDate = endDate;
    return await _loadInitial();
  }

  // Current pagination info
  PaginationModel? _currentPagination;
  bool _isLoadingMore = false;
  
  // Summary from the first page (stored separately)
  PurchaseSummary? _summary;
  
  // Required date state (set from build parameters)
  late DateTime _currentStartDate;
  late DateTime _currentEndDate;
  
  // Optional filter state
  int? _currentBranchId;
  int? _currentProductId;
  int? _currentCategoryId;
  int? _currentSupplierId;
  String? _currentStatus;
  
  /// Get the summary (from first page load)
  PurchaseSummary? get summary => _summary;

  /// Load initial page (page 1)
  Future<List<PurchaseItemData>> _loadInitial({
    int? branchId,
    int? productId,
    int? categoryId,
    int? supplierId,
    String? status,
  }) async {
    final useCase = ref.read(getPurchaseReportUseCaseProvider);
    final result = await useCase.call(
      page: 1,
      limit: 25,
      startDate: _currentStartDate,
      endDate: _currentEndDate,
      branchId: branchId ?? _currentBranchId,
      productId: productId ?? _currentProductId,
      categoryId: categoryId ?? _currentCategoryId,
      supplierId: supplierId ?? _currentSupplierId,
      status: status ?? _currentStatus,
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

      final useCase = ref.read(getPurchaseReportUseCaseProvider);
      final result = await useCase.call(
        page: nextPage,
        limit: 25,
        startDate: _currentStartDate,
        endDate: _currentEndDate,
        branchId: _currentBranchId,
        productId: _currentProductId,
        categoryId: _currentCategoryId,
        supplierId: _currentSupplierId,
        status: _currentStatus,
      );

      result.fold(
        (failure) {
          // Don't throw, just stop loading
          _isLoadingMore = false;
        },
        (paginatedResponse) {
          // Append new data to existing list
          final currentList = state.value ?? const <PurchaseItemData>[];
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

  /// Apply optional filters (dates are set via provider parameters, not here)
  Future<void> applyFilters({
    int? branchId,
    int? productId,
    int? categoryId,
    int? supplierId,
    String? status,
  }) async {
    _currentBranchId = branchId;
    _currentProductId = productId;
    _currentCategoryId = categoryId;
    _currentSupplierId = supplierId;
    _currentStatus = status;

    _currentPagination = null; // Reset pagination when filtering
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitial(
      branchId: branchId,
      productId: productId,
      categoryId: categoryId,
      supplierId: supplierId,
      status: status,
    ));
  }
}

