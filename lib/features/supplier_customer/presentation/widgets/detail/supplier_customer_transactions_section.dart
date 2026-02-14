import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/common/empty_widget.dart';
import '../../../../../shared/components/common/error_widget.dart' as app_err;
import '../../providers/supplier_customer_transactions_notifier.dart' as txn_provider;
import 'supplier_customer_transaction_card.dart';

class SupplierCustomerTransactionsSection extends ConsumerWidget {
  final String supplierCustomerId;

  const SupplierCustomerTransactionsSection({
    super.key,
    required this.supplierCustomerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final asyncTransactions = ref.watch(txn_provider.supplierCustomerTransactionsProvider(supplierCustomerId));

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: BrandColors.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.transactions,
            style: context.subtitle(bold: true),
          ),
          const SizedBox(height: AppSizes.md),
          asyncTransactions.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Column(
              children: [
                app_err.ErrorsWidget(
                  failure: error is Failure ? error : Failure.unexpectedError(error.toString()),
                ),
                const SizedBox(height: AppSizes.md),
                ElevatedButton(
                  onPressed: () => ref.invalidate(txn_provider.supplierCustomerTransactionsProvider(supplierCustomerId)),
                  child: Text(l10n.retry),
                ),
              ],
            ),
            data: (transactions) {
              if (transactions.isEmpty) {
                return Center(
                  child: EmptyWidget(
                    icon: Icons.receipt_long_outlined,
                    title: l10n.noTransactions,
                    message: l10n.noTransactionsYet,
                  ),
                );
              }
              return Column(
                children: transactions.map((t) => SupplierCustomerTransactionCard(transaction: t)).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
