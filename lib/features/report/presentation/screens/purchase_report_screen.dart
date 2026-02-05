import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../setting/presentation/providers/company_notifier.dart';
import '../../../dashboard/presentation/widgets/dashboard_period_selector.dart';
import '../providers/purchase_report_notifier.dart';
import '../widgets/purchase_report/purchase_summary_list.dart';
import '../widgets/purchase_report/purchase_item_list.dart';
import '../widgets/purchase_report/purchase_report_filter_bottom_sheet.dart';
import '../widgets/purchase_report/purchase_report_filter_button.dart';

/// Purchase Report screen
class PurchaseReportScreen extends ConsumerStatefulWidget {
  const PurchaseReportScreen({super.key});

  @override
  ConsumerState<PurchaseReportScreen> createState() => _PurchaseReportScreenState();
}

class _PurchaseReportScreenState extends ConsumerState<PurchaseReportScreen> {
  final ScrollController _scrollController = ScrollController();
  DateTime? _startDate;
  DateTime? _endDate;
  
  // Filter state
  int? _supplierId;
  int? _categoryId;
  String? _status;

  @override
  void initState() {
    super.initState();
    _endDate = DateTime.now();
    // Listen to scroll events for infinite scroll
    _scrollController.addListener(_onScroll);
  }

  void _handleDateRangeChanged(DateTimeRange range) {
    setState(() {
      _startDate = range.start;
      _endDate = range.end;
    });
    // Dates are now required parameters, so watching provider with new dates will automatically reload
    // Apply filters when date changes
    _applyFilters();
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: BrandColors.transparent,
      builder: (context) => PurchaseReportFilterBottomSheet(
        initialFilter: PurchaseReportFilter(
          supplierId: _supplierId,
          categoryId: _categoryId,
          status: _status,
        ),
        onApply: (filter) {
          setState(() {
            _supplierId = filter.supplierId;
            _categoryId = filter.categoryId;
            _status = filter.status;
          });
          _applyFilters();
        },
      ),
    );
  }

  void _applyFilters() {
    final companyAsync = ref.read(companyProvider);
    final defaultStartDate = companyAsync.whenOrNull(
          data: (company) => company?.defaultStartDate,
        ) ??
        DateTime.now().subtract(const Duration(days: 7));
    final startDate = _startDate ?? defaultStartDate;
    final endDate = _endDate ?? DateTime.now();

    final notifier = ref.read(
      purchaseReportProvider(startDate: startDate, endDate: endDate).notifier,
    );
    notifier.applyFilters(
      supplierId: _supplierId,
      categoryId: _categoryId,
      status: _status,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Detect when user scrolls near bottom, then load more
  void _onScroll() {
    if (_isBottom) {
      final companyAsync = ref.read(companyProvider);
      final defaultStartDate = companyAsync.whenOrNull(
            data: (company) => company?.defaultStartDate,
          ) ??
          DateTime.now().subtract(const Duration(days: 7));
      final startDate = _startDate ?? defaultStartDate;
      final endDate = _endDate ?? DateTime.now();
      
      final notifier = ref.read(
        purchaseReportProvider(startDate: startDate, endDate: endDate).notifier,
      );
      if (notifier.canLoadMore) {
        notifier.loadMore();
      }
    }
  }

  /// Check if user has scrolled to bottom (with threshold)
  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    // Load more when 80% scrolled
    return currentScroll >= (maxScroll * 0.8);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final companyAsync = ref.watch(companyProvider);

    // Get default start date from company settings or fallback to one week ago
    final defaultStartDate = companyAsync.whenOrNull(
          data: (company) => company?.defaultStartDate,
        ) ??
        DateTime.now().subtract(const Duration(days: 7));

    final startDate = _startDate ?? defaultStartDate;
    final endDate = _endDate ?? DateTime.now();

    // Watch items list from notifier with required dates (like dashboard)
    final itemsAsync = ref.watch(
      purchaseReportProvider(startDate: startDate, endDate: endDate),
    );
    final notifier = ref.read(
      purchaseReportProvider(startDate: startDate, endDate: endDate).notifier,
    );
    final canLoadMore = notifier.canLoadMore;
    final summary = notifier.summary;

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.purchaseReport,
      ),
      body: SafeArea(
        child: itemsAsync.when(
          data: (items) {
            return RefreshIndicator(
              onRefresh: () async {
                // Invalidate provider to reload with current dates (like dashboard)
                ref.invalidate(
                  purchaseReportProvider(startDate: startDate, endDate: endDate),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSizes.sm),
                  // Summary Cards (from notifier)
                  if (summary != null) PurchaseSummaryList(summary: summary),
                  // Period Selector
                  Row(
                    children: [
                      Expanded(
                        child: DashboardPeriodSelector(
                          initialStartDate: startDate,
                          initialEndDate: endDate,
                          onDateRangeChanged: _handleDateRangeChanged,
                        ),
                      ),
                      const SizedBox(width: AppSizes.sm),
                        PurchaseReportFilterButton(
                          onTap: _showFilterBottomSheet,
                          hasActiveFilters: _supplierId != null || _categoryId != null || _status != null,
                        ),
                      const SizedBox(width: AppSizes.sm),
                    ],
                  ),

                  // Items List
                  Expanded(
                    child: PurchaseItemList(
                      items: items,
                      scrollController: _scrollController,
                      canLoadMore: canLoadMore,
                    ),
                  ),
                ],
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                app_err.ErrorsWidget(
                  failure: error is Failure
                      ? error
                      : Failure.unexpectedError(error.toString()),
                ),
                SizedBox(height: AppSizes.lg),
                ElevatedButton(
                  onPressed: () => ref.invalidate(
                    purchaseReportProvider(startDate: startDate, endDate: endDate),
                  ),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

