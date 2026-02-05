import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../supplier_customer/domain/entities/supplier_customer.dart';
import '../../../supplier_customer/presentation/providers/supplier_customer_notifier.dart';
import '../providers/customer_report_notifier.dart';
import '../widgets/customer_report/customer_summary_list.dart';
import '../widgets/customer_report/customer_item_list.dart';

/// Customer Report screen
class CustomerReportScreen extends ConsumerStatefulWidget {
  const CustomerReportScreen({super.key});

  @override
  ConsumerState<CustomerReportScreen> createState() => _CustomerReportScreenState();
}

class _CustomerReportScreenState extends ConsumerState<CustomerReportScreen> {
  final ScrollController _scrollController = ScrollController();
  
  // Filter state
  int? _customerId;

  @override
  void initState() {
    super.initState();
    // Listen to scroll events for infinite scroll
    _scrollController.addListener(_onScroll);
  }

  void _handleCustomerChanged(int? customerId) {
    setState(() {
      _customerId = customerId;
    });
    _applyFilters();
  }

  void _applyFilters() {
    final notifier = ref.read(customerReportProvider.notifier);
    notifier.applyFilters(
      customerId: _customerId,
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
      final notifier = ref.read(customerReportProvider.notifier);
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

  String _getCustomerDisplayName(List<SupplierCustomer> customers) {
    final l10n = AppLocalizations.of(context);
    if (_customerId == null) {
      return l10n.customer;
    }
    try {
      final customer = customers.firstWhere(
        (c) => int.tryParse(c.id) == _customerId,
      );
      return customer.name;
    } catch (e) {
      return l10n.customer;
    }
  }

  void _showCustomerMenu(BuildContext context, List<SupplierCustomer> customers) {
    final l10n = AppLocalizations.of(context);
    final RenderBox? button = context.findRenderObject() as RenderBox?;
    if (button == null) return;

    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset position = button.localToGlobal(Offset.zero);

    showMenu<int?>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + button.size.height + 4,
        overlay.size.width - position.dx - button.size.width,
        overlay.size.height - position.dy - button.size.height - 4,
      ),
      items: [
        PopupMenuItem<int?>(
          value: null,
          child: Text(l10n.allCustomers),
        ),
        ...customers.map((customer) {
          final id = int.tryParse(customer.id);
          if (id == null) return null;
          return PopupMenuItem<int?>(
            value: id,
            child: Text(customer.name),
          );
        }).whereType<PopupMenuItem<int?>>(),
      ],
    ).then((value) {
      _handleCustomerChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    // Watch items list from notifier
    final itemsAsync = ref.watch(customerReportProvider);
    final notifier = ref.read(customerReportProvider.notifier);
    final canLoadMore = notifier.canLoadMore;
    final summary = notifier.summary;

    // Get customers for dropdown
    final customersAsync = ref.watch(
      supplierCustomerProvider(SupplierCustomerType.customer),
    );
    final customers = customersAsync.value ?? [];

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.customerReport,
      ),
      body: SafeArea(
        child: itemsAsync.when(
          data: (items) {
            return RefreshIndicator(
              onRefresh: () async {
                // Invalidate provider to reload
                ref.invalidate(customerReportProvider);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSizes.sm),
                  // Summary Cards (from notifier)
                  if (summary != null) CustomerSummaryList(summary: summary),
                  // Customer Selector
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.sm,
                      vertical: AppSizes.xs,
                    ),
                    child: InkWell(
                      onTap: () => _showCustomerMenu(context, customers),
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.md,
                          vertical: AppSizes.sm,
                        ),
                        decoration: BoxDecoration(
                          color: BrandColors.cardBackground,
                          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                          border: Border.all(
                            color: BrandColors.divider,
                            width: AppSizes.br,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _getCustomerDisplayName(customers),
                              style: context.body(
                                bold: _customerId != null,
                                color: _customerId != null
                                    ? BrandColors.textPrimary
                                    : BrandColors.textSecondary,
                              ),
                            ),
                            const SizedBox(width: AppSizes.xs),
                            Icon(
                              Icons.arrow_drop_down,
                              size: AppSizes.iconSize,
                              color: BrandColors.textSecondary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Items List
                  Expanded(
                    child: CustomerItemList(
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
                  onPressed: () => ref.invalidate(customerReportProvider),
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

