import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../app/theme/app_sizes.dart';
import '../../../setting/presentation/providers/company_notifier.dart';
import '../../../dashboard/presentation/widgets/dashboard_period_selector.dart';
import '../providers/expense_report_notifier.dart';
import '../widgets/expense_report/expense_summary_list.dart';
import '../widgets/expense_report/expense_item_list.dart';

/// Expense Report screen
class ExpenseReportScreen extends ConsumerStatefulWidget {
  const ExpenseReportScreen({super.key});

  @override
  ConsumerState<ExpenseReportScreen> createState() => _ExpenseReportScreenState();
}

class _ExpenseReportScreenState extends ConsumerState<ExpenseReportScreen> {
  final ScrollController _scrollController = ScrollController();
  DateTime? _startDate;
  DateTime? _endDate;
  

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
    // Dates are required parameters, so watching provider with new dates will automatically reload
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
        expenseReportProvider(startDate: startDate, endDate: endDate).notifier,
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
      expenseReportProvider(startDate: startDate, endDate: endDate),
    );
    final notifier = ref.read(
      expenseReportProvider(startDate: startDate, endDate: endDate).notifier,
    );
    final canLoadMore = notifier.canLoadMore;
    final summary = notifier.summary;

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.expenseReport,
      ),
      body: SafeArea(
        child: itemsAsync.when(
          data: (items) {
            return RefreshIndicator(
              onRefresh: () async {
                // Invalidate provider to reload with current dates (like dashboard)
                ref.invalidate(
                  expenseReportProvider(startDate: startDate, endDate: endDate),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSizes.sm),
                  // Summary Cards (from notifier)
                  if (summary != null) ExpenseSummaryList(summary: summary),
                  // Period Selector
                  DashboardPeriodSelector(
                    initialStartDate: startDate,
                    initialEndDate: endDate,
                    onDateRangeChanged: _handleDateRangeChanged,
                  ),

                  // Items List
                  Expanded(
                    child: ExpenseItemList(
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
                    expenseReportProvider(startDate: startDate, endDate: endDate),
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

