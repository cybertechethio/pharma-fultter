import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/common/empty_widget.dart';
import '../../../domain/entities/profitlossreport/profit_loss_item_data.dart';
import 'profit_loss_item_card.dart';

class ProfitLossItemList extends StatelessWidget {
  final List<ProfitLossItemData> items;

  const ProfitLossItemList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (items.isEmpty) {
      return Center(
        child: EmptyWidget(
          icon: Icons.account_balance_wallet_outlined,
          title: l10n.noProfitLossItems,
          message: l10n.noProfitLossItemsFound,
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: AppSizes.xs);
      },
      itemBuilder: (context, index) {
        return ProfitLossItemCard(item: items[index]);
      },
    );
  }
}

