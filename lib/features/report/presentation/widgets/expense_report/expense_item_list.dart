import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/common/empty_widget.dart';
import '../../../domain/entities/expensereport/expense_item_data.dart';
import 'expense_item_card.dart';

class ExpenseItemList extends StatelessWidget {
  final List<ExpenseItemData> items;
  final ScrollController? scrollController;
  final bool canLoadMore;

  const ExpenseItemList({
    super.key,
    required this.items,
    this.scrollController,
    this.canLoadMore = false,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (items.isEmpty) {
      return Center(
        child: EmptyWidget(
          icon: Icons.receipt_long_outlined,
          title: l10n.noExpenses,
          message: l10n.noExpensesFound,
        ),
      );
    }

    return ListView.separated(
      controller: scrollController,
      itemCount: items.length + (canLoadMore ? 1 : 0),
      separatorBuilder: (context, index) {
        // Don't show divider before loading indicator
        if (index == items.length - 1 && canLoadMore) {
          return const SizedBox.shrink();
        }
        return const SizedBox(height: AppSizes.xs);
      },
      itemBuilder: (context, index) {
        // Show loading indicator at the end if loading more
        if (index == items.length) {
          return const Padding(
            padding: EdgeInsets.all(AppSizes.lg),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        return ExpenseItemCard(item: items[index]);
      },
    );
  }
}

