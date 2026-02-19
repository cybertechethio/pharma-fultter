import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../domain/entities/stock.dart';
import '../widgets/detail/stock_item_section.dart';
import '../widgets/detail/stock_overview_section.dart';
import '../widgets/detail/stock_metadata_section.dart';
import '../widgets/detail/stock_movements_section.dart';

class StockDetailScreen extends ConsumerWidget {
  final Stock stock;

  const StockDetailScreen({
    super.key,
    required this.stock,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: stock.item?.name ?? l10n.stockDetails,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Stock Information: Quantity, Code, Status, Threshold, Location
            StockOverviewSection(stock: stock),
            const SizedBox(height: AppSizes.xs2),

            // 3. Item Details: Category, Brand, Unit, etc.
            if (stock.item != null) ...[
              StockItemSection(stock: stock),
              const SizedBox(height: AppSizes.xs2),
            ],

            // 4. Stock Movements
            StockMovementsSection(stock: stock),
            const SizedBox(height: AppSizes.xs2),

            // 5. Metadata: Dates, Creator/Updater
            StockMetadataSection(stock: stock),
            const SizedBox(height: AppSizes.xxl),
          ],
        ),
      ),
    );
  }
}
