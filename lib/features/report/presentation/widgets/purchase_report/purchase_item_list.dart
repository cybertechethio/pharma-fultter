import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/common/empty_widget.dart';
import '../../../domain/entities/purchasereport/purchase_item_data.dart';
import 'purchase_item_card.dart';

class PurchaseItemList extends StatelessWidget {
  final List<PurchaseItemData> items;
  final ScrollController? scrollController;
  final bool canLoadMore;

  const PurchaseItemList({
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
          title: l10n.noPurchaseItems,
          message: l10n.noPurchaseItemsFound,
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

        return PurchaseItemCard(item: items[index]);
      },
    );
  }
}

