import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/common/empty_widget.dart';
import '../../../domain/entities/bestsellerreport/best_seller.dart';
import 'best_seller_item_card.dart';

class BestSellerItemList extends StatelessWidget {
  final List<BestSeller> items;

  const BestSellerItemList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (items.isEmpty) {
      return Center(
        child: EmptyWidget(
          icon: Icons.trending_up_outlined,
          title: l10n.noBestSellers,
          message: l10n.noBestSellersFound,
        ),
      );
    }

    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: AppSizes.xs);
      },
      itemBuilder: (context, index) {
        return BestSellerItemCard(item: items[index]);
      },
    );
  }
}

