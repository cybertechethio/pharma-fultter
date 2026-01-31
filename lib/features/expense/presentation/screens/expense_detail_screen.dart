import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../domain/entities/expense_detail.dart';
import '../providers/expense_detail_provider.dart';
import '../providers/expense_events.dart';
import '../widgets/expense_basic_info_widget.dart';
import '../widgets/expense_attachments_widget.dart';
import '../widgets/expense_payments_widget.dart';
import '../widgets/payment_method_create_dialog.dart';

class ExpenseDetailScreen extends ConsumerWidget {
  final String expenseId;

  const ExpenseDetailScreen({
    super.key,
    required this.expenseId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncDetail = ref.watch(expenseDetailProvider(expenseId));

    // Listen to UI events for user feedback
    ref.listen<ExpenseUiEvent?>(
      expenseUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is ExpenseFailure) {
          snackbar.showError(next.failure);
        } else if (next is ExpensePaymentMethodUpdated) {
          snackbar.showSuccess(next.message);
          // Refresh the expense detail to get updated payment methods
          ref.invalidate(expenseDetailProvider(expenseId));
        } else if (next is ExpensePaymentMethodDeleted) {
          snackbar.showSuccess(next.message);
          // Refresh the expense detail to get updated payment methods
          ref.invalidate(expenseDetailProvider(expenseId));
        }
        ref.read(expenseUiEventsProvider.notifier).clear();
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Expense Details',
      ),
      body: asyncDetail.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (detail) => _buildContent(context, detail, ref),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              app_err.ErrorsWidget(
                failure: error is Failure ? error : Failure.unexpectedError(error.toString()),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(expenseDetailProvider(expenseId)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCreatePaymentMethodDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => PaymentMethodCreateDialog(
        expenseId: expenseId,
      ),
    );
  }

  Widget _buildContent(BuildContext context, ExpenseDetail detail, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(expenseDetailProvider(expenseId));
        await ref.read(expenseDetailProvider(expenseId).future);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Info
            ExpenseBasicInfoWidget(expense: detail),
            // Attachments
            ExpenseAttachmentsWidget(attachments: detail.attachments),
            // Add Payment Method Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _showCreatePaymentMethodDialog(context),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Payment Method'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            // Payments
            ExpensePaymentsWidget(
              expensePayments: detail.expensePayments,
              expenseId: detail.id,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}


