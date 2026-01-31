import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../core/utils/transaction_status_helper.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/utils/formatters.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/entities/transaction_detail.dart';
import '../providers/transaction_detail_notifier.dart';
import '../providers/transaction_events.dart';
import '../providers/transaction_loading_providers.dart';
import '../providers/transaction_notifier.dart';
import '../widgets/transaction_attachments_widget.dart';
import '../widgets/transaction_payment_detail_widget.dart';
import '../widgets/transaction_items_detail_widget.dart';
import '../widgets/transaction_reversal_dialog.dart';

class TransactionDetailScreen extends ConsumerWidget {
  final int transactionId;

  const TransactionDetailScreen({
    super.key,
    required this.transactionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Transaction Details',
      ),
      body: asyncDetail.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (detail) {
          if (detail == null) {
            return const Center(child: Text('Transaction not found'));
          }
          return _buildContent(context, detail, ref);
        },
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              app_err.ErrorsWidget(
                failure: error is Failure ? error : Failure.unexpectedError(error.toString()),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(transactionDetailProvider(transactionId)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, TransactionDetail detail, WidgetRef ref) {
    final transaction = detail.transaction;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    // Check if transaction can be reversed
    final canReverse = transaction.transactionType.canBeReversed() &&
        transaction.status.toLowerCase() == 'completed';

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(transactionDetailProvider(transactionId));
        await ref.read(transactionDetailProvider(transactionId).future);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transaction.transactionNumber,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                transaction.transactionType.getDisplayLabel(),
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _buildStatusBadge(context, transaction.status, colorScheme),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    _buildInfoRow(
                      context,
                      'Date',
                      Formatters.formatDateTime(transaction.createdAt),
                      theme,
                      colorScheme,
                    ),
                    const SizedBox(height: 8),
                    if (transaction.transactionType == TransactionType.sale &&
                        transaction.customerName != null)
                      _buildInfoRow(
                        context,
                        'Customer',
                        transaction.customerName!,
                        theme,
                        colorScheme,
                      ),
                    if (transaction.transactionType == TransactionType.purchase &&
                        transaction.supplierName != null)
                      _buildInfoRow(
                        context,
                        'Supplier',
                        transaction.supplierName!,
                        theme,
                        colorScheme,
                      ),
                    if (transaction.transactionType != TransactionType.sale &&
                        transaction.transactionType != TransactionType.purchase &&
                        transaction.creatorName != null)
                      _buildInfoRow(
                        context,
                        'Creator',
                        transaction.creatorName!,
                        theme,
                        colorScheme,
                      ),
                    if (transaction.notes != null && transaction.notes!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        context,
                        'Notes',
                        transaction.notes!,
                        theme,
                        colorScheme,
                      ),
                    ],
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    _buildInfoRow(
                      context,
                      'Subtotal',
                      Formatters.formatAmount(transaction.subtotal),
                      theme,
                      colorScheme,
                    ),
                    const SizedBox(height: 8),
                    _buildInfoRow(
                      context,
                      'Tax',
                      Formatters.formatAmount(transaction.totalTax),
                      theme,
                      colorScheme,
                    ),
                    const SizedBox(height: 8),
                    _buildInfoRow(
                      context,
                      'Total',
                      Formatters.formatAmount(transaction.totalAmount),
                      theme,
                      colorScheme,
                      isTotal: true,
                    ),
                  ],
                ),
              ),
            ),
            // Attachments
            TransactionAttachmentsWidget(attachments: detail.attachments),
            // Payment
            if (detail.payment != null)
              TransactionPaymentDetailWidget(payment: detail.payment!),
            // Items
            TransactionItemsDetailWidget(items: detail.transactionItems),
            // Reverse Button (for completed sale/purchase transactions)
            if (canReverse) ...[
              const SizedBox(height: 8),
              _buildReverseButton(context, transaction, l10n, colorScheme, ref),
            ],
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildReverseButton(
    BuildContext context,
    Transaction transaction,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    WidgetRef ref,
  ) {
    final isLoading = ref.watch(transactionReverseLoadingProvider);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: isLoading 
              ? null 
              : () => _handleReverseTransaction(context, transaction, ref),
          style: OutlinedButton.styleFrom(
            foregroundColor: colorScheme.error,
            side: BorderSide(color: colorScheme.error),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          icon: isLoading 
              ? SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: colorScheme.error,
                  ),
                )
              : const Icon(Icons.undo_rounded),
          label: Text(l10n.reverseTransaction),
        ),
      ),
    );
  }

  Future<void> _handleReverseTransaction(
    BuildContext context,
    Transaction transaction,
    WidgetRef ref,
  ) async {
    final note = await TransactionReversalHelper.showReversalDialog(
      context: context,
      transactionNumber: transaction.transactionNumber,
      transactionType: transaction.transactionType.getDisplayLabel(),
    );

    // If user cancelled, note will be null
    if (note == null) return;

    // Get the reversal type
    final reversalType = transaction.transactionType.getReversalType();
    if (reversalType == null) {
      return;
    }

    // Call the notifier method (follows proper architecture)
    await ref.read(transactionProvider.notifier).reverseTransaction(
      transactionType: reversalType,
      reversesTransactionId: transaction.id,
      notes: note.isNotEmpty ? note : null,
    );
  }

  Widget _buildStatusBadge(BuildContext context, String status, ColorScheme colorScheme) {
    final color = status.getTransactionStatusColor();
    final icon = status.getTransactionStatusIcon();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            status.toUpperCase(),
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value,
    ThemeData theme,
    ColorScheme colorScheme, {
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
            color: isTotal ? colorScheme.primary : null,
          ),
        ),
      ],
    );
  }
}

