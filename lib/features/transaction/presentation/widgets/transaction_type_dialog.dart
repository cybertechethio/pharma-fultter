import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/enums/transaction_type_enum.dart';

class TransactionTypeDialog extends StatelessWidget {
  final TransactionType selectedType;

  const TransactionTypeDialog({
    super.key,
    required this.selectedType,
  });

  static Future<TransactionType?> show({
    required BuildContext context,
    required TransactionType selectedType,
  }) {
    return showDialog<TransactionType>(
      context: context,
      builder: (context) => TransactionTypeDialog(
        selectedType: selectedType,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // Filter out reverse type
    final selectableTypes = TransactionType.values
        .where((type) => type != TransactionType.reverse)
        .toList();

    return SimpleDialog(
      title: Text(l10n.selectTransactionType),
      children: selectableTypes.map((type) {
        final isSelected = selectedType == type;
        
        return SimpleDialogOption(
          onPressed: () => context.pop(type),
          child: Row(
            children: [
              Icon(
                type.getIcon(),
                color: isSelected ? type.getColor() : null,
              ),
              const SizedBox(width: AppSizes.lg),
              Expanded(
                child: Text(
                  type.getDisplayLabel(),
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? type.getColor() : null,
                  ),
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check,
                  color: type.getColor(),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

