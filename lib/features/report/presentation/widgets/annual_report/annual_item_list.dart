import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/common/empty_widget.dart';
import '../../../domain/entities/annualreport/annual_item_data.dart';
import 'annual_item_card.dart';

class AnnualItemList extends StatelessWidget {
  final List<AnnualItemData> items;

  const AnnualItemList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (items.isEmpty) {
      return Center(
        child: EmptyWidget(
          icon: Icons.description_outlined,
          title: l10n.noAnnualItems,
          message: l10n.noAnnualItemsFound,
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
        return AnnualItemCard(item: items[index]);
      },
    );
  }
}

