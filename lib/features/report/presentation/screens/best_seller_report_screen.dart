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
import '../providers/best_seller_report_notifier.dart';
import '../widgets/best_seller_report/best_seller_item_list.dart';
import '../widgets/best_seller_report/best_seller_report_filter_bottom_sheet.dart';
import '../widgets/best_seller_report/best_seller_report_filter_button.dart';

/// Best Seller Report screen
class BestSellerReportScreen extends ConsumerStatefulWidget {
  const BestSellerReportScreen({super.key});

  @override
  ConsumerState<BestSellerReportScreen> createState() => _BestSellerReportScreenState();
}

class _BestSellerReportScreenState extends ConsumerState<BestSellerReportScreen> {
  DateTime? _startDate;
  DateTime? _endDate;
  
  // Filter state
  int? _categoryId;
  int? _limit;

  @override
  void initState() {
    super.initState();
    _endDate = DateTime.now();
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
      builder: (context) => BestSellerReportFilterBottomSheet(
        initialFilter: BestSellerReportFilter(
          categoryId: _categoryId,
          limit: _limit,
        ),
        onApply: (filter) {
          setState(() {
            _categoryId = filter.categoryId;
            _limit = filter.limit;
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
      bestSellerReportProvider(startDate: startDate, endDate: endDate).notifier,
    );
    notifier.applyFilters(
      categoryId: _categoryId,
      limit: _limit,
    );
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
      bestSellerReportProvider(startDate: startDate, endDate: endDate),
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.bestSellerReport,
      ),
      body: SafeArea(
        child: itemsAsync.when(
          data: (items) {
            return RefreshIndicator(
              onRefresh: () async {
                // Invalidate provider to reload with current dates (like dashboard)
                ref.invalidate(
                  bestSellerReportProvider(startDate: startDate, endDate: endDate),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSizes.sm),
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
                        BestSellerReportFilterButton(
                          onTap: _showFilterBottomSheet,
                          hasActiveFilters: _categoryId != null || _limit != null,
                        ),
                      const SizedBox(width: AppSizes.sm),
                    ],
                  ),

                  // Items List (no pagination)
                  Expanded(
                    child: BestSellerItemList(items: items),
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
                    bestSellerReportProvider(startDate: startDate, endDate: endDate),
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

