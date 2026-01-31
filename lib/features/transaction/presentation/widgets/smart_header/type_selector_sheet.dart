import 'package:flutter/material.dart';
import '../../../../../core/enums/transaction_type_enum.dart';

/// Bottom sheet for selecting transaction type
/// Shows all types with icons and descriptions
class TypeSelectorSheet extends StatelessWidget {
  final TransactionType? selectedType;
  final ValueChanged<TransactionType> onSelected;

  const TypeSelectorSheet({
    super.key,
    this.selectedType,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Title
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
            child: Row(
              children: [
                Icon(
                  Icons.receipt_long_rounded,
                  color: colorScheme.primary,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  'Transaction Type',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Type options
          Flexible(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 8),
              // Filter out reversal types - they can't be selected directly
              children: TransactionType.values
                  .where((type) => !type.isReversalType())
                  .map((type) {
                final isSelected = selectedType == type;
                return _TypeOptionTile(
                  type: type,
                  isSelected: isSelected,
                  onTap: () {
                    onSelected(type);
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
          // Safe area padding
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}

class _TypeOptionTile extends StatelessWidget {
  final TransactionType type;
  final bool isSelected;
  final VoidCallback onTap;

  const _TypeOptionTile({
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final typeColor = type.getColor();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Material(
        color: isSelected 
            ? typeColor.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected 
                    ? typeColor.withOpacity(0.5)
                    : colorScheme.outlineVariant.withOpacity(0.5),
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                // Icon container
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: typeColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    _getTypeIcon(type),
                    color: typeColor,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 16),
                // Text content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        type.getDisplayLabel(),
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isSelected ? typeColor : colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getTypeDescription(type),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                // Selection indicator
                if (isSelected)
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: typeColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  )
                else
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: colorScheme.outlineVariant,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getTypeIcon(TransactionType type) {
    switch (type) {
      case TransactionType.sale:
        return Icons.point_of_sale_rounded;
      case TransactionType.purchase:
        return Icons.shopping_cart_rounded;
      case TransactionType.adjustment:
        return Icons.tune_rounded;
      case TransactionType.purchaseReverse:
        return Icons.undo_rounded;
      case TransactionType.saleReverse:
        return Icons.undo_rounded;
    }
  }

  String _getTypeDescription(TransactionType type) {
    switch (type) {
      case TransactionType.sale:
        return 'Sell products to customers';
      case TransactionType.purchase:
        return 'Buy stock from suppliers';
      case TransactionType.adjustment:
        return 'Adjust inventory quantities';
      case TransactionType.purchaseReverse:
        return 'Reverse a purchase transaction';
      case TransactionType.saleReverse:
        return 'Reverse a sale transaction';
    }
  }
}

/// Show the type selector as a modal bottom sheet
Future<TransactionType?> showTypeSelectorSheet(
  BuildContext context, {
  TransactionType? selectedType,
}) async {
  TransactionType? result;
  
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => TypeSelectorSheet(
      selectedType: selectedType,
      onSelected: (type) {
        result = type;
      },
    ),
  );
  
  return result;
}

