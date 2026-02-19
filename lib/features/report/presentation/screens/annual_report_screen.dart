import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../setting/presentation/providers/company_notifier.dart';
import '../providers/annual_report_notifier.dart';
import '../widgets/annual_report/annual_summary_list.dart';
import '../widgets/annual_report/annual_sales_profit_trend_chart.dart';
import '../widgets/annual_report/annual_item_types_breakdown_chart.dart';
import '../widgets/annual_report/annual_item_list.dart';
import '../widgets/annual_report/annual_date_selector.dart';

/// Annual Report screen
class AnnualReportScreen extends ConsumerStatefulWidget {
  const AnnualReportScreen({super.key});

  @override
  ConsumerState<AnnualReportScreen> createState() => _AnnualReportScreenState();
}

class _AnnualReportScreenState extends ConsumerState<AnnualReportScreen> {
  DateTime? _startDate;

  void _handleDateChanged(DateTime date) {
    setState(() {
      _startDate = date;
    });
    // Date is required parameter, so watching provider with new date will automatically reload
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final companyAsync = ref.watch(companyProvider);

    // Get default start date from company settings or 7 days before today
    final defaultStartDate = companyAsync.whenOrNull(
          data: (company) => company?.defaultStartDate,
        ) ??
        DateTime.now().subtract(const Duration(days: 7));

    final startDate = _startDate ?? defaultStartDate;

    // Watch report from notifier with required startDate (like dashboard)
    final reportAsync = ref.watch(
      annualReportProvider(startDate: startDate),
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.annualReport,
      ),
      body: SafeArea(
        child: reportAsync.when(
          data: (report) {
            return RefreshIndicator(
              onRefresh: () async {
                // Invalidate provider to reload with current date
                ref.invalidate(
                  annualReportProvider(startDate: startDate),
                );
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSizes.sm),
                    // Summary Cards
                    AnnualSummaryList(report: report.report),
                    SizedBox(height: AppSizes.lg),
                    // Date Selector
                    AnnualDateSelector(
                      selectedDate: startDate,
                      onDateChanged: _handleDateChanged,
                    ),
                    SizedBox(height: AppSizes.lg),
                    // Graph 1: Sales and Profit Trend (Line Chart)
                    AnnualSalesProfitTrendChart(
                      salesProfitTrend: report.charts.salesProfitTrend,
                    ),
                    SizedBox(height: AppSizes.lg),
                    // Graph 2: Item Types Breakdown (Bar Chart)
                    AnnualItemTypesBreakdownChart(
                      itemTypesBreakdown: report.charts.itemTypesBreakdown,
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
                          AnnualItemList(items: report.report.items),
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
                    annualReportProvider(startDate: startDate),
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

