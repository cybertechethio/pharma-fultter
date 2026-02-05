import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../domain/entities/stock_movement.dart';
import '../widgets/stock_movement_header_section.dart';
import '../widgets/stock_movement_info_section.dart';
import '../widgets/stock_movement_metadata_section.dart';

class StockMovementDetailScreen extends ConsumerWidget {
  final StockMovement stockMovement;

  const StockMovementDetailScreen({
    super.key,
    required this.stockMovement,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.stockMovementDetails,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header: Item Name, Type Badge, Status
            StockMovementHeaderSection(stockMovement: stockMovement),
            const SizedBox(height: AppSizes.md),

            // 2. Movement Information: Quantity, Previous/New Stock, Branches
            StockMovementInfoSection(stockMovement: stockMovement),
            const SizedBox(height: AppSizes.md),

            // 3. Metadata: Dates, Creator/Updater, Notes
            StockMovementMetadataSection(stockMovement: stockMovement),
            const SizedBox(height: AppSizes.xl),
          ],
        ),
      ),
    );
  }
}
