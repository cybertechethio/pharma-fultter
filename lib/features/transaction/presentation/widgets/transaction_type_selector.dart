import 'package:flutter/material.dart';
import '../../../../core/enums/transaction_type_enum.dart';

class TransactionTypeSelector extends StatelessWidget {
  final TransactionType? selectedType;
  final ValueChanged<TransactionType> onChanged;
  final String? errorText;

  const TransactionTypeSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Transaction Type *',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          // Filter out reversal types - they can't be selected directly
          children: TransactionType.values
              .where((type) => !type.isReversalType())
              .map((type) {
            final isSelected = selectedType == type;
            return ChoiceChip(
              label: Text(_getTypeLabel(type)),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  onChanged(type);
                }
              },
              selectedColor: colorScheme.primaryContainer,
              labelStyle: TextStyle(
                color: isSelected
                    ? colorScheme.onPrimaryContainer
                    : colorScheme.onSurface,
              ),
            );
          }).toList(),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.error,
            ),
          ),
        ],
      ],
    );
  }

  String _getTypeLabel(TransactionType type) {
    switch (type) {
      case TransactionType.purchase:
        return 'Purchase';
      case TransactionType.sale:
        return 'Sale';
      case TransactionType.adjustment:
        return 'Adjustment';
      case TransactionType.purchaseReverse:
        return 'Purchase Reverse';
      case TransactionType.saleReverse:
        return 'Sale Reverse';
    }
  }
}

