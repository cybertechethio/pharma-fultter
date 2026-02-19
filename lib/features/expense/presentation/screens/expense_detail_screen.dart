import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../domain/entities/expense.dart';
import '../../domain/entities/expense_detail.dart';
import '../providers/expense_detail_provider.dart';
import '../providers/expense_events.dart';
import '../widgets/expense_attachments_widget.dart';
import '../widgets/expense_basic_info_widget.dart';
import '../widgets/expense_payments_widget.dart';

class ExpenseDetailScreen extends ConsumerWidget {
  final Expense expense;

  const ExpenseDetailScreen({
    super.key,
    required this.expense,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final expenseId = expense.id;
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
          ref.invalidate(expenseDetailProvider(expenseId));
        } else if (next is ExpensePaymentMethodDeleted) {
          snackbar.showSuccess(next.message);
          ref.invalidate(expenseDetailProvider(expenseId));
        }
        ref.read(expenseUiEventsProvider.notifier).clear();
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: asyncDetail.whenOrNull(data: (d) => d.name) ?? expense.name,
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
              const SizedBox(height: AppSizes.lg),
              ElevatedButton(
                onPressed: () => ref.invalidate(expenseDetailProvider(expenseId)),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildContent(BuildContext context, ExpenseDetail detail, WidgetRef ref) {
    final expenseId = expense.id;
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(expenseDetailProvider(expenseId));
        await ref.read(expenseDetailProvider(expenseId).future);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(AppSizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpenseBasicInfoWidget(expense: detail),
            const SizedBox(height: AppSizes.sm),
            ExpenseAttachmentsWidget(attachments: detail.attachments),
            const SizedBox(height: AppSizes.sm),
            ExpensePaymentsWidget(detail: detail),
          ],
        ),
      ),
    );
  }
}


