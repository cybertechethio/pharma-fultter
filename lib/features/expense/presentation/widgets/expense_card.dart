import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../routes/route_name.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../shared/components/ui/action_buttons.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../domain/entities/expense.dart';
import '../providers/expense_notifier.dart';
import '../providers/expense_loading_providers.dart';

class ExpenseCard extends ConsumerWidget {
  final Expense expense;
  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deleting = ref.watch(expenseDeleteLoadingProvider).contains(expense.id);
    final updating = ref.watch(expenseUpdateLoadingProvider).contains(expense.id);
    final l10n = AppLocalizations.of(context);

    return InkWell(
      onTap: () => _navigateToDetail(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.md,
          horizontal: AppSizes.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1: Name (left), ActionButtons (right)
            Row(
              children: [
                Expanded(
                  child: cardTitle(title: expense.name),
                ),
                ActionButtons(
                  onEdit: () => _openEdit(context),
                  onDelete: () => _confirmDelete(context, ref, l10n),
                  isEditing: updating,
                  isDeleting: deleting,
                  style: ActionButtonStyle.text,
                  editLabel: l10n.edit,
                  deleteLabel: l10n.delete,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.xs),
            // Row 2: Amount and Date
            Row(
              children: [
                // Amount
                Text(
                  Formatters.formatCurrency(double.tryParse(expense.amount) ?? 0.0),
                  style: context.small(bold: false, color: BrandColors.primary),
                ),
                const Spacer(),
                // Date
                Text(
                  Formatters.formatRelativeDate(expense.expenseDate),
                  style: context.small(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _openEdit(BuildContext context) {
    context.push(RouteName.expenseUpdate, extra: expense);
  }

  void _navigateToDetail(BuildContext context) {
    // Navigate to detail screen
    context.push(RouteName.expenseDetail, extra: expense);
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) async {
    final confirmed = await DeleteConfirmationHelper.showItemDeleteConfirmation(
      context: context,
      itemName: expense.name,
      itemType: l10n.expense,
    );
    if (!confirmed) return;

    await ref.read(expenseProvider.notifier).deleteExpense(id: expense.id);
  }
}
