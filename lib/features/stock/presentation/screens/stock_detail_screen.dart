import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/enums/stock_status_enum.dart';
import '../../../../routes/route_name.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../domain/entities/stock.dart';
import '../../domain/entities/stock_batch.dart';
import '../widgets/stock_detail_sections/compact_info_row.dart';

class StockDetailScreen extends ConsumerWidget {
  final Stock stock;

  const StockDetailScreen({
    super.key,
    required this.stock,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Determine stock status
    final stockStatusColor = stock.lowStockStatus.getColor();
    final stockStatusText = stock.lowStockStatus.getDisplayText();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Stock Details',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Card
            Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stock.item.name,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Total Quantity: ${stock.totalQuantity}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: stockStatusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: stockStatusColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            stock.lowStockStatus.getIcon(),
                            size: 14,
                            color: stockStatusColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            stockStatusText,
                            style: TextStyle(
                              color: stockStatusColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Item Information Section
            _buildItemInformationSection(context, theme, colorScheme, stock),

            const SizedBox(height: 12),

            // Basic Information Section
            _buildBasicInfoSection(context, theme, colorScheme, stock),

            const SizedBox(height: 12),

            // Stock Batches Section
            _buildStockBatchesSection(context, theme, colorScheme, stock),

            const SizedBox(height: 12),

            // Metadata Section
            _buildMetadataSection(context, theme, colorScheme, stock),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildItemInformationSection(BuildContext context, ThemeData theme, ColorScheme colorScheme, Stock stock) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Item Information',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            CompactInfoRow(
              icon: Icons.shopping_bag_outlined,
              label: 'Item Name',
              value: stock.item.name,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.qr_code_outlined,
              label: 'Item Code',
              value: stock.item.code,
              isCompact: true,
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () {
                context.push(RouteName.itemDetail, extra: stock.item);
              },
              icon: const Icon(Icons.visibility_outlined),
              label: const Text('View Item Details'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfoSection(BuildContext context, ThemeData theme, ColorScheme colorScheme, Stock stock) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Information',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            CompactInfoRow(
              icon: Icons.inventory_2_outlined,
              label: 'Item ID',
              value: stock.itemId.toString(),
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.numbers_outlined,
              label: 'Total Quantity',
              value: stock.totalQuantity,
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.business_outlined,
              label: 'Company ID',
              value: stock.companyId.toString(),
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.store_outlined,
              label: 'Branch ID',
              value: stock.branchId.toString(),
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.warning_amber_outlined,
              label: 'Low Stock Threshold',
              value: stock.lowStockThreshold,
              isCompact: true,
            ),
            if (stock.location != null && stock.location!.isNotEmpty) ...[
              const Divider(height: 12),
              CompactInfoRow(
                icon: Icons.location_on_outlined,
                label: 'Location',
                value: stock.location!,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStockBatchesSection(BuildContext context, ThemeData theme, ColorScheme colorScheme, Stock stock) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Stock Batches',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${stock.branchStockBatches.length}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (stock.branchStockBatches.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'No batches available',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
            else
              ...stock.branchStockBatches.map((batch) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildBatchCard(context, theme, colorScheme, batch),
                  )),
          ],
        ),
      ),
    );
  }

  Widget _buildBatchCard(BuildContext context, ThemeData theme, ColorScheme colorScheme, StockBatch batch) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First row: Batch Name and Quantity
          Row(
            children: [
              Icon(
                Icons.inventory_2_outlined,
                size: 16,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  batch.batchName,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Qty: ${batch.quantity}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Second row: Batch Number
          _buildBatchInfoItem(
            context,
            theme,
            'Batch #',
            batch.batchNumber,
            Icons.qr_code_outlined,
          ),
          if (batch.lastUsedAt != null) ...[
            const SizedBox(height: 8),
            _buildBatchInfoItem(
              context,
              theme,
              'Last Used',
              DateFormat('yyyy-MM-dd HH:mm').format(batch.lastUsedAt!),
              Icons.access_time_outlined,
            ),
          ],
          if (batch.expirationDate != null) ...[
            const SizedBox(height: 8),
            _buildBatchInfoItem(
              context,
              theme,
              'Expiration',
              DateFormat('yyyy-MM-dd').format(batch.expirationDate!),
              Icons.calendar_today_outlined,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBatchInfoItem(BuildContext context, ThemeData theme, String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 14, color: theme.colorScheme.onSurfaceVariant),
        const SizedBox(width: 4),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMetadataSection(BuildContext context, ThemeData theme, ColorScheme colorScheme, Stock stock) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Metadata',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            CompactInfoRow(
              icon: Icons.calendar_today_outlined,
              label: 'Created At',
              value: dateFormat.format(stock.createdAt),
              isCompact: true,
            ),
            if (stock.updatedAt != null) ...[
              const Divider(height: 12),
              CompactInfoRow(
                icon: Icons.update_outlined,
                label: 'Updated At',
                value: dateFormat.format(stock.updatedAt!),
                isCompact: true,
              ),
            ],
            if (stock.createdBy != null) ...[
              const Divider(height: 12),
              CompactInfoRow(
                icon: Icons.person_outline,
                label: 'Created By',
                value: stock.createdBy.toString(),
                isCompact: true,
              ),
            ],
            if (stock.updatedBy != null) ...[
              const Divider(height: 12),
              CompactInfoRow(
                icon: Icons.person_outline,
                label: 'Updated By',
                value: stock.updatedBy.toString(),
                isCompact: true,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

