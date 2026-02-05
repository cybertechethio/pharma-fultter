import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../shared/components/common/fab_button.dart';
import '../providers/expense_category_notifier.dart';
import '../providers/expense_category_events.dart';
import '../widgets/expense_category_card.dart';
import '../widgets/expense_category_form_dialog.dart';

class ExpenseCategoryListScreen extends ConsumerWidget {
  const ExpenseCategoryListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    // Listen to UI events
    ref.listen<ExpenseCategoryUiEvent?>(
      expenseCategoryUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is ExpenseCategoryFailure) {
          snackbar.showError(next.failure);
        } else if (next is ExpenseCategoryCreated) {
          snackbar.showSuccess(l10n.expenseCategoryCreatedSuccessfully);
        } else if (next is ExpenseCategoryUpdated) {
          snackbar.showSuccess(l10n.expenseCategoryUpdatedSuccessfully);
        } else if (next is ExpenseCategoryDeleted) {
          snackbar.showSuccess(l10n.expenseCategoryDeletedSuccessfully);
        }
        ref.read(expenseCategoryUiEventsProvider.notifier).clear();
      },
    );

    final asyncList = ref.watch(expenseCategoryProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.expenseCategories,
      ),
      body: asyncList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.category_outlined,
                title: l10n.noExpenseCategories,
                message: l10n.noExpenseCategoriesMessage,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(expenseCategoryProvider.notifier).load(),
            color: BrandColors.primary,
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSizes.lg),
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 1,
                color: BrandColors.divider,
              ),
              itemBuilder: (context, index) => ExpenseCategoryCard(item: items[index]),
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              app_err.ErrorsWidget(
                failure: error is Failure ? error : Failure.unexpectedError(error.toString()),
              ),
              const SizedBox(height: AppSizes.lg),
              ElevatedButton(
                onPressed: () => ref.read(expenseCategoryProvider.notifier).load(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => _openCreateDialog(context),
      ),
    );
  }

  void _openCreateDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => ExpenseCategoryFormDialog(
        title: l10n.createExpenseCategory,
        buttonText: l10n.create,
      ),
    );
  }
}
