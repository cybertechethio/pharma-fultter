import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/route_name.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/components/common/stock_status_widget.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../core/enums/stock_status_enum.dart';
import '../../domain/entities/stock.dart';

class StockCard extends ConsumerWidget {
  final Stock stock;
  const StockCard({super.key, required this.stock});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

   

    return InkWell(
        onTap: () => _navigateToDetail(context),
        child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.md,
          horizontal: AppSizes.xs,
        ),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // Left side: Main content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  // Item Name
                  cardTitle(title: stock.item.name),
                  const SizedBox(height: AppSizes.xs),
                  // Item Code, Quantity, Batches in a row
                  Wrap(
                    spacing: AppSizes.sm,
                    runSpacing: AppSizes.xs,
                      children: [
                      if (stock.item.code.isNotEmpty)
                        Text(
                          'Code: ${stock.item.code}',
                          style: context.small(),
                          ),
                      Text(
                        'Qty: ${stock.totalQuantity}',
                        style: context.small(),
                          ),
                      Text(
                        'Batches: ${stock.branchStockBatches.length}',
                        style: context.small(),
                      ),
                    ],
                              ),
                  const SizedBox(height: AppSizes.xs),
                  // Status
                        StockStatusWidget(status: stock.lowStockStatus),
                            ],
                          ),
                        ),
            // Right side: Time
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.sm),
              child: Text(
                Formatters.formatRelativeDate(stock.createdAt),
                style: context.small(),
                ),
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

