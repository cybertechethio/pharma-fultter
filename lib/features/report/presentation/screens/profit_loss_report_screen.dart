import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../setting/presentation/providers/company_notifier.dart';
import '../../../dashboard/presentation/widgets/dashboard_period_selector.dart';
import '../providers/profit_loss_report_notifier.dart';
import '../widgets/profit_loss_report/profit_loss_summary_list.dart';
import '../widgets/profit_loss_report/profit_loss_graph_widget.dart';
import '../widgets/profit_loss_report/profit_loss_item_list.dart';

/// Profit-Loss Report screen
class ProfitLossReportScreen extends ConsumerStatefulWidget {
  const ProfitLossReportScreen({super.key});

  @override
  ConsumerState<ProfitLossReportScreen> createState() => _ProfitLossReportScreenState();
}

class _ProfitLossReportScreenState extends ConsumerState<ProfitLossReportScreen> {
  DateTime? _startDate;
  DateTime? _endDate;

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

    // Watch report from notifier with required dates (like dashboard)
    final reportAsync = ref.watch(
      profitLossReportProvider(startDate: startDate, endDate: endDate),
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.profitLossReport,
      ),
      body: SafeArea(
        child: reportAsync.when(
          data: (report) {
            final dateFormat = DateFormat('M/d/yyyy');
            final dateRangeTitle = '${dateFormat.format(startDate)} - ${dateFormat.format(endDate)}';

            return RefreshIndicator(
              onRefresh: () async {
                // Invalidate provider to reload with current dates (like dashboard)
                ref.invalidate(
                  profitLossReportProvider(startDate: startDate, endDate: endDate),
                );
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSizes.sm),
                    // Summary Cards
                    ProfitLossSummaryList(totals: report.report.totals),
                    // Period Selector
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                      child: DashboardPeriodSelector(
                        initialStartDate: startDate,
                        initialEndDate: endDate,
                        onDateRangeChanged: _handleDateRangeChanged,
                      ),
                    ),
                    SizedBox(height: AppSizes.lg),
                    // Graph 1: Last 10 Days
                    ProfitLossGraphWidget(
                      graph: report.graph10Days,
                      title: l10n.salesAndProfitTrendLast10Days,
                    ),
                    SizedBox(height: AppSizes.lg),
                    // Graph 2: Date Range (if available)
                    if (report.graphDateRange != null)
                      ProfitLossGraphWidget(
                        graph: report.graphDateRange!,
                        title: '${l10n.salesAndProfitTrend} - $dateRangeTitle',
                      ),
                    SizedBox(height: AppSizes.lg),
                    // Items List
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.md,
                              vertical: AppSizes.sm,
                            ),
                            child: Text(
                              'Items',
                              style: context.subtitle(bold: true),
                            ),
                          ),
                          ProfitLossItemList(items: report.report.items),
                        ],
                      ),
                    ),
                  ],
                ),
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
                    profitLossReportProvider(startDate: startDate, endDate: endDate),
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

