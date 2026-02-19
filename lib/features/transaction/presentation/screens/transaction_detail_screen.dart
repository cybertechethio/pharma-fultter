import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../app/theme/app_sizes.dart';
import '../providers/transaction_detail_notifier.dart';
import '../providers/transaction_events.dart';
import '../../../payment_method/presentation/providers/payment_method_events.dart';
import '../widgets/detail/transaction_header_section.dart';
import '../widgets/detail/transaction_overview_section.dart';
import '../widgets/detail/transaction_summary_section.dart';
import '../widgets/detail/transaction_items_section.dart';
import '../widgets/detail/transaction_payment_section.dart';
import '../widgets/detail/transaction_attachments_section.dart';

class TransactionDetailScreen extends ConsumerWidget {
  final int transactionId;

  const TransactionDetailScreen({
    super.key,
    required this.transactionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final asyncDetail = ref.watch(transactionDetailProvider(transactionId));

    // Listen to UI events for user feedback
    ref.listen<TransactionUiEvent?>(
      transactionUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is TransactionFailure) {
          snackbar.showError(next.failure);
        } else if (next is TransactionReversed) {
          snackbar.showSuccess(next.message);
          // Refresh the transaction detail
          ref.invalidate(transactionDetailProvider(transactionId));
        }
        ref.read(transactionUiEventsProvider.notifier).clear();
      },
    );

    // Listen to payment method UI events
    ref.listen<PaymentMethodUiEvent?>(
      paymentMethodUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is PaymentMethodFailure) {
          snackbar.showError(next.failure);
        } else if (next is PaymentMethodCreated) {
          snackbar.showSuccess(l10n.paymentMethodCreatedSuccessfully);
          // Refresh the transaction detail
          ref.invalidate(transactionDetailProvider(transactionId));
        } else if (next is PaymentMethodUpdated) {
          snackbar.showSuccess(l10n.paymentMethodUpdatedSuccessfully);
          // Refresh the transaction detail
          ref.invalidate(transactionDetailProvider(transactionId));
        } else if (next is PaymentMethodDeleted) {
          snackbar.showSuccess(l10n.paymentMethodDeletedSuccessfully);
          // Refresh the transaction detail
          ref.invalidate(transactionDetailProvider(transactionId));
        }
        ref.read(paymentMethodUiEventsProvider.notifier).clear();
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.transactionDetails,
      ),
      body: asyncDetail.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (transaction) => _buildContent(context, transaction, ref),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              app_err.ErrorsWidget(
                failure: error is Failure ? error : Failure.unexpectedError(error.toString()),
              ),
              const SizedBox(height: AppSizes.lg),
              ElevatedButton(
                onPressed: () => ref.invalidate(transactionDetailProvider(transactionId)),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, transaction, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(transactionDetailProvider(transactionId));
        await ref.read(transactionDetailProvider(transactionId).future);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header: Transaction Number, Type, Status
            TransactionHeaderSection(transaction: transaction),
            const SizedBox(height: AppSizes.sm),

            // 2. Overview: Party, Sales Order, Dates, Creator/Updator
            TransactionOverviewSection(transaction: transaction),
            const SizedBox(height: AppSizes.md),

            // 3. Summary: Subtotal, Tax, Total, Notes
            TransactionSummarySection(transaction: transaction),
            const SizedBox(height: AppSizes.md),

            // 4. Items: Full item details
            TransactionItemsSection(transaction: transaction),
            const SizedBox(height: AppSizes.md),

            // 5. Payment: Payment details with methods
            TransactionPaymentSection(transaction: transaction),
            const SizedBox(height: AppSizes.md),

            // 6. Attachments: Transaction attachments
            TransactionAttachmentsSection(transaction: transaction),
            const SizedBox(height: AppSizes.xl),
          ],
        ),
      ),
    );
  }
}
