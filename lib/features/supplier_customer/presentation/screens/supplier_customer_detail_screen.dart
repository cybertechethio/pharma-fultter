import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../app/theme/app_sizes.dart';
import '../../../../core/errors/failure.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/supplier_customer.dart';
import '../providers/supplier_customer_detail_provider.dart';
import '../providers/supplier_customer_events.dart';
import '../widgets/detail/supplier_customer_header_section.dart';
import '../widgets/detail/supplier_customer_balance_section.dart';
import '../widgets/detail/supplier_customer_transactions_section.dart';

class SupplierCustomerDetailScreen extends ConsumerWidget {
  final String id;

  const SupplierCustomerDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final asyncData = ref.watch(supplierCustomerDetailProvider(id));

    // Listen for add balance and refund events to refresh data (customer or supplier)
    ref.listen<SupplierCustomerUiEvent?>(
      supplierCustomerUiEventsProvider(SupplierCustomerType.customer),
      (prev, next) {
        if (next == null) return;
        final match = (next is AddBalanceSuccess && (next.customerId == id || next.supplierId == id)) ||
            (next is RefundSuccess && (next.customerId == id || next.supplierId == id));
        if (match) ref.invalidate(supplierCustomerDetailProvider(id));
      },
    );
    ref.listen<SupplierCustomerUiEvent?>(
      supplierCustomerUiEventsProvider(SupplierCustomerType.supplier),
      (prev, next) {
        if (next == null) return;
        final match = (next is AddBalanceSuccess && (next.customerId == id || next.supplierId == id)) ||
            (next is RefundSuccess && (next.customerId == id || next.supplierId == id));
        if (match) ref.invalidate(supplierCustomerDetailProvider(id));
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: asyncData.whenOrNull(
          data: (data) => data.type == SupplierCustomerType.customer
              ? l10n.customerDetails
              : l10n.supplierDetails,
        ) ?? l10n.details,
      ),
      body: asyncData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              app_err.ErrorsWidget(
                failure: error is Failure ? error : Failure.unexpectedError(error.toString()),
              ),
              const SizedBox(height: AppSizes.lg),
              ElevatedButton(
                onPressed: () => ref.invalidate(supplierCustomerDetailProvider(id)),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
        data: (supplierCustomer) {
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(supplierCustomerDetailProvider(id)),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(AppSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SupplierCustomerHeaderSection(supplierCustomer: supplierCustomer),
                  const SizedBox(height: AppSizes.md),

                  // Balance + Add/Refund (customer and supplier)
                  SupplierCustomerBalanceSection(supplierCustomer: supplierCustomer),
                  const SizedBox(height: AppSizes.md),

                  SupplierCustomerTransactionsSection(supplierCustomerId: supplierCustomer.id),
                  const SizedBox(height: AppSizes.xl),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
