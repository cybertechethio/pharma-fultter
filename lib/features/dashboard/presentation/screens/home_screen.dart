import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../l10n/app_localizations.dart';
import '../../../branch/presentation/providers/branch_notifier.dart';
import '../../../setting/presentation/providers/company_notifier.dart';
import '../../../category/presentation/providers/category_notifier.dart';
import '../../../brand/presentation/providers/brand_notifier.dart';
import '../../../unit/presentation/providers/unit_notifier.dart';
import '../../../model/presentation/providers/model_notifier.dart';
import '../../../bank/presentation/providers/bank_notifier.dart';
import '../../../item/presentation/providers/item_notifier.dart';
import '../providers/dashboard_providers.dart';
import '../widgets/dashboard_period_selector.dart';
import '../widgets/alert_banner.dart';
import '../widgets/summary_grid.dart';
import '../widgets/metric_grid.dart';
import '../widgets/sales_purchase_chart.dart';
import '../widgets/overall_info_card.dart';
import '../widgets/customers_overview_card.dart';
import '../widgets/sales_statistics_chart.dart';
import '../widgets/top_selling_products_card.dart';
import '../widgets/low_stock_products_card.dart';
import '../widgets/top_customers_card.dart';

/// Home screen - Dashboard
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _endDate = now;
    _startDate = now.subtract(const Duration(days: 7));

    // Preload all dropdown providers in the background
    // This ensures data is ready when user navigates to forms that need them
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preloadDropdownProviders();
    });
  }

  /// Preload all backend providers used in dropdowns to avoid loading indicators
  /// when users navigate to screens that need them
  /// This is fire-and-forget - we don't wait for completion
  void _preloadDropdownProviders() {
    final ref = this.ref;
    
    // Preload all providers in parallel (fire and forget)
    // Since providers have keepAlive: true, data will be cached
    // Using unawaited to explicitly mark as fire-and-forget
    unawaited(
      Future.wait([
        ref.read(categoryProvider.future),
        ref.read(brandProvider.future),
        ref.read(unitProvider.future),
        ref.read(modelProvider.future),
        ref.read(bankProvider.future),
        ref.read(itemProvider.future),
        // branchProvider is already being watched in build method
        // Note: subCategoryProvider and supplierCustomerProvider need parameters,
        // so they can't be preloaded without context
      ]).then((_) {
        // Successfully preloaded all providers
        print('✅ Dropdown providers preloaded');
      }, onError: (error) {
        // Silently handle errors - providers will load when needed
        print('⚠️ Error preloading dropdown providers: $error');
      }),
    );
  }

  void _handleDateRangeChanged(DateTimeRange range) {
    setState(() {
      _startDate = range.start;
      _endDate = range.end;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Prefetch branches to ensure they are available for the drawer and other components.
    // Since BranchNotifier has keepAlive: true, this data will persist in memory.
    ref.watch(branchProvider);

    final l10n = AppLocalizations.of(context);
    final companyAsync = ref.watch(companyProvider);

    // Get default start date from company settings or fallback to one week ago
    final defaultStartDate = companyAsync.whenOrNull(
          data: (company) => company?.defaultStartDate,
        ) ??
        DateTime.now().subtract(const Duration(days: 7));

    final startDate = _startDate ?? defaultStartDate;
    final endDate = _endDate ?? DateTime.now();

    // Watch dashboard with current date range
    final dashboardState = ref.watch(
      getDashboardProvider(startDate: startDate, endDate: endDate),
    );

    return Scaffold(
      body: SafeArea(
        child: dashboardState.when(
          data: (dashboard) {
            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(
                  getDashboardProvider(startDate: startDate, endDate: endDate),
                );
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    // Period Selector
                    DashboardPeriodSelector(
                      initialStartDate: startDate,
                      initialEndDate: endDate,
                      onDateRangeChanged: _handleDateRangeChanged,
                    ),
                    
                    const SizedBox(height: AppSizes.sm),
                     // Alert Banner (if alert exists)
                    if (dashboard.alerts != null) ...[
                      AlertBanner(alert: dashboard.alerts!),
                      const SizedBox(height: AppSizes.sm),
                    ],

                    // Summary Grid (4 cards)
                    SummaryGrid(
                      summary: dashboard.summary,
                    ),

                    const SizedBox(height: AppSizes.lg),

                    // Metric Grid (horizontal scroll: Profit, Invoice Due, Expenses, Payment Returns)
                    MetricGrid(
                      summary: dashboard.summary,
                    ),

                    const SizedBox(height: AppSizes.lg),

                    // Sales & Purchase Chart
                    SalesPurchaseChart(
                      chartData: dashboard.charts.salesPurchase,
                    ),

                    const SizedBox(height: AppSizes.lg),

                    // Overall Information
                    OverallInfoCard(
                      overallInfo: dashboard.overallInfo,
                    ),

                    const SizedBox(height: AppSizes.lg),

                    // Customers Overview
                    CustomersOverviewCard(
                      chartCustomer: dashboard.charts.customer,
                    ),

                    const SizedBox(height: AppSizes.lg),

                    // Sales Statistics
                    SalesStatisticsChart(
                      chartData: dashboard.charts.salesStatistics,
                    ),

                    const SizedBox(height: AppSizes.lg),

                    // Top Selling Products
                    TopSellingProductsCard(
                      products: dashboard.lists.topSellingProducts,
                    ),

                    const SizedBox(height: AppSizes.lg),

                    // Low Stock Products
                    LowStockProductsCard(
                      products: dashboard.lists.lowStockProducts,
                    ),

                    const SizedBox(height: AppSizes.lg),

                    // Top Customers
                    TopCustomersCard(
                      customers: dashboard.lists.topCustomers,
                    ),

                    const SizedBox(height: AppSizes.lg),

                    // TODO: Add more dashboard widgets here
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
                const SizedBox(height: AppSizes.lg),
                ElevatedButton(
                  onPressed: () => ref.invalidate(
                    getDashboardProvider(startDate: startDate, endDate: endDate),
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
