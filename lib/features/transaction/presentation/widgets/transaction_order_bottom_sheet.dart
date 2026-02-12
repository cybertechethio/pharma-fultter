import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../data/models/create_trans_request.dart';
import '../providers/form/transaction_form_notifier.dart';
import '../providers/transaction_notifier.dart';
import '../providers/transaction_loading_providers.dart';

class TransactionOrderBottomSheet extends ConsumerWidget {
  const TransactionOrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(transactionFormProvider);
    final formNotifier = ref.read(transactionFormProvider.notifier);
    final createLoading = ref.watch(transactionCreateLoadingProvider);
    
    final itemCount = formNotifier.getCartItemCount();
    final total = formNotifier.getTotal();
    final transactionType = formState.request.transactionType;
    
    // Check if should show payment summary (purchase, sale, or imported)
    final showPaymentSummary = transactionType == TransactionType.purchase ||
        transactionType == TransactionType.sale ||
        transactionType == TransactionType.imported;
    
    final totalPaid = showPaymentSummary ? formNotifier.getTotalPaid() : 0.0;
    final remaining = showPaymentSummary ? (total - totalPaid) : 0.0;

    // Only show if cart has items
    if (itemCount == 0) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: BrandColors.background,
        boxShadow: [
          BoxShadow(
            color: BrandColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Summary Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Total Amount
                  _buildSummaryRow(
                    context,
                    label: AppLocalizations.of(context).total,
                    amount: total,
                    isPrimary: true,
                  ),
                  // Paid Amount (only for purchase/sale)
                  if (showPaymentSummary) ...[
                    const SizedBox(height: AppSizes.sm),
                    _buildSummaryRow(
                      context,
                      label: AppLocalizations.of(context).paid,
                      amount: totalPaid,
                      isPrimary: false,
                    ),
                    const SizedBox(height: AppSizes.sm),
                    _buildSummaryRow(
                      context,
                      label: AppLocalizations.of(context).remaining,
                      amount: remaining,
                      isPrimary: false,
                      isRemaining: true,
                    ),
                  ],
                ],
              ),
              const SizedBox(height: AppSizes.md),
              // Place Order Button
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'Place Order',
                  onPressed: createLoading
                      ? null
                      : () => _handlePlaceOrder(context, ref),
                  isLoading: createLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(
    BuildContext context, {
    required String label,
    required double amount,
    required bool isPrimary,
    bool isRemaining = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.small(
            color: isRemaining && amount > 0
                ? BrandColors.error
                : BrandColors.textSecondary,
          ),
        ),
        Text(
          Formatters.formatCurrency(amount),
          style: isPrimary
              ? context.subtitle(
                  bold: true,
                  color: BrandColors.primary,
                )
              : context.body(
                  bold: isRemaining && amount > 0,
                  color: isRemaining && amount > 0
                      ? BrandColors.error
                      : BrandColors.textPrimary,
                ),
        ),
      ],
    );
  }

  Future<void> _handlePlaceOrder(BuildContext context, WidgetRef ref) async {
    final formState = ref.read(transactionFormProvider);
    final formNotifier = ref.read(transactionFormProvider.notifier);
    final snackbar = ref.read(snackbarServiceProvider);

    // Check items that have no batch selected
    final itemIdsWithNoBatch = <int>[];
    for (final itemId in formState.cartItems.keys) {
      final batches = formState.cartItemBatches[itemId] ?? [];
      if (batches.isEmpty) {
        itemIdsWithNoBatch.add(itemId);
      }
    }
    if (itemIdsWithNoBatch.isNotEmpty) {
      formNotifier.setItemIdsRequiringBatch(itemIdsWithNoBatch);
      snackbar.showWarning('Please select at least one batch for each item');
      return;
    }

    formNotifier.setItemIdsRequiringBatch([]);

    // Build request from form state (with cart items)
    final request = formNotifier.buildRequest();

    // Validate the built request (not the state's request)
    final validationError = request.validate();
    if (validationError != null) {
      snackbar.showWarning(validationError);
      return;
    }

    // Create transaction
    await ref.read(transactionProvider.notifier).createTransaction(
      data: request,
      receiptFilePaths: formState.receiptFilePaths,
      paymentAttachmentFilePaths: formState.paymentAttachmentFilePaths,
    );
  }
}

