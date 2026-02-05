import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/bestsellerreport/best_seller.dart';
import 'report_providers.dart';

part 'best_seller_report_notifier.g.dart';

@riverpod
class BestSellerReportNotifier extends _$BestSellerReportNotifier {
  // State: List of best seller items (no pagination)
  @override
  Future<List<BestSeller>> build({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    _currentStartDate = startDate;
    _currentEndDate = endDate;
    _currentLimit = 100; // Default limit
    return await _load();
  }

  // Required date state (set from build parameters)
  late DateTime _currentStartDate;
  late DateTime _currentEndDate;
  
  // Optional filter state
  int? _currentBranchId;
  int? _currentProductId;
  int? _currentCategoryId;
  int _currentLimit = 100;

  /// Load best seller report (no pagination)
  Future<List<BestSeller>> _load({
    int? branchId,
    int? productId,
    int? categoryId,
    int? limit,
  }) async {
    final useCase = ref.read(getBestSellerReportUseCaseProvider);
    final result = await useCase.call(
      startDate: _currentStartDate,
      endDate: _currentEndDate,
      branchId: branchId ?? _currentBranchId,
      productId: productId ?? _currentProductId,
      categoryId: categoryId ?? _currentCategoryId,
      limit: limit ?? _currentLimit,
    );

    return result.fold(
      (failure) {
        throw failure;
      },
      (items) => items,
    );
  }

  /// Refresh: Reload data
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load());
  }

  /// Apply optional filters (dates are set via provider parameters, not here)
  Future<void> applyFilters({
    int? branchId,
    int? productId,
    int? categoryId,
    int? limit,
  }) async {
    _currentBranchId = branchId;
    _currentProductId = productId;
    _currentCategoryId = categoryId;
    if (limit != null) {
      _currentLimit = limit;
    }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(
      branchId: branchId,
      productId: productId,
      categoryId: categoryId,
      limit: limit,
    ));
  }
}

