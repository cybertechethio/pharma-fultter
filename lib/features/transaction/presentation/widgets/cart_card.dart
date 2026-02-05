import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../item/domain/entities/item.dart';
import '../providers/form/transaction_form_notifier.dart';

class CartCard extends ConsumerWidget {
  final Item item;
  final bool isInCart;
  final int quantity;

  const CartCard({
    super.key,
    required this.item,
    required this.isInCart,
    required this.quantity,
  });

  Future<void> _showQtyDialog(BuildContext context, WidgetRef ref, int currentQty) async {
    final l10n = AppLocalizations.of(context);
    final qtyController = TextEditingController(text: currentQty.toString());

    final result = await showDialog<int>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.updateQuantity),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: qtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: l10n.quantity,
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => dialogContext.pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              final qty = int.tryParse(qtyController.text);
              if (qty != null && qty > 0) {
                dialogContext.pop(qty);
              }
            },
            child: Text(l10n.update),
          ),
        ],
      ),
    );

    if (result != null && result > 0) {
      ref.read(transactionFormProvider.notifier).addToCart(item, result);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final formNotifier = ref.read(transactionFormProvider.notifier);

    return Card(
      margin: EdgeInsets.only(bottom: AppSizes.md),
      child: Padding(
        padding: isInCart
            ? EdgeInsets.only(
                left: AppSizes.md,
                right: AppSizes.md,
                top: AppSizes.md,
                bottom: AppSizes.xs,
              )
            : EdgeInsets.all(AppSizes.md),
        child: isInCart
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row: Image and Item Info
                  Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: BrandColors.divider,
                          borderRadius: BorderRadius.circular(AppSizes.radius),
                        ),
                        child: Icon(
                          Icons.inventory_2_outlined,
                          color: BrandColors.textSecondary,
                          size: 28,
                        ),
                      ),
                      SizedBox(width: AppSizes.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: context.body(bold: true),
                            ),
                            SizedBox(height: AppSizes.xs),
                            Text(
                              '${item.code} • ${Formatters.formatCurrency(item.unitPrice)}',
                              style: context.small(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Bottom row: Cart Controls
                  SizedBox(height: AppSizes.xs),
                  Row(
                    children: [
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: quantity <= 1
                            ? null
                            : () => formNotifier.removeFromCart(item.id),
                        color: quantity <= 1
                            ? BrandColors.textDisabled
                            : BrandColors.primary,
                      ),
                      InkWell(
                        onTap: () => _showQtyDialog(context, ref, quantity),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.md,
                            vertical: AppSizes.xs,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: BrandColors.divider),
                            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                          ),
                          child: Text(
                            quantity.toString(),
                            style: context.body(bold: true),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () => formNotifier.addToCart(item, null),
                        color: BrandColors.primary,
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => formNotifier.deleteFromCart(item.id),
                        color: BrandColors.error,
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: BrandColors.divider,
                      borderRadius: BorderRadius.circular(AppSizes.radius),
                    ),
                    child: Icon(
                      Icons.inventory_2_outlined,
                      color: BrandColors.textSecondary,
                      size: 28,
                    ),
                  ),
                  SizedBox(width: AppSizes.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: context.body(bold: true),
                        ),
                        SizedBox(height: AppSizes.xs),
                        Text(
                          '${item.code} • ${Formatters.formatCurrency(item.unitPrice)}',
                          style: context.small(),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => formNotifier.addToCart(item, null),
                    child: Text(l10n.add),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: BrandColors.primary,
                      foregroundColor: BrandColors.textLight,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
