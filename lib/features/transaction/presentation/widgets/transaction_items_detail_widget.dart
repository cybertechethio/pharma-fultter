import 'package:flutter/material.dart';
import '../../../../shared/utils/formatters.dart';
import '../../domain/entities/transaction_item_detail.dart';
import '../../domain/entities/transaction_item_batch_detail.dart';

class TransactionItemsDetailWidget extends StatelessWidget {
  final List<TransactionItemDetail> items;

  const TransactionItemsDetailWidget({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (items.isEmpty) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.inventory_2_outlined,
                  size: 48,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 12),
                Text(
                  'No items',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.inventory_2,
                  size: 20,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Items (${items.length})',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ...items.map((item) => _TransactionItemExpansionTile(
            item: item,
            theme: theme,
            colorScheme: colorScheme,
          )),
        ],
      ),
    );
  }
}

class _TransactionItemExpansionTile extends StatefulWidget {
  final TransactionItemDetail item;
  final ThemeData theme;
  final ColorScheme colorScheme;

  const _TransactionItemExpansionTile({
    required this.item,
    required this.theme,
    required this.colorScheme,
  });

  @override
  State<_TransactionItemExpansionTile> createState() =>
      _TransactionItemExpansionTileState();
}

class _TransactionItemExpansionTileState
    extends State<_TransactionItemExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final theme = widget.theme;
    final colorScheme = widget.colorScheme;

    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                item.itemCode.substring(0, 1).toUpperCase(),
                style: TextStyle(
                  color: colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          title: Text(
            item.itemName,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                'Code: ${item.itemCode}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Qty: ${item.quantity.toStringAsFixed(0)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Tax: ${item.taxRate}%',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Formatters.formatAmount(item.total),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                _isExpanded ? Icons.expand_less : Icons.expand_more,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
        ),
        if (_isExpanded) ...[
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Batches (${item.batches.length})',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ...item.batches.map((batch) => _BatchCard(
                  batch: batch,
                  theme: theme,
                  colorScheme: colorScheme,
                )),
              ],
            ),
          ),
        ],
        const Divider(height: 1),
      ],
    );
  }
}

class _BatchCard extends StatelessWidget {
  final TransactionItemBatchDetail batch;
  final ThemeData theme;
  final ColorScheme colorScheme;

  const _BatchCard({
    required this.batch,
    required this.theme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  batch.batchNumber,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                Formatters.formatAmount(batch.total),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _BatchInfoItem(
                  label: 'Qty',
                  value: batch.quantity.toStringAsFixed(0),
                  theme: theme,
                  colorScheme: colorScheme,
                ),
              ),
              Expanded(
                child: _BatchInfoItem(
                  label: 'Cost',
                  value: Formatters.formatAmount(batch.costPrice),
                  theme: theme,
                  colorScheme: colorScheme,
                ),
              ),
              Expanded(
                child: _BatchInfoItem(
                  label: 'Unit',
                  value: Formatters.formatAmount(batch.unitPrice),
                  theme: theme,
                  colorScheme: colorScheme,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _BatchInfoItem(
                  label: 'Taxable',
                  value: Formatters.formatAmount(batch.taxableAmount),
                  theme: theme,
                  colorScheme: colorScheme,
                ),
              ),
              Expanded(
                child: _BatchInfoItem(
                  label: 'Tax',
                  value: Formatters.formatAmount(batch.taxAmount),
                  theme: theme,
                  colorScheme: colorScheme,
                ),
              ),
            ],
          ),
          if (batch.expirationDate != null) ...[
            const SizedBox(height: 8),
            Text(
              'Expires: ${Formatters.formatDateTime(batch.expirationDate!)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          const SizedBox(height: 4),
          Text(
            'From: ${batch.allocatedFrom}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _BatchInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final ThemeData theme;
  final ColorScheme colorScheme;

  const _BatchInfoItem({
    required this.label,
    required this.value,
    required this.theme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

