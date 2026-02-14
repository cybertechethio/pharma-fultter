import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../item/domain/entities/item_batch_summary.dart';
import '../../../item/domain/entities/item_with_batches.dart';
import '../../data/models/create_trans_request.dart';
import '../providers/form/transaction_form_notifier.dart';

class CartCard extends ConsumerStatefulWidget {
  final ItemWithBatches itemWithBatches;
  final bool isInCart;
  final List<CreateTransactionBatchRequest> batchSelections;
  final bool isInDialog;
  final bool addDisabled;

  const CartCard({
    super.key,
    required this.itemWithBatches,
    required this.isInCart,
    required this.batchSelections,
    this.isInDialog = false,
    this.addDisabled = false,
  });

  @override
  ConsumerState<CartCard> createState() => _CartCardState();
}

class _CartCardState extends ConsumerState<CartCard> {
  Future<void> _showQtyDialog(
    BuildContext context,
    WidgetRef ref,
    int itemId,
    int index,
    int currentQty,
    int maxQty,
  ) async {
    final l10n = AppLocalizations.of(context);
    final qtyController = TextEditingController(text: currentQty.toString());
    final formNotifier = ref.read(transactionFormProvider.notifier);

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
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              final qty = int.tryParse(qtyController.text);
              if (qty != null && qty > 0) {
                final clamped = qty > maxQty ? maxQty : qty;
                Navigator.of(dialogContext).pop(clamped);
              }
            },
            child: Text(l10n.update),
          ),
        ],
      ),
    );

    if (result != null && result > 0) {
      formNotifier.updateBatchQuantity(itemId, index, result);
    }
  }

  Future<void> _showPriceDialog(
    BuildContext context,
    WidgetRef ref,
    int itemId,
    int index,
    double currentPrice,
    bool isUnitPrice,
  ) async {
    final l10n = AppLocalizations.of(context);
    final label = isUnitPrice ? l10n.unitPrice : l10n.costPrice;
    final priceController = TextEditingController(
      text: currentPrice > 0 ? currentPrice.toString() : '',
    );
    final formNotifier = ref.read(transactionFormProvider.notifier);

    final result = await showDialog<double>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('${l10n.update} $label'),
        content: TextField(
          controller: priceController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              final price = double.tryParse(priceController.text);
              if (price != null && price >= 0) {
                Navigator.of(dialogContext).pop(price);
              }
            },
            child: Text(l10n.update),
          ),
        ],
      ),
    );

    if (result != null && result >= 0) {
      if (isUnitPrice) {
        formNotifier.updateBatchPrice(itemId, index, unitPrice: result);
      } else {
        formNotifier.updateBatchPrice(itemId, index, costPrice: result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final formState = ref.watch(transactionFormProvider);
    final formNotifier = ref.read(transactionFormProvider.notifier);
    final item = widget.itemWithBatches;
    final batches = widget.batchSelections;
    final isInDialog = widget.isInDialog;
    final addDisabled = widget.addDisabled;
    final transactionType = formState.request.transactionType;
    final requiresBatch =
        !isInDialog && formState.itemIdsRequiringBatch.contains(item.id);
    final selectedBatchNumbers = batches.map((s) => s.batchNumber).toSet();
    final availableBatchesForDropdown = item.batches
        .where((b) => !selectedBatchNumbers.contains(b.batchNumber))
        .toList();

    final showUnitPrice = transactionType == TransactionType.sale;
    final showCostPrice = transactionType == TransactionType.purchase ||
        transactionType == TransactionType.imported;

    if (isInDialog) {
      return Card(
        margin: EdgeInsets.only(bottom: AppSizes.md),
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Row(
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
                    if (item.code != null && item.code!.isNotEmpty)
                      Text(
                        item.code!,
                        style: context.small(),
                      ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: (addDisabled || widget.isInCart)
                    ? null
                    : () => formNotifier.addToCart(item),
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

    return Card(
      margin: EdgeInsets.only(bottom: AppSizes.md),
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSizes.md,
          right: AppSizes.md,
          top: AppSizes.md,
          bottom: AppSizes.xs,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      if (item.code != null && item.code!.isNotEmpty)
                        Text(
                          item.code!,
                          style: context.small(),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: PopupMenuButton<ItemBatchSummary>(
                    onOpened: () {},
                    enabled: availableBatchesForDropdown.isNotEmpty,
                    tooltip: l10n.batch,
                    padding: EdgeInsets.zero,
                    offset: Offset(0, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.xs,
                        vertical: AppSizes.xs,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l10n.batches,
                            style: context.small(
                              color: availableBatchesForDropdown.isEmpty
                                  ? BrandColors.textDisabled
                                  : BrandColors.primary,
                            ),
                          ),
                          SizedBox(width: AppSizes.xxs),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 20,
                            color: availableBatchesForDropdown.isEmpty
                                ? BrandColors.textDisabled
                                : BrandColors.primary,
                          ),
                        ],
                      ),
                    ),
                    itemBuilder: (context) => availableBatchesForDropdown
                        .map((b) {
                          final displayName = (b.batchName != null &&
                                  b.batchName!.isNotEmpty)
                              ? b.batchName!
                              : b.batchNumber;
                          final hasQty = b.quantity > 0;
                          return PopupMenuItem<ItemBatchSummary>(
                            value: b,
                            enabled: hasQty,
                            child: Text(
                              '$displayName (${b.quantity})',
                              style: hasQty
                                  ? context.body(
                                      bold: true,
                                      color: BrandColors.primary,
                                    )
                                  : context.small(),
                            ),
                          );
                        })
                        .toList(),
                    onSelected: (b) {
                      formNotifier.addBatchToItem(
                        item.id,
                        b.batchNumber,
                        1,
                        costPrice: b.costPrice,
                        unitPrice: b.unitPrice,
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => formNotifier.deleteFromCart(item.id),
                  color: BrandColors.error,
                  tooltip: l10n.remove,
                ),
              ],
            ),
            SizedBox(height: AppSizes.xs),
            ...batches.asMap().entries.map((entry) {
              final index = entry.key;
              final batch = entry.value;
              ItemBatchSummary? summary;
              for (final b in item.batches) {
                if (b.batchNumber == batch.batchNumber) {
                  summary = b;
                  break;
                }
              }
              final displayName = summary != null &&
                      summary.batchName != null &&
                      summary.batchName!.isNotEmpty
                  ? summary.batchName!
                  : batch.batchNumber;
              final availQty = summary?.quantity ?? batch.quantity;
              final qty = batch.quantity;
              final price = showUnitPrice
                  ? (batch.unitPrice ?? 0)
                  : (batch.costPrice ?? 0);
              final hasPriceRow = showUnitPrice || showCostPrice;

              return Padding(
                padding: EdgeInsets.only(bottom: AppSizes.sm),
                child: hasPriceRow
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row 1: batch name + remove
                          Row(
                            children: [
                              SizedBox(width: AppSizes.md),
                              Expanded(
                                child: Text(
                                  '$displayName ($availQty)',
                                  style: context.small(),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () =>
                                    formNotifier.removeBatchFromItem(item.id, index),
                                color: BrandColors.error,
                                tooltip: l10n.remove,
                              ),
                            ],
                          ),
                          // Row 2: price (left) + spacer + qty controls (right)
                          Padding(
                            padding: EdgeInsets.only(left: AppSizes.md, top: AppSizes.xxs),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () => _showPriceDialog(
                                    context,
                                    ref,
                                    item.id,
                                    index,
                                    price,
                                    showUnitPrice,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppSizes.sm,
                                      vertical: AppSizes.xxs,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: BrandColors.divider),
                                      borderRadius:
                                          BorderRadius.circular(AppSizes.radiusSm),
                                    ),
                                    child: Text(
                                      Formatters.formatCurrency(price),
                                      style: context.small(bold: true),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: qty <= 1
                                      ? null
                                      : () => formNotifier.updateBatchQuantity(
                                          item.id, index, qty - 1),
                                  color: qty <= 1
                                      ? BrandColors.textDisabled
                                      : BrandColors.primary,
                                ),
                                InkWell(
                                  onTap: () => _showQtyDialog(
                                    context,
                                    ref,
                                    item.id,
                                    index,
                                    qty,
                                    availQty,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppSizes.md,
                                      vertical: AppSizes.xs,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: BrandColors.divider),
                                      borderRadius:
                                          BorderRadius.circular(AppSizes.radiusSm),
                                    ),
                                    child: Text(
                                      qty.toString(),
                                      style: context.body(bold: true),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: qty >= availQty
                                      ? null
                                      : () => formNotifier.updateBatchQuantity(
                                          item.id, index, qty + 1),
                                  color: qty >= availQty
                                      ? BrandColors.textDisabled
                                      : BrandColors.primary,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          SizedBox(width: AppSizes.md),
                          Expanded(
                            child: Text(
                              '$displayName ($availQty)',
                              style: context.small(),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: qty <= 1
                                ? null
                                : () => formNotifier.updateBatchQuantity(
                                    item.id, index, qty - 1),
                            color: qty <= 1
                                ? BrandColors.textDisabled
                                : BrandColors.primary,
                          ),
                          InkWell(
                            onTap: () => _showQtyDialog(
                              context,
                              ref,
                              item.id,
                              index,
                              qty,
                              availQty,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.md,
                                vertical: AppSizes.xs,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: BrandColors.divider),
                                borderRadius:
                                    BorderRadius.circular(AppSizes.radiusSm),
                              ),
                              child: Text(
                                qty.toString(),
                                style: context.body(bold: true),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: qty >= availQty
                                ? null
                                : () => formNotifier.updateBatchQuantity(
                                    item.id, index, qty + 1),
                            color: qty >= availQty
                                ? BrandColors.textDisabled
                                : BrandColors.primary,
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () =>
                                formNotifier.removeBatchFromItem(item.id, index),
                            color: BrandColors.error,
                            tooltip: l10n.remove,
                          ),
                        ],
                      ),
              );
            }),
            if (requiresBatch)
              Padding(
                padding: EdgeInsets.only(
                  left: AppSizes.md,
                  top: AppSizes.xs,
                  bottom: AppSizes.xs,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 16,
                      color: BrandColors.error,
                    ),
                    SizedBox(width: AppSizes.xs),
                    Expanded(
                      child: Text(
                        l10n.pleaseSelectBatchForItem,
                        style: context.small(color: BrandColors.error),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
