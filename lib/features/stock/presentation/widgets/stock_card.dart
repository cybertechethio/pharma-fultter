import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/route_name.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/components/common/stock_status_widget.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/stock.dart';

class StockCard extends ConsumerWidget {
  final Stock stock;
  const StockCard({super.key, required this.stock});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = stock.item;
    final l10n = AppLocalizations.of(context);

    return InkWell(
      onTap: () => _navigateToDetail(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.md,
          horizontal: AppSizes.xs,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1: Name .............. Qty
            Row(
              children: [
                Expanded(
                  child: cardTitle(
                    title: item?.name ?? l10n.unknownItem,
                  ),
                ),
                Text(
                  'Qty: ${stock.totalQuantity}',
                  style: context.small(),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.xs),
            // Row 2: Code ................ Status
            Row(
              children: [
                Expanded(
                  child: Text(
                    item?.code?.isNotEmpty ?? false
                        ? 'Code: ${item!.code}'
                        : '',
                    style: context.small(),
                  ),
                ),
                StockStatusWidget(status: stock.lowStockStatus),
              ],
            ),
            const SizedBox(height: AppSizes.xs),
            // Row 3: Category .......... Time
            Row(
              children: [
                Expanded(
                  child: Text(
                    item?.categories?.isNotEmpty ?? false
                        ? item!.categories!
                        : '',
                    style: context.small(),
                  ),
                ),
                Text(
                  Formatters.formatRelativeDate(stock.createdAt),
                  style: context.small(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context) {
    context.push(RouteName.stockDetail, extra: stock);
  }
}

